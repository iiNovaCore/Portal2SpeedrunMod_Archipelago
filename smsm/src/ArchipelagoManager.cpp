#include "ArchipelagoManager.h"
#include "Archipelago.h"
#include <sstream>
#include <iostream>
#include <fstream> 

// Force link the library
#pragma comment(lib, "APCpp.lib")

// -------------------------------------------------------------------------
// DEBUG LOGGER
// -------------------------------------------------------------------------
void LogToFile(std::string message) {
    std::ofstream outfile;
    // This creates "smsm_debug.txt" in your Portal 2 folder
    outfile.open("smsm_debug.txt", std::ios_base::app);
    if (outfile.is_open()) {
        outfile << "[AP_DEBUG] " << message << std::endl;
        outfile.close();
    }
}

// -------------------------------------------------------------------------
// CONNECTION LOGIC
// -------------------------------------------------------------------------

void ArchipelagoManager::Connect(std::string ip, std::string player_name, std::string password) {
    LogToFile("--- Connect Request Started ---");

    if (this->connected) {
        LogToFile("Aborting: Already connected.");
        return;
    }

    // 1. Store strings PERMANENTLY to prevent memory crash
    this->stored_ip = ip;
    this->stored_player = player_name;
    this->stored_pass = password;
    LogToFile("Strings stored safely.");

    // 2. Initialize
    LogToFile("Calling AP_Init(" + ip + ", " + player_name + ")...");
    AP_Init(this->stored_ip.c_str(), "Portal 2 Celeste Mode", this->stored_player.c_str(), this->stored_pass.c_str());
    LogToFile("AP_Init successful.");

    // 3. Set Version
    static AP_NetworkVersion version = { 0, 6, 2 };
    AP_SetClientVersion(&version);
    LogToFile("Client Version set to 0.6.2");

    // ==========================================================
    // REQUIRED CALLBACKS
    // ==========================================================

    // 1. Item Clear Callback
    AP_SetItemClearCallback([]() {
        LogToFile("CALLBACK: Server requested Item Clear.");
        ArchipelagoManager::Get().ClearItemQueue();
        });

    // 2. Location Checked Callback
    AP_SetLocationCheckedCallback([](int64_t loc_id) {
        LogToFile("CALLBACK: Location confirmed checked: " + std::to_string(loc_id));
        });

    // 3. Item Received Callback
    AP_SetItemRecvCallback([](int64_t item_id, bool notify) {
        LogToFile("CALLBACK TRIGGERED: Server sent ItemID " + std::to_string(item_id));
        ArchipelagoManager::Get().OnItemReceived(item_id);
        });

    // ==========================================================

    // 5. Start the Thread
    LogToFile("Calling AP_Start()...");
    try {
        AP_Start();
        LogToFile("AP_Start() returned successfully.");
    }
    catch (...) {
        LogToFile("CRITICAL ERROR: AP_Start() threw an unknown exception!");
        return;
    }

    this->connected = true;
    this->OnMessageReceived("Archipelago Client Connected.");
    LogToFile("--- Connect Sequence Complete ---");
}

void ArchipelagoManager::ForceResync() {
    std::lock_guard<std::mutex> lock(queueMutex);

    LogToFile("=== FORCE RESYNC REQUESTED ===");
    LogToFile("History contains " + std::to_string(itemHistory.size()) + " items.");

    // Clear current queue to avoid duplicates
    itemQueue.clear();

    // Push ALL historical items back into the active queue
    for (int64_t id : itemHistory) {
        itemQueue.push_back(id);
        LogToFile("Requeued Item: " + std::to_string(id));
    }

    LogToFile("=== RESYNC COMPLETE ===");
}

void ArchipelagoManager::SendCheck(int64_t location_id) {
    if (!this->connected) return;

    LogToFile("Sending Check for LocationID: " + std::to_string(location_id));
    AP_SendItem(location_id);
}

bool ArchipelagoManager::IsConnected() {
    return this->connected;
}

// -------------------------------------------------------------------------
// THREAD-SAFE HANDLERS
// -------------------------------------------------------------------------

void ArchipelagoManager::OnItemReceived(int64_t item_id) {
    std::lock_guard<std::mutex> lock(queueMutex);

    LogToFile("Pushing Item " + std::to_string(item_id) + " to queue.");

    // 1. Add to pending queue (for immediate processing)
    itemQueue.push_back(item_id);

    // 2. Add to HISTORY (New Logic for Moon Room Fix)
    // We check if it's already at the back to prevent spam, or just push it.
    // Pushing everything is safer for syncing.
    itemHistory.push_back(item_id);
}

void ArchipelagoManager::RefillQueue() {
    std::lock_guard<std::mutex> lock(queueMutex);

    if (itemHistory.empty()) {
        LogToFile("RefillQueue called, but history is empty.");
        return;
    }

    LogToFile("RefillQueue: Resending " + std::to_string(itemHistory.size()) + " items to script.");

    // Clear the current queue to avoid duplicates if we are doing a full refresh
    itemQueue.clear();

    // Copy everything from History into the Active Queue
    for (int64_t id : itemHistory) {
        itemQueue.push_back(id);
    }
}

void ArchipelagoManager::OnMessageReceived(std::string msg) {
    std::lock_guard<std::mutex> lock(queueMutex);
    messageQueue.push_back(msg);
}

void ArchipelagoManager::ClearItemQueue() {
    std::lock_guard<std::mutex> lock(queueMutex);
    LogToFile("Clearing Item Queue and History.");
    itemQueue.clear();
    itemHistory.clear(); // Important: Clear history on disconnect/slot change
}

// -------------------------------------------------------------------------
// GAME THREAD RETRIEVAL
// -------------------------------------------------------------------------

std::string ArchipelagoManager::PopPendingItemsString() {
    // Called by VScript/Game Loop
    std::lock_guard<std::mutex> lock(queueMutex);

    if (itemQueue.empty()) return "";

    std::stringstream ss;
    for (size_t i = 0; i < itemQueue.size(); ++i) {
        ss << itemQueue[i];
        if (i < itemQueue.size() - 1) {
            ss << ",";
        }
    }

    // Log what we are giving to the game
    // LogToFile("Game retrieved items: " + ss.str());

    itemQueue.clear();
    return ss.str();
}

std::string ArchipelagoManager::PopPendingMessagesString() {
    std::lock_guard<std::mutex> lock(queueMutex);

    if (messageQueue.empty()) return "";

    std::stringstream ss;
    for (size_t i = 0; i < messageQueue.size(); ++i) {
        ss << messageQueue[i];
        if (i < messageQueue.size() - 1) {
            ss << "|";
        }
    }
    messageQueue.clear();
    return ss.str();
}
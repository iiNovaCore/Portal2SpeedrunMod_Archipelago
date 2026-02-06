#pragma once
#include <string>
#include <vector>
#include <mutex>
#include "Archipelago.h" 

class ArchipelagoManager {
public:
    // Singleton Access
    static ArchipelagoManager& Get() {
        static ArchipelagoManager instance;
        return instance;
    }

    // Core Functions
    void Connect(std::string ip, std::string player_name, std::string password);
    void Disconnect();
    void SendCheck(int64_t location_id);
    bool IsConnected();

    // Callbacks
    void OnItemReceived(int64_t item_id);
    void OnMessageReceived(std::string msg);

    // Game Thread Retrieval
    std::string PopPendingItemsString();
    std::string PopPendingMessagesString();

private:
    ArchipelagoManager() = default;
    ~ArchipelagoManager() = default;

    // Internal State
    bool connected = false;
    bool initialized = false; // <--- THIS WAS MISSING

    // Stored Credentials
    std::string stored_ip;
    std::string stored_player;
    std::string stored_pass;

    // Thread Safety
    std::mutex queueMutex;
    std::vector<int64_t> itemQueue;
    std::vector<std::string> messageQueue;
};
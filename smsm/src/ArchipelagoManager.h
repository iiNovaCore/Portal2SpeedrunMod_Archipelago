#pragma once
#include <vector>
#include <string>
#include <mutex>
#include <cstdint> // Required for int64_t

class ArchipelagoManager {
public:
    // Singleton Accessor
    static ArchipelagoManager& Get() {
        static ArchipelagoManager instance;
        return instance;
    }
    void ForceResync();
    void RefillQueue();
    // Main Functions
    void Connect(std::string ip, std::string player_name, std::string password);
    void SendCheck(int64_t location_id);
    bool IsConnected();

    // VScript/Game Thread retrieval functions
    std::string PopPendingItemsString();
    std::string PopPendingMessagesString();

    // Callback Handlers (Called by AP Library background thread)
    void OnItemReceived(int64_t item_id);
    void OnMessageReceived(std::string msg);

    // Helper to clear local state (optional, used by ItemClear callback)
    void ClearItemQueue();

private:
    // Constructor/Destructor private for Singleton
    ArchipelagoManager() = default;
    ~ArchipelagoManager() = default;
    std::vector<int64_t> itemHistory;
    // --- State ---
    bool connected = false;

    // --- Thread Safety ---
    std::mutex queueMutex;
    std::vector<int64_t> itemQueue;
    std::vector<std::string> messageQueue;

    // --- Memory Persistence ---
    // These keep the strings alive so AP_Init doesn't read garbage memory
    std::string stored_ip;
    std::string stored_player;
    std::string stored_pass;
};
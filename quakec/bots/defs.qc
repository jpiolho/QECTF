.float bot_flag;
.void() bot_state;
.entity bot_target;

enum BotFlags : float {
    MARKED = 1 << 0
};
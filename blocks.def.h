//Modify this file to change what commands output to your statusbar, and recompile using the make command.
static const Block blocks[] = {
        /*Icon*/        /*Command*/             /*Update Interval*/     /*Update Signal*/
        {" ", "keyboard-layout",       0,              11},
        {"", "internet",               5,              0},
        {"", "battery",               20,             0},
        {"", "volume",                 0,              10},
        {"", "disk /dev/elxnoname-vg/root /",  60,             0},
        {"", "cpu",                    10,             0},
        {"", "memory",                 20,             0},
        {"", "clock",                50,             0},
};

//sets delimiter between status commands. NULL character ('\0') means no delimiter.
static char delim[] = " | ";
static unsigned int delimLen = 3;

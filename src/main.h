#ifndef MAIN_H
#define MAIN_H

#include <pokeagb/pokeagb.h>

#define CONFIGURED_FLAG 0x1777

u8 main();

POKEAGB_EXTERN u8 check_flag(u16 flag);
POKEAGB_EXTERN u8 clear_flag(u16 flag);

extern pchar *new_msg;



#endif
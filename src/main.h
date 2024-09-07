#ifndef MAIN_H
#define MAIN_H

#include <pokeagb/pokeagb.h>

#define CONFIGURED_FLAG 0x1777

u8 main();

POKEAGB_EXTERN u8 check_flag(u16 flag);
POKEAGB_EXTERN u8 clear_flag(u16 flag);
POKEAGB_EXTERN void deleteme(u32 unk, u8 stat_id, u8 unk2);
POKEAGB_EXTERN void deleteme2();


extern pchar *new_msg;



#endif
#ifndef MAIN_C
#define MAIN_C

#include "main.h"

u8 main(){
    if(check_flag(CONFIGURED_FLAG) != 1){
        return 0;
    }

    pchar *str_ptr = (pchar *)0x0202298C; //str buffer
    while(*str_ptr != 0xFB){
        str_ptr++;
    }
    pstrcpy(str_ptr, &new_msg);
    clear_flag(CONFIGURED_FLAG);
    return 1;
}

#endif
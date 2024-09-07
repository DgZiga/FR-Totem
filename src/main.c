#ifndef MAIN_C
#define MAIN_C

#include "main.h"

u8 main(){
    if(check_flag(CONFIGURED_FLAG) != 1){
        return 0;
    }

    pchar *str_ptr = (pchar *)0x0202298C;
    while(*str_ptr != 0xFB){
        str_ptr++;
    }
    memcpy(str_ptr, &new_msg, 35);
    clear_flag(CONFIGURED_FLAG);
    //deleteme(0xFFFFFF90, 1, 1);
    deleteme2();
    return 1;
}

#endif
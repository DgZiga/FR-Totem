08032b4d chiama battle_draw_rbox con "Wild x appeared"

080D7274 è battle_pick_message, inserisce il messaggio a 0202298C e viene chiamato con r0
i valori di r0 possono essere
0: battle_begin
1: send_out_1
2: withdraw_pokemon
3: send_out_2
4: use_move
5: battle_end
?
0xC: battle_string_table[0]
0xD: battle_string_table[1]

chiamato da 08032b18
Se mi metto qui e faccio il controllo della flag posso modificare il testo a 0202298C (cambiare 0xFB che chiuderebbe il testo con 0xFA e inserire il mio)
il buffer a 0202298C è lungo 300 byte.
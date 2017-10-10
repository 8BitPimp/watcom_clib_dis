Module: grabfp87
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 0000002E bytes
0000				__GrabFP87:
0000  81 3D 00 00 00 00 00 00 00 00
					cmp		dword ptr __FPE_handler_exit,offset __Fini_FPE_handler
000A  0F 84 00 00 00 00			je		__Enable_FPE
0010  C7 05 00 00 00 00 00 00 00 00
					mov		dword ptr __FPE_handler,offset __sigfpe_handler
001A  E8 00 00 00 00			call		__Init_FPE_handler
001F  C7 05 00 00 00 00 00 00 00 00
					mov		dword ptr __FPE_handler_exit,offset __Fini_FPE_handler
0029  E9 00 00 00 00			jmp		__Enable_FPE

Routine Size: 46 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes


Module: hdopen
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 0000006B bytes
0000				check_mode_:
0000  31 C0				xor		eax,eax
0002  C3				ret		

Routine Size: 3 bytes,    Routine Base: _TEXT + 0000

0003				_dopen_:

Routine Size: 0 bytes,    Routine Base: _TEXT + 0003

0003				_hdopen_:
0003  53				push		ebx
0004  51				push		ecx
0005  56				push		esi
0006  89 C3				mov		ebx,eax
0008  89 D1				mov		ecx,edx
000A  83 F8 FF				cmp		eax,0xffffffff
000D  74 56				je		L$7
000F  E8 00 00 00 00			call		check_mode_
0014  85 C0				test		eax,eax
0016  74 07				je		L$1
0018  BB FF FF FF FF			mov		ebx,0xffffffff
001D  EB 46				jmp		L$7
001F				L$1:
001F  89 D8				mov		eax,ebx
0021  89 CE				mov		esi,ecx
0023  FF 15 00 00 00 00			call		dword ptr __InitAccessH
0029  89 C3				mov		ebx,eax
002B  E8 00 00 00 00			call		__IOMode_
0030  24 3C				and		al,0x3c
0032  83 E6 03				and		esi,0x00000003
0035  89 C2				mov		edx,eax
0037  83 FE 02				cmp		esi,0x00000002
003A  75 03				jne		L$2
003C  80 CA 03				or		dl,0x03
003F				L$2:
003F  85 F6				test		esi,esi
0041  75 03				jne		L$3
0043  80 CA 01				or		dl,0x01
0046				L$3:
0046  83 FE 01				cmp		esi,0x00000001
0049  75 03				jne		L$4
004B  80 CA 02				or		dl,0x02
004E				L$4:
004E  F6 C1 10				test		cl,0x10
0051  74 03				je		L$5
0053  80 CA 80				or		dl,0x80
0056				L$5:
0056  F6 C5 02				test		ch,0x02
0059  74 03				je		L$6
005B  80 CA 40				or		dl,0x40
005E				L$6:
005E  89 D8				mov		eax,ebx
0060  E8 00 00 00 00			call		__SetIOMode_
0065				L$7:
0065  89 D8				mov		eax,ebx
0067  5E				pop		esi
0068  59				pop		ecx
0069  5B				pop		ebx
006A  C3				ret		

Routine Size: 104 bytes,    Routine Base: _TEXT + 0003

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes


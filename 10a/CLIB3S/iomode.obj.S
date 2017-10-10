Module: iomode
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 0000006C bytes
0000				__IOMode:
0000  53				push		ebx
0001  56				push		esi
0002  8B 74 24 0C			mov		esi,dword ptr 0xc[esp]
0006  3B 35 00 00 00 00			cmp		esi,dword ptr __NFiles
000C  72 05				jb		L$1
000E  31 C0				xor		eax,eax
0010  5E				pop		esi
0011  5B				pop		ebx
0012  C3				ret		
0013				L$1:
0013  83 FE 05				cmp		esi,0x00000005
0016  7F 33				jg		L$2
0018  89 F3				mov		ebx,esi
001A  A1 00 00 00 00			mov		eax,dword ptr _iomode
001F  C1 E3 02				shl		ebx,0x02
0022  01 D8				add		eax,ebx
0024  8A 50 01				mov		dl,byte ptr 0x1[eax]
0027  F6 C2 40				test		dl,0x40
002A  75 1F				jne		L$2
002C  88 D6				mov		dh,dl
002E  80 CE 40				or		dh,0x40
0031  56				push		esi
0032  88 70 01				mov		byte ptr 0x1[eax],dh
0035  E8 00 00 00 00			call		isatty
003A  83 C4 04				add		esp,0x00000004
003D  85 C0				test		eax,eax
003F  74 0A				je		L$2
0041  A1 00 00 00 00			mov		eax,dword ptr _iomode
0046  80 4C 03 01 20			or		byte ptr 0x1[ebx+eax],0x20
004B				L$2:
004B  A1 00 00 00 00			mov		eax,dword ptr _iomode
0050  8B 04 B0				mov		eax,dword ptr [eax+esi*4]
0053  5E				pop		esi
0054  5B				pop		ebx
0055  C3				ret		

Routine Size: 86 bytes,    Routine Base: _TEXT + 0000

0056				__SetIOMode:
0056  53				push		ebx
0057  8B 54 24 0C			mov		edx,dword ptr 0xc[esp]
005B  8B 5C 24 08			mov		ebx,dword ptr 0x8[esp]
005F  A1 00 00 00 00			mov		eax,dword ptr _iomode
0064  80 CE 40				or		dh,0x40
0067  89 14 98				mov		dword ptr [eax+ebx*4],edx
006A  5B				pop		ebx
006B  C3				ret		

Routine Size: 22 bytes,    Routine Base: _TEXT + 0056

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000058 bytes
0000				__NFiles:
0000  14 00 00 00                                     ....
0004				__init_mode:
0004  01 00 00 00 02 00 00 00 02 00 00 00 03 00 00 00 ................
0014  02 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
0024  00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
0034  00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
0044  00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
0054				_iomode:
0054  00 00 00 00                                     DD	offset __init_mode

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes


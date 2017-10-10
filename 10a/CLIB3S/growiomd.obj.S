Module: growiomd
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 000000AF bytes
0000				__grow_iomode:
0000  53				push		ebx
0001  56				push		esi
0002  57				push		edi
0003  FF 15 00 00 00 00			call		dword ptr _AccessIOB
0009  8B 44 24 10			mov		eax,dword ptr 0x10[esp]
000D  8B 15 00 00 00 00			mov		edx,dword ptr _iomode
0013  C1 E0 02				shl		eax,0x02
0016  81 FA 00 00 00 00			cmp		edx,offset __init_mode
001C  75 39				jne		L$1
001E  50				push		eax
001F  6A 00				push		0x00000000
0021  E8 00 00 00 00			call		realloc
0026  83 C4 08				add		esp,0x00000008
0029  89 C3				mov		ebx,eax
002B  85 C0				test		eax,eax
002D  74 34				je		L$2
002F  BE 00 00 00 00			mov		esi,offset __init_mode
0034  8B 0D 00 00 00 00			mov		ecx,dword ptr __NFiles
003A  89 C7				mov		edi,eax
003C  C1 E1 02				shl		ecx,0x02
003F  06				push		es
0040  8C D8				mov		eax,ds
0042  8E C0				mov		es,eax
0044  57				push		edi
0045  89 C8				mov		eax,ecx
0047  C1 E9 02				shr		ecx,0x02
004A  F2 A5				repne movsd	
004C  8A C8				mov		cl,al
004E  80 E1 03				and		cl,0x03
0051  F2 A4				repne movsb	
0053  5F				pop		edi
0054  07				pop		es
0055  EB 0C				jmp		L$2
0057				L$1:
0057  50				push		eax
0058  52				push		edx
0059  E8 00 00 00 00			call		realloc
005E  83 C4 08				add		esp,0x00000008
0061  89 C3				mov		ebx,eax
0063				L$2:
0063  85 DB				test		ebx,ebx
0065  75 0D				jne		L$3
0067  E8 00 00 00 00			call		__get_errno_ptr
006C  C7 00 05 00 00 00			mov		dword ptr [eax],0x00000005
0072  EB 31				jmp		L$4
0074				L$3:
0074  8B 44 24 10			mov		eax,dword ptr 0x10[esp]
0078  8B 0D 00 00 00 00			mov		ecx,dword ptr __NFiles
007E  29 C8				sub		eax,ecx
0080  C1 E0 02				shl		eax,0x02
0083  50				push		eax
0084  89 C8				mov		eax,ecx
0086  C1 E0 02				shl		eax,0x02
0089  6A 00				push		0x00000000
008B  01 D8				add		eax,ebx
008D  50				push		eax
008E  E8 00 00 00 00			call		memset
0093  83 C4 0C				add		esp,0x0000000c
0096  8B 44 24 10			mov		eax,dword ptr 0x10[esp]
009A  89 1D 00 00 00 00			mov		dword ptr _iomode,ebx
00A0  A3 00 00 00 00			mov		dword ptr __NFiles,eax
00A5				L$4:
00A5  FF 15 00 00 00 00			call		dword ptr _ReleaseIOB
00AB  5F				pop		edi
00AC  5E				pop		esi
00AD  5B				pop		ebx
00AE  C3				ret		

Routine Size: 175 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes


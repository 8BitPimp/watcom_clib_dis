Module: register
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000086 bytes
0000				__CInitThread:
0000  31 C0				xor		eax,eax
0002  C3				ret		

Routine Size: 3 bytes,    Routine Base: _TEXT + 0000

0003				_beginthread:
0003  53				push		ebx
0004  56				push		esi
0005  8B 54 24 18			mov		edx,dword ptr 0x18[esp]
0009  52				push		edx
000A  8B 5C 24 18			mov		ebx,dword ptr 0x18[esp]
000E  53				push		ebx
000F  8B 4C 24 18			mov		ecx,dword ptr 0x18[esp]
0013  51				push		ecx
0014  8B 74 24 18			mov		esi,dword ptr 0x18[esp]
0018  56				push		esi
0019  FF 15 00 00 00 00			call		dword ptr __BeginThread
001F  83 C4 10				add		esp,0x00000010
0022  5E				pop		esi
0023  5B				pop		ebx
0024  C3				ret		

Routine Size: 34 bytes,    Routine Base: _TEXT + 0003

0025				_endthread:
0025  FF 15 00 00 00 00			call		dword ptr __EndThread
002B  C3				ret		

Routine Size: 7 bytes,    Routine Base: _TEXT + 0025

002C				__initthread:
002C  8B 54 24 04			mov		edx,dword ptr 0x4[esp]
0030  52				push		edx
0031  FF 15 00 00 00 00			call		dword ptr __InitThread
0037  83 C4 04				add		esp,0x00000004
003A  C3				ret		

Routine Size: 15 bytes,    Routine Base: _TEXT + 002C

003B				__RegisterThreadData:
003B  53				push		ebx
003C  56				push		esi
003D  8B 44 24 0C			mov		eax,dword ptr 0xc[esp]
0041  8B 5C 24 10			mov		ebx,dword ptr 0x10[esp]
0045  8B 54 24 14			mov		edx,dword ptr 0x14[esp]
0049  85 C0				test		eax,eax
004B  74 10				je		L$1
004D  8B 08				mov		ecx,dword ptr [eax]
004F  8B 35 00 00 00 00			mov		esi,dword ptr __BeginThread
0055  89 0D 00 00 00 00			mov		dword ptr __BeginThread,ecx
005B  89 30				mov		dword ptr [eax],esi
005D				L$1:
005D  85 DB				test		ebx,ebx
005F  74 0F				je		L$2
0061  8B 03				mov		eax,dword ptr [ebx]
0063  8B 0D 00 00 00 00			mov		ecx,dword ptr __EndThread
0069  A3 00 00 00 00			mov		dword ptr __EndThread,eax
006E  89 0B				mov		dword ptr [ebx],ecx
0070				L$2:
0070  85 D2				test		edx,edx
0072  74 0F				je		L$3
0074  8B 02				mov		eax,dword ptr [edx]
0076  8B 1D 00 00 00 00			mov		ebx,dword ptr __InitThread
007C  A3 00 00 00 00			mov		dword ptr __InitThread,eax
0081  89 1A				mov		dword ptr [edx],ebx
0083				L$3:
0083  5E				pop		esi
0084  5B				pop		ebx
0085  C3				ret		

Routine Size: 75 bytes,    Routine Base: _TEXT + 003B

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 0000000C bytes
0000				__BeginThread:
0000  00 00 00 00                                     DD	offset __CBeginThread
0004				__EndThread:
0004  00 00 00 00                                     DD	offset __CEndThread
0008				__InitThread:
0008  00 00 00 00                                     DD	offset __CInitThread

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes


Module: atexit
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000073 bytes
0000				_Full_at_exit_rtn_:
0000  53				push		ebx
0001  52				push		edx
0002  83 EC 04				sub		esp,0x00000004
0005  BA 20 00 00 00			mov		edx,0x00000020
000A  8B 1D 00 00 00 00			mov		ebx,dword ptr __ExitCount
0010  89 15 00 00 00 00			mov		dword ptr __ExitCount,edx
0016  89 DA				mov		edx,ebx
0018  C1 E2 02				shl		edx,0x02
001B				L$1:
001B  85 D2				test		edx,edx
001D  74 12				je		L$2
001F  8B 82 FC FF FF FF			mov		eax,dword ptr __ExitList-0x4[edx]
0025  83 EA 04				sub		edx,0x00000004
0028  89 04 24				mov		dword ptr [esp],eax
002B  4B				dec		ebx
002C  FF 14 24				call		dword ptr [esp]
002F  EB EA				jmp		L$1
0031				L$2:
0031  83 C4 04				add		esp,0x00000004
0034  5A				pop		edx
0035  5B				pop		ebx
0036  C3				ret		

Routine Size: 55 bytes,    Routine Base: _TEXT + 0000

0037				atexit_:
0037  53				push		ebx
0038  51				push		ecx
0039  52				push		edx
003A  89 C3				mov		ebx,eax
003C  BA 00 00 00 00			mov		edx,offset _Full_at_exit_rtn_
0041  8B 0D 00 00 00 00			mov		ecx,dword ptr __ExitCount
0047  89 15 00 00 00 00			mov		dword ptr ___atexit,edx
004D  83 F9 20				cmp		ecx,0x00000020
0050  7D 18				jge		L$3
0052  89 C8				mov		eax,ecx
0054  8D 51 01				lea		edx,0x1[ecx]
0057  89 1C 8D 00 00 00 00		mov		dword ptr __ExitList[ecx*4],ebx
005E  89 15 00 00 00 00			mov		dword ptr __ExitCount,edx
0064  31 C8				xor		eax,ecx
0066  5A				pop		edx
0067  59				pop		ecx
0068  5B				pop		ebx
0069  C3				ret		
006A				L$3:
006A  B8 FF FF FF FF			mov		eax,0xffffffff
006F  5A				pop		edx
0070  59				pop		ecx
0071  5B				pop		ebx
0072  C3				ret		

Routine Size: 60 bytes,    Routine Base: _TEXT + 0037

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000084 bytes
0000				__ExitList:
0080				__ExitCount:

BSS Size: 132 bytes


Module: d2ttime
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000074 bytes
0000				_d2ttime:
0000  83 EC 24				sub		esp,0x00000024
0003  8B 54 24 2C			mov		edx,dword ptr 0x2c[esp]
0007  8B 44 24 28			mov		eax,dword ptr 0x28[esp]
000B  25 00 FE 00 00			and		eax,0x0000fe00
0010  C1 E8 09				shr		eax,0x09
0013  83 C0 50				add		eax,0x00000050
0016  89 44 24 14			mov		dword ptr 0x14[esp],eax
001A  8B 44 24 28			mov		eax,dword ptr 0x28[esp]
001E  25 E0 01 00 00			and		eax,0x000001e0
0023  C1 E8 05				shr		eax,0x05
0026  48				dec		eax
0027  89 44 24 10			mov		dword ptr 0x10[esp],eax
002B  8B 44 24 28			mov		eax,dword ptr 0x28[esp]
002F  83 E0 1F				and		eax,0x0000001f
0032  89 44 24 0C			mov		dword ptr 0xc[esp],eax
0036  89 D0				mov		eax,edx
0038  25 00 F8 00 00			and		eax,0x0000f800
003D  C1 E8 0B				shr		eax,0x0b
0040  89 44 24 08			mov		dword ptr 0x8[esp],eax
0044  89 D0				mov		eax,edx
0046  25 E0 07 00 00			and		eax,0x000007e0
004B  C1 E8 05				shr		eax,0x05
004E  89 44 24 04			mov		dword ptr 0x4[esp],eax
0052  89 D0				mov		eax,edx
0054  83 E0 1F				and		eax,0x0000001f
0057  01 C0				add		eax,eax
0059  89 04 24				mov		dword ptr [esp],eax
005C  89 E0				mov		eax,esp
005E  BA FF FF FF FF			mov		edx,0xffffffff
0063  50				push		eax
0064  89 54 24 24			mov		dword ptr 0x24[esp],edx
0068  E8 00 00 00 00			call		mktime
006D  83 C4 04				add		esp,0x00000004
0070  83 C4 24				add		esp,0x00000024
0073  C3				ret		

Routine Size: 116 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes


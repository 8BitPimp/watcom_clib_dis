Module: jstricmp
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 000000B3 bytes
0000				jstricmp:
0000  53				push		ebx
0001  56				push		esi
0002  83 EC 08				sub		esp,0x00000008
0005  8B 5C 24 14			mov		ebx,dword ptr 0x14[esp]
0009  8B 74 24 18			mov		esi,dword ptr 0x18[esp]
000D				L$1:
000D  8D 44 24 04			lea		eax,0x4[esp]
0011  50				push		eax
0012  53				push		ebx
0013  E8 00 00 00 00			call		jgetmoji
0018  83 C4 08				add		esp,0x00000008
001B  89 C3				mov		ebx,eax
001D  89 E0				mov		eax,esp
001F  50				push		eax
0020  56				push		esi
0021  E8 00 00 00 00			call		jgetmoji
0026  83 C4 08				add		esp,0x00000008
0029  89 C6				mov		esi,eax
002B  8B 44 24 04			mov		eax,dword ptr 0x4[esp]
002F  30 C0				xor		al,al
0031  25 FF FF 00 00			and		eax,0x0000ffff
0036  74 0F				je		L$2
0038  31 C0				xor		eax,eax
003A  66 8B 44 24 04			mov		ax,word ptr 0x4[esp]
003F  50				push		eax
0040  E8 00 00 00 00			call		jtoupper
0045  EB 0B				jmp		L$3
0047				L$2:
0047  66 8B 44 24 04			mov		ax,word ptr 0x4[esp]
004C  50				push		eax
004D  E8 00 00 00 00			call		toupper
0052				L$3:
0052  83 C4 04				add		esp,0x00000004
0055  89 44 24 04			mov		dword ptr 0x4[esp],eax
0059  8B 04 24				mov		eax,dword ptr [esp]
005C  30 C0				xor		al,al
005E  25 FF FF 00 00			and		eax,0x0000ffff
0063  74 0E				je		L$4
0065  31 C0				xor		eax,eax
0067  66 8B 04 24			mov		ax,word ptr [esp]
006B  50				push		eax
006C  E8 00 00 00 00			call		jtoupper
0071  EB 0A				jmp		L$5
0073				L$4:
0073  66 8B 04 24			mov		ax,word ptr [esp]
0077  50				push		eax
0078  E8 00 00 00 00			call		toupper
007D				L$5:
007D  83 C4 04				add		esp,0x00000004
0080  89 04 24				mov		dword ptr [esp],eax
0083  8B 44 24 04			mov		eax,dword ptr 0x4[esp]
0087  8B 14 24				mov		edx,dword ptr [esp]
008A  66 39 D0				cmp		ax,dx
008D  74 10				je		L$7
008F  73 07				jae		L$6
0091  B8 FF FF FF FF			mov		eax,0xffffffff
0096  EB 15				jmp		L$8
0098				L$6:
0098  B8 01 00 00 00			mov		eax,0x00000001
009D  EB 0E				jmp		L$8
009F				L$7:
009F  66 83 7C 24 04 00			cmp		word ptr 0x4[esp],0x0000
00A5  0F 85 62 FF FF FF			jne		L$1
00AB  31 C0				xor		eax,eax
00AD				L$8:
00AD  83 C4 08				add		esp,0x00000008
00B0  5E				pop		esi
00B1  5B				pop		ebx
00B2  C3				ret		

Routine Size: 179 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes


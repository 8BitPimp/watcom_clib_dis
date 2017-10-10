Module: jstrncpy
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000082 bytes
0000				jstrncpy:
0000  53				push		ebx
0001  56				push		esi
0002  57				push		edi
0003  55				push		ebp
0004  83 EC 04				sub		esp,0x00000004
0007  8B 5C 24 1C			mov		ebx,dword ptr 0x1c[esp]
000B  8B 6C 24 20			mov		ebp,dword ptr 0x20[esp]
000F  8B 44 24 18			mov		eax,dword ptr 0x18[esp]
0013  31 D2				xor		edx,edx
0015  EB 5B				jmp		L$6
0017				L$1:
0017  0F B6 33				movzx		esi,byte ptr [ebx]
001A  8A 8E 01 00 00 00			mov		cl,byte ptr _IsKTable+0x1[esi]
0020  80 E1 04				and		cl,0x04
0023  0F B6 F1				movzx		esi,cl
0026  89 34 24				mov		dword ptr [esp],esi
0029  8D 7B 01				lea		edi,0x1[ebx]
002C  8B 0C 24				mov		ecx,dword ptr [esp]
002F  8D 70 01				lea		esi,0x1[eax]
0032  85 C9				test		ecx,ecx
0034  74 22				je		L$3
0036  8A 1B				mov		bl,byte ptr [ebx]
0038  88 18				mov		byte ptr [eax],bl
003A  8A 07				mov		al,byte ptr [edi]
003C  8D 5F 01				lea		ebx,0x1[edi]
003F  88 C1				mov		cl,al
0041  88 06				mov		byte ptr [esi],al
0043  8D 46 01				lea		eax,0x1[esi]
0046  84 C9				test		cl,cl
0048  75 27				jne		L$5
004A  83 E8 02				sub		eax,0x00000002
004D				L$2:
004D  42				inc		edx
004E  39 EA				cmp		edx,ebp
0050  77 24				ja		L$7
0052  C6 00 00				mov		byte ptr [eax],0x00
0055  40				inc		eax
0056  EB F5				jmp		L$2
0058				L$3:
0058  8A 1B				mov		bl,byte ptr [ebx]
005A  88 D9				mov		cl,bl
005C  88 18				mov		byte ptr [eax],bl
005E  89 FB				mov		ebx,edi
0060  89 F0				mov		eax,esi
0062  84 C9				test		cl,cl
0064  75 0B				jne		L$5
0066				L$4:
0066  42				inc		edx
0067  39 EA				cmp		edx,ebp
0069  73 0B				jae		L$7
006B  C6 00 00				mov		byte ptr [eax],0x00
006E  40				inc		eax
006F  EB F5				jmp		L$4
0071				L$5:
0071  42				inc		edx
0072				L$6:
0072  39 EA				cmp		edx,ebp
0074  72 A1				jb		L$1
0076				L$7:
0076  8B 44 24 18			mov		eax,dword ptr 0x18[esp]
007A  83 C4 04				add		esp,0x00000004
007D  5D				pop		ebp
007E  5F				pop		edi
007F  5E				pop		esi
0080  5B				pop		ebx
0081  C3				ret		

Routine Size: 130 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes


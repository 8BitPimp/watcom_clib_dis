Module: fjstrncp
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 000000BC bytes
0000				_fjstrncpy:
0000  53				push		ebx
0001  56				push		esi
0002  57				push		edi
0003  06				push		es
0004  0F A0				push		fs
0006  0F A8				push		gs
0008  55				push		ebp
0009  83 EC 08				sub		esp,0x00000008
000C  8B 5C 24 34			mov		ebx,dword ptr 0x34[esp]
0010  8B 6C 24 3C			mov		ebp,dword ptr 0x3c[esp]
0014  C4 44 24 2C			les		eax,fword ptr 0x2c[esp]
0018  31 D2				xor		edx,edx
001A  E9 80 00 00 00			jmp		L$6
001F				L$1:
001F  8E 64 24 38			mov		fs,dword ptr 0x38[esp]
0023  64 0F B6 33			movzx		esi,byte ptr fs:[ebx]
0027  8A 8E 01 00 00 00			mov		cl,byte ptr _IsKTable+0x1[esi]
002D  8B 7C 24 38			mov		edi,dword ptr 0x38[esp]
0031  80 E1 04				and		cl,0x04
0034  89 7C 24 04			mov		dword ptr 0x4[esp],edi
0038  0F B6 F1				movzx		esi,cl
003B  8D 7B 01				lea		edi,0x1[ebx]
003E  89 34 24				mov		dword ptr [esp],esi
0041  8C C6				mov		esi,es
0043  8B 0C 24				mov		ecx,dword ptr [esp]
0046  8E E6				mov		fs,esi
0048  8D 70 01				lea		esi,0x1[eax]
004B  85 C9				test		ecx,ecx
004D  74 2F				je		L$3
004F  8E 6C 24 38			mov		gs,dword ptr 0x38[esp]
0053  65 8A 1B				mov		bl,byte ptr gs:[ebx]
0056  26 88 18				mov		byte ptr es:[eax],bl
0059  8E 6C 24 04			mov		gs,dword ptr 0x4[esp]
005D  65 8A 07				mov		al,byte ptr gs:[edi]
0060  8D 5F 01				lea		ebx,0x1[edi]
0063  88 C1				mov		cl,al
0065  64 88 06				mov		byte ptr fs:[esi],al
0068  8D 46 01				lea		eax,0x1[esi]
006B  84 C9				test		cl,cl
006D  75 2F				jne		L$5
006F  83 E8 02				sub		eax,0x00000002
0072				L$2:
0072  42				inc		edx
0073  39 EA				cmp		edx,ebp
0075  77 30				ja		L$7
0077  26 C6 00 00			mov		byte ptr es:[eax],0x00
007B  40				inc		eax
007C  EB F4				jmp		L$2
007E				L$3:
007E  8E 64 24 38			mov		fs,dword ptr 0x38[esp]
0082  64 8A 1B				mov		bl,byte ptr fs:[ebx]
0085  88 D9				mov		cl,bl
0087  26 88 18				mov		byte ptr es:[eax],bl
008A  89 FB				mov		ebx,edi
008C  89 F0				mov		eax,esi
008E  84 C9				test		cl,cl
0090  75 0C				jne		L$5
0092				L$4:
0092  42				inc		edx
0093  39 EA				cmp		edx,ebp
0095  73 10				jae		L$7
0097  26 C6 00 00			mov		byte ptr es:[eax],0x00
009B  40				inc		eax
009C  EB F4				jmp		L$4
009E				L$5:
009E  42				inc		edx
009F				L$6:
009F  39 EA				cmp		edx,ebp
00A1  0F 82 78 FF FF FF			jb		L$1
00A7				L$7:
00A7  8B 54 24 30			mov		edx,dword ptr 0x30[esp]
00AB  8B 44 24 2C			mov		eax,dword ptr 0x2c[esp]
00AF  83 C4 08				add		esp,0x00000008
00B2  5D				pop		ebp
00B3  0F A9				pop		gs
00B5  0F A1				pop		fs
00B7  07				pop		es
00B8  5F				pop		edi
00B9  5E				pop		esi
00BA  5B				pop		ebx
00BB  CB				retf		

Routine Size: 188 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes


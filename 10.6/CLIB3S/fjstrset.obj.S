Module: fjstrset
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 000000AA bytes
0000				_fjstrset:
0000  53				push		ebx
0001  56				push		esi
0002  57				push		edi
0003  06				push		es
0004  55				push		ebp
0005  83 EC 08				sub		esp,0x00000008
0008  8B 74 24 24			mov		esi,dword ptr 0x24[esp]
000C  8B 44 24 28			mov		eax,dword ptr 0x28[esp]
0010  89 F7				mov		edi,esi
0012  89 C1				mov		ecx,eax
0014  89 44 24 04			mov		dword ptr 0x4[esp],eax
0018  06				push		es
0019  8E C1				mov		es,ecx
001B  31 C0				xor		eax,eax
001D  89 C1				mov		ecx,eax
001F  49				dec		ecx
0020  F2 AE				repne scasb	
0022  F7 D1				not		ecx
0024  49				dec		ecx
0025  07				pop		es
0026  31 C0				xor		eax,eax
0028  66 8B 44 24 2C			mov		ax,word ptr 0x2c[esp]
002D  89 F5				mov		ebp,esi
002F  50				push		eax
0030  89 CF				mov		edi,ecx
0032  89 4C 24 04			mov		dword ptr 0x4[esp],ecx
0036  E8 00 00 00 00			call		jiszen
003B  83 C4 04				add		esp,0x00000004
003E  85 C0				test		eax,eax
0040  74 3C				je		L$3
0042  D1 EF				shr		edi,0x01
0044  31 DB				xor		ebx,ebx
0046  EB 22				jmp		L$2
0048				L$1:
0048  31 C0				xor		eax,eax
004A  66 8B 44 24 2C			mov		ax,word ptr 0x2c[esp]
004F  50				push		eax
0050  31 C0				xor		eax,eax
0052  66 8B 44 24 2C			mov		ax,word ptr 0x2c[esp]
0057  50				push		eax
0058  56				push		esi
0059  43				inc		ebx
005A  9A 00 00 00 00 00 00		call		_fjputmoji
0061  83 C4 0C				add		esp,0x0000000c
0064  89 C6				mov		esi,eax
0066  89 54 24 28			mov		dword ptr 0x28[esp],edx
006A				L$2:
006A  39 FB				cmp		ebx,edi
006C  72 DA				jb		L$1
006E  F6 04 24 01			test		byte ptr [esp],0x01
0072  74 27				je		L$4
0074  8E 44 24 28			mov		es,dword ptr 0x28[esp]
0078  26 C6 06 20			mov		byte ptr es:[esi],0x20
007C  EB 1D				jmp		L$4
007E				L$3:
007E  8A 44 24 2C			mov		al,byte ptr 0x2c[esp]
0082  8B 54 24 28			mov		edx,dword ptr 0x28[esp]
0086  89 F9				mov		ecx,edi
0088  89 F7				mov		edi,esi
008A  06				push		es
008B  57				push		edi
008C  8E C2				mov		es,edx
008E  88 C4				mov		ah,al
0090  D1 E9				shr		ecx,0x01
0092  F2 66 AB				repne stosw	
0095  11 C9				adc		ecx,ecx
0097  F2 AA				repne stosb	
0099  5F				pop		edi
009A  07				pop		es
009B				L$4:
009B  8B 54 24 04			mov		edx,dword ptr 0x4[esp]
009F  89 E8				mov		eax,ebp
00A1  83 C4 08				add		esp,0x00000008
00A4  5D				pop		ebp
00A5  07				pop		es
00A6  5F				pop		edi
00A7  5E				pop		esi
00A8  5B				pop		ebx
00A9  CB				retf		

Routine Size: 170 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes


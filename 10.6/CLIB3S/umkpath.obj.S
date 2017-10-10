Module: umkpath
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000140 bytes
0000				pickup:
0000  55				push		ebp
0001  89 E5				mov		ebp,esp
0003  8B 55 08				mov		edx,dword ptr 0x8[ebp]
0006  8B 45 0C				mov		eax,dword ptr 0xc[ebp]
0009  83 FA 5C				cmp		edx,0x0000005c
000C  74 05				je		L$1
000E  83 FA 2F				cmp		edx,0x0000002f
0011  75 09				jne		L$3
0013				L$1:
0013  83 38 00				cmp		dword ptr [eax],0x00000000
0016  75 02				jne		L$2
0018  89 10				mov		dword ptr [eax],edx
001A				L$2:
001A  8B 10				mov		edx,dword ptr [eax]
001C				L$3:
001C  89 D0				mov		eax,edx
001E  5D				pop		ebp
001F  C3				ret		

Routine Size: 32 bytes,    Routine Base: _TEXT + 0000

0020				_u_makepath:
0020  53				push		ebx
0021  56				push		esi
0022  57				push		edi
0023  C8 08 00 00			enter		0x0008,0x00
0027  8B 5D 14				mov		ebx,dword ptr 0x14[ebp]
002A  8B 45 18				mov		eax,dword ptr 0x18[ebp]
002D  8B 7D 20				mov		edi,dword ptr 0x20[ebp]
0030  8B 75 24				mov		esi,dword ptr 0x24[ebp]
0033  C7 45 F8 00 00 00 00		mov		dword ptr -0x8[ebp],0x00000000
003A  85 C0				test		eax,eax
003C  74 15				je		L$4
003E  66 83 38 00			cmp		word ptr [eax],0x0000
0042  74 0F				je		L$4
0044  66 8B 00				mov		ax,word ptr [eax]
0047  66 89 03				mov		word ptr [ebx],ax
004A  43				inc		ebx
004B  43				inc		ebx
004C  66 C7 03 3A 00			mov		word ptr [ebx],0x003a
0051  43				inc		ebx
0052  43				inc		ebx
0053				L$4:
0053  66 C7 03 00 00			mov		word ptr [ebx],0x0000
0058  83 7D 1C 00			cmp		dword ptr 0x1c[ebp],0x00000000
005C  74 4E				je		L$8
005E  8B 45 1C				mov		eax,dword ptr 0x1c[ebp]
0061  66 83 38 00			cmp		word ptr [eax],0x0000
0065  74 45				je		L$8
0067				L$5:
0067  8D 45 F8				lea		eax,-0x8[ebp]
006A  50				push		eax
006B  8B 45 1C				mov		eax,dword ptr 0x1c[ebp]
006E  0F B7 00				movzx		eax,word ptr [eax]
0071  50				push		eax
0072  83 45 1C 02			add		dword ptr 0x1c[ebp],0x00000002
0076  E8 00 00 00 00			call		pickup
007B  66 89 03				mov		word ptr [ebx],ax
007E  8B 45 1C				mov		eax,dword ptr 0x1c[ebp]
0081  83 C4 08				add		esp,0x00000008
0084  43				inc		ebx
0085  43				inc		ebx
0086  66 83 38 00			cmp		word ptr [eax],0x0000
008A  75 DB				jne		L$5
008C  83 7D F8 00			cmp		dword ptr -0x8[ebp],0x00000000
0090  75 07				jne		L$6
0092  C7 45 F8 5C 00 00 00		mov		dword ptr -0x8[ebp],0x0000005c
0099				L$6:
0099  0F B7 43 FE			movzx		eax,word ptr -0x2[ebx]
009D  3B 45 F8				cmp		eax,dword ptr -0x8[ebp]
00A0  75 04				jne		L$7
00A2  4B				dec		ebx
00A3  4B				dec		ebx
00A4  EB 06				jmp		L$8
00A6				L$7:
00A6  8B 45 F8				mov		eax,dword ptr -0x8[ebp]
00A9  66 89 03				mov		word ptr [ebx],ax
00AC				L$8:
00AC  83 7D F8 00			cmp		dword ptr -0x8[ebp],0x00000000
00B0  75 07				jne		L$9
00B2  C7 45 F8 5C 00 00 00		mov		dword ptr -0x8[ebp],0x0000005c
00B9				L$9:
00B9  8D 43 02				lea		eax,0x2[ebx]
00BC  89 45 FC				mov		dword ptr -0x4[ebp],eax
00BF  85 FF				test		edi,edi
00C1  74 3F				je		L$11
00C3  8D 45 F8				lea		eax,-0x8[ebp]
00C6  50				push		eax
00C7  0F B7 07				movzx		eax,word ptr [edi]
00CA  50				push		eax
00CB  E8 00 00 00 00			call		pickup
00D0  83 C4 08				add		esp,0x00000008
00D3  3B 45 F8				cmp		eax,dword ptr -0x8[ebp]
00D6  74 0B				je		L$10
00D8  0F B7 03				movzx		eax,word ptr [ebx]
00DB  3B 45 F8				cmp		eax,dword ptr -0x8[ebp]
00DE  75 03				jne		L$10
00E0  8B 5D FC				mov		ebx,dword ptr -0x4[ebp]
00E3				L$10:
00E3  8D 45 F8				lea		eax,-0x8[ebp]
00E6  50				push		eax
00E7  0F B7 07				movzx		eax,word ptr [edi]
00EA  50				push		eax
00EB  47				inc		edi
00EC  47				inc		edi
00ED  E8 00 00 00 00			call		pickup
00F2  83 C4 08				add		esp,0x00000008
00F5  66 89 03				mov		word ptr [ebx],ax
00F8  43				inc		ebx
00F9  43				inc		ebx
00FA  66 83 3F 00			cmp		word ptr [edi],0x0000
00FE  75 E3				jne		L$10
0100  EB 0B				jmp		L$12
0102				L$11:
0102  0F B7 03				movzx		eax,word ptr [ebx]
0105  3B 45 F8				cmp		eax,dword ptr -0x8[ebp]
0108  75 03				jne		L$12
010A  8B 5D FC				mov		ebx,dword ptr -0x4[ebp]
010D				L$12:
010D  85 F6				test		esi,esi
010F  74 25				je		L$15
0111  66 83 3E 00			cmp		word ptr [esi],0x0000
0115  74 1F				je		L$15
0117  0F B7 06				movzx		eax,word ptr [esi]
011A  83 F8 2E				cmp		eax,0x0000002e
011D  74 07				je		L$14
011F  66 C7 03 2E 00			mov		word ptr [ebx],0x002e
0124				L$13:
0124  43				inc		ebx
0125  43				inc		ebx
0126				L$14:
0126  66 83 3E 00			cmp		word ptr [esi],0x0000
012A  74 0A				je		L$15
012C  66 8B 06				mov		ax,word ptr [esi]
012F  46				inc		esi
0130  46				inc		esi
0131  66 89 03				mov		word ptr [ebx],ax
0134  EB EE				jmp		L$13
0136				L$15:
0136  66 C7 03 00 00			mov		word ptr [ebx],0x0000
013B  C9				leave		
013C  5F				pop		edi
013D  5E				pop		esi
013E  5B				pop		ebx
013F  C3				ret		

Routine Size: 288 bytes,    Routine Base: _TEXT + 0020

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes


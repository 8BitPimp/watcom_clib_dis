Module: ufopen
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 000002D9 bytes
0000				__uopen_flags:
0000  53				push		ebx
0001  56				push		esi
0002  57				push		edi
0003  55				push		ebp
0004  89 E5				mov		ebp,esp
0006  8B 75 14				mov		esi,dword ptr 0x14[ebp]
0009  0F B7 06				movzx		eax,word ptr [esi]
000C  50				push		eax
000D  31 DB				xor		ebx,ebx
000F  E8 00 00 00 00			call		_utolower
0014  89 C7				mov		edi,eax
0016  0F B7 C0				movzx		eax,ax
0019  83 C4 04				add		esp,0x00000004
001C  83 F8 72				cmp		eax,0x00000072
001F  74 1B				je		L$1
0021  83 F8 77				cmp		eax,0x00000077
0024  74 16				je		L$1
0026  83 F8 61				cmp		eax,0x00000061
0029  74 11				je		L$1
002B  6A 09				push		0x00000009
002D  E8 00 00 00 00			call		__set_errno
0032  83 C4 04				add		esp,0x00000004
0035  31 C0				xor		eax,eax
0037  5D				pop		ebp
0038  5F				pop		edi
0039  5E				pop		esi
003A  5B				pop		ebx
003B  C3				ret		
003C				L$1:
003C  89 D9				mov		ecx,ebx
003E  0F B7 46 02			movzx		eax,word ptr 0x2[esi]
0042  80 C9 03				or		cl,0x03
0045  83 F8 2B				cmp		eax,0x0000002b
0048  75 23				jne		L$4
004A  89 CB				mov		ebx,ecx
004C  0F B7 46 04			movzx		eax,word ptr 0x4[esi]
0050  80 C9 40				or		cl,0x40
0053  83 F8 62				cmp		eax,0x00000062
0056  74 11				je		L$3
0058  83 F8 74				cmp		eax,0x00000074
005B  74 46				je		L$8
005D  81 3D 00 00 00 00 00 02 00 00
					cmp		dword ptr _fmode,0x00000200
0067				L$2:
0067  75 3A				jne		L$8
0069				L$3:
0069  89 CB				mov		ebx,ecx
006B  EB 36				jmp		L$8
006D				L$4:
006D  89 DA				mov		edx,ebx
006F  80 CA 40				or		dl,0x40
0072  83 F8 62				cmp		eax,0x00000062
0075  75 10				jne		L$5
0077  0F B7 46 04			movzx		eax,word ptr 0x4[esi]
007B  89 D3				mov		ebx,edx
007D  83 F8 2B				cmp		eax,0x0000002b
0080  75 21				jne		L$8
0082  80 CA 03				or		dl,0x03
0085  EB 1A				jmp		L$7
0087				L$5:
0087  83 F8 74				cmp		eax,0x00000074
008A  75 09				jne		L$6
008C  0F B7 46 04			movzx		eax,word ptr 0x4[esi]
0090  83 F8 2B				cmp		eax,0x0000002b
0093  EB D2				jmp		L$2
0095				L$6:
0095  81 3D 00 00 00 00 00 02 00 00
					cmp		dword ptr _fmode,0x00000200
009F  75 02				jne		L$8
00A1				L$7:
00A1  89 D3				mov		ebx,edx
00A3				L$8:
00A3  0F B7 C7				movzx		eax,di
00A6  83 F8 77				cmp		eax,0x00000077
00A9  75 05				jne		L$9
00AB  80 CB 02				or		bl,0x02
00AE  EB 0D				jmp		L$11
00B0				L$9:
00B0  83 F8 61				cmp		eax,0x00000061
00B3  75 05				jne		L$10
00B5  80 CB 82				or		bl,0x82
00B8  EB 03				jmp		L$11
00BA				L$10:
00BA  80 CB 01				or		bl,0x01
00BD				L$11:
00BD  89 D8				mov		eax,ebx
00BF  5D				pop		ebp
00C0  5F				pop		edi
00C1  5E				pop		esi
00C2  5B				pop		ebx
00C3  C3				ret		
00C4				__udoopen:
00C4  53				push		ebx
00C5  55				push		ebp
00C6  89 E5				mov		ebp,esp
00C8  8B 5D 1C				mov		ebx,dword ptr 0x1c[ebp]
00CB  8B 45 14				mov		eax,dword ptr 0x14[ebp]
00CE  80 63 0C FC			and		byte ptr 0xc[ebx],0xfc
00D2  09 43 0C				or		dword ptr 0xc[ebx],eax
00D5  0F B7 45 10			movzx		eax,word ptr 0x10[ebp]
00D9  50				push		eax
00DA  E8 00 00 00 00			call		_utolower
00DF  0F B7 C0				movzx		eax,ax
00E2  83 C4 04				add		esp,0x00000004
00E5  83 F8 72				cmp		eax,0x00000072
00E8  75 1F				jne		L$15
00EA  31 C0				xor		eax,eax
00EC  F6 45 14 02			test		byte ptr 0x14[ebp],0x02
00F0  74 05				je		L$12
00F2  B8 02 00 00 00			mov		eax,0x00000002
00F7				L$12:
00F7  F6 45 14 40			test		byte ptr 0x14[ebp],0x40
00FB  74 05				je		L$13
00FD  80 CC 02				or		ah,0x02
0100  EB 03				jmp		L$14
0102				L$13:
0102  80 CC 01				or		ah,0x01
0105				L$14:
0105  6A 00				push		0x00000000
0107  EB 2C				jmp		L$20
0109				L$15:
0109  F6 45 14 01			test		byte ptr 0x14[ebp],0x01
010D  0F 95 C0				setne		al
0110  0F B6 C0				movzx		eax,al
0113  83 C0 21				add		eax,0x00000021
0116  F6 45 14 80			test		byte ptr 0x14[ebp],0x80
011A  74 04				je		L$16
011C  0C 10				or		al,0x10
011E  EB 02				jmp		L$17
0120				L$16:
0120  0C 40				or		al,0x40
0122				L$17:
0122  F6 45 14 40			test		byte ptr 0x14[ebp],0x40
0126  74 05				je		L$18
0128  80 CC 02				or		ah,0x02
012B  EB 03				jmp		L$19
012D				L$18:
012D  80 CC 01				or		ah,0x01
0130				L$19:
0130  68 80 01 00 00			push		0x00000180
0135				L$20:
0135  FF 75 18				push		dword ptr 0x18[ebp]
0138  50				push		eax
0139  FF 75 0C				push		dword ptr 0xc[ebp]
013C  E8 00 00 00 00			call		_usopen
0141  83 C4 10				add		esp,0x00000010
0144  89 43 10				mov		dword ptr 0x10[ebx],eax
0147  83 7B 10 FF			cmp		dword ptr 0x10[ebx],0xffffffff
014B  75 0E				jne		L$21
014D  53				push		ebx
014E  E8 00 00 00 00			call		__freefp
0153  83 C4 04				add		esp,0x00000004
0156  31 C0				xor		eax,eax
0158  5D				pop		ebp
0159  5B				pop		ebx
015A  C3				ret		
015B				L$21:
015B  C7 43 04 00 00 00 00		mov		dword ptr 0x4[ebx],0x00000000
0162  C7 43 08 00 00 00 00		mov		dword ptr 0x8[ebx],0x00000000
0169  C7 43 14 00 00 00 00		mov		dword ptr 0x14[ebx],0x00000000
0170  F6 45 14 80			test		byte ptr 0x14[ebp],0x80
0174  74 0D				je		L$22
0176  6A 02				push		0x00000002
0178  6A 00				push		0x00000000
017A  53				push		ebx
017B  E8 00 00 00 00			call		fseek
0180  83 C4 0C				add		esp,0x0000000c
0183				L$22:
0183  53				push		ebx
0184  E8 00 00 00 00			call		__chktty
0189  83 C4 04				add		esp,0x00000004
018C  89 D8				mov		eax,ebx
018E  5D				pop		ebp
018F  5B				pop		ebx
0190  C3				ret		

Routine Size: 401 bytes,    Routine Base: _TEXT + 0000

0191				_u_fsopen:
0191  53				push		ebx
0192  55				push		ebp
0193  89 E5				mov		ebp,esp
0195  FF 75 10				push		dword ptr 0x10[ebp]
0198  E8 00 00 00 00			call		__uopen_flags
019D  89 C3				mov		ebx,eax
019F  83 C4 04				add		esp,0x00000004
01A2  85 C0				test		eax,eax
01A4  74 2B				je		L$24
01A6  6A 00				push		0x00000000
01A8  E8 00 00 00 00			call		__allocfp
01AD  83 C4 04				add		esp,0x00000004
01B0  89 C2				mov		edx,eax
01B2  85 C0				test		eax,eax
01B4  74 19				je		L$23
01B6  50				push		eax
01B7  FF 75 14				push		dword ptr 0x14[ebp]
01BA  8B 45 10				mov		eax,dword ptr 0x10[ebp]
01BD  53				push		ebx
01BE  0F B7 00				movzx		eax,word ptr [eax]
01C1  50				push		eax
01C2  FF 75 0C				push		dword ptr 0xc[ebp]
01C5  E8 00 00 00 00			call		__udoopen
01CA  83 C4 14				add		esp,0x00000014
01CD  89 C2				mov		edx,eax
01CF				L$23:
01CF  89 D0				mov		eax,edx
01D1				L$24:
01D1  5D				pop		ebp
01D2  5B				pop		ebx
01D3  C3				ret		

Routine Size: 67 bytes,    Routine Base: _TEXT + 0191

01D4				_ufopen:
01D4  55				push		ebp
01D5  89 E5				mov		ebp,esp
01D7  6A 00				push		0x00000000
01D9  FF 75 0C				push		dword ptr 0xc[ebp]
01DC  FF 75 08				push		dword ptr 0x8[ebp]
01DF  E8 00 00 00 00			call		_u_fsopen
01E4  83 C4 0C				add		esp,0x0000000c
01E7  5D				pop		ebp
01E8  C3				ret		
01E9				close_file:
01E9  53				push		ebx
01EA  55				push		ebp
01EB  89 E5				mov		ebp,esp
01ED  8B 5D 0C				mov		ebx,dword ptr 0xc[ebp]
01F0  FF 15 00 00 00 00			call		dword ptr _AccessIOB
01F6  A1 00 00 00 00			mov		eax,dword ptr __OpenStreams
01FB				L$25:
01FB  85 C0				test		eax,eax
01FD  74 25				je		L$28
01FF  3B 58 04				cmp		ebx,dword ptr 0x4[eax]
0202  75 1C				jne		L$27
0204  F6 43 0C 03			test		byte ptr 0xc[ebx],0x03
0208  74 0B				je		L$26
020A  6A 01				push		0x00000001
020C  53				push		ebx
020D  E8 00 00 00 00			call		__doclose
0212  83 C4 08				add		esp,0x00000008
0215				L$26:
0215  FF 15 00 00 00 00			call		dword ptr _ReleaseIOB
021B  89 D8				mov		eax,ebx
021D  5D				pop		ebp
021E  5B				pop		ebx
021F  C3				ret		
0220				L$27:
0220  8B 00				mov		eax,dword ptr [eax]
0222  EB D7				jmp		L$25
0224				L$28:
0224  BA 00 00 00 00			mov		edx,offset __ClosedStreams
0229				L$29:
0229  8B 02				mov		eax,dword ptr [edx]
022B  85 C0				test		eax,eax
022D  74 1C				je		L$31
022F  3B 58 04				cmp		ebx,dword ptr 0x4[eax]
0232  75 13				jne		L$30
0234  8B 08				mov		ecx,dword ptr [eax]
0236  89 0A				mov		dword ptr [edx],ecx
0238  8B 15 00 00 00 00			mov		edx,dword ptr __OpenStreams
023E  A3 00 00 00 00			mov		dword ptr __OpenStreams,eax
0243  89 10				mov		dword ptr [eax],edx
0245  EB CE				jmp		L$26
0247				L$30:
0247  89 C2				mov		edx,eax
0249  EB DE				jmp		L$29
024B				L$31:
024B  6A 04				push		0x00000004
024D  E8 00 00 00 00			call		__set_errno
0252  83 C4 04				add		esp,0x00000004
0255  FF 15 00 00 00 00			call		dword ptr _ReleaseIOB
025B  31 C0				xor		eax,eax
025D  5D				pop		ebp
025E  5B				pop		ebx
025F  C3				ret		

Routine Size: 140 bytes,    Routine Base: _TEXT + 01D4

0260				_ufreopen:
0260  53				push		ebx
0261  56				push		esi
0262  57				push		edi
0263  55				push		ebp
0264  89 E5				mov		ebp,esp
0266  8B 5D 1C				mov		ebx,dword ptr 0x1c[ebp]
0269  FF 75 18				push		dword ptr 0x18[ebp]
026C  E8 00 00 00 00			call		__uopen_flags
0271  83 C4 04				add		esp,0x00000004
0274  89 C7				mov		edi,eax
0276  85 C0				test		eax,eax
0278  74 5A				je		L$34
027A  8B 73 10				mov		esi,dword ptr 0x10[ebx]
027D  56				push		esi
027E  FF 15 00 00 00 00			call		dword ptr _AccessFileH
0284  83 C4 04				add		esp,0x00000004
0287  83 3D 00 00 00 00 00		cmp		dword ptr _WindowsRemoveWindowedHandle,0x00000000
028E  74 0A				je		L$32
0290  56				push		esi
0291  FF 15 00 00 00 00			call		dword ptr _WindowsRemoveWindowedHandle
0297  83 C4 04				add		esp,0x00000004
029A				L$32:
029A  53				push		ebx
029B  E8 00 00 00 00			call		close_file
02A0  83 C4 04				add		esp,0x00000004
02A3  89 C3				mov		ebx,eax
02A5  85 C0				test		eax,eax
02A7  74 1F				je		L$33
02A9  50				push		eax
02AA  6A 00				push		0x00000000
02AC  81 60 0C 00 40 00 00		and		dword ptr 0xc[eax],0x00004000
02B3  8B 45 18				mov		eax,dword ptr 0x18[ebp]
02B6  57				push		edi
02B7  0F B7 00				movzx		eax,word ptr [eax]
02BA  50				push		eax
02BB  FF 75 14				push		dword ptr 0x14[ebp]
02BE  E8 00 00 00 00			call		__udoopen
02C3  83 C4 14				add		esp,0x00000014
02C6  89 C3				mov		ebx,eax
02C8				L$33:
02C8  56				push		esi
02C9  FF 15 00 00 00 00			call		dword ptr _ReleaseFileH
02CF  83 C4 04				add		esp,0x00000004
02D2  89 D8				mov		eax,ebx
02D4				L$34:
02D4  5D				pop		ebp
02D5  5F				pop		edi
02D6  5E				pop		esi
02D7  5B				pop		ebx
02D8  C3				ret		

Routine Size: 121 bytes,    Routine Base: _TEXT + 0260

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes


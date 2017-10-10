Module: winio
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 0000019C bytes
0000				_DoStdin:
0000  53				push		ebx
0001  56				push		esi
0002  57				push		edi
0003  55				push		ebp
0004  8B 5C 24 14			mov		ebx,dword ptr 0x14[esp]
0008  8B 74 24 18			mov		esi,dword ptr 0x18[esp]
000C  85 DB				test		ebx,ebx
000E  75 07				jne		L$1
0010  31 C0				xor		eax,eax
0012  5D				pop		ebp
0013  5F				pop		edi
0014  5E				pop		esi
0015  5B				pop		ebx
0016  C3				ret		
0017				L$1:
0017  F6 43 52 02			test		byte ptr 0x52[ebx],0x02
001B  75 09				jne		L$2
001D  53				push		ebx
001E  E8 00 00 00 00			call		_MakeWindowActive
0023  83 C4 04				add		esp,0x00000004
0026				L$2:
0026  8B 54 24 1C			mov		edx,dword ptr 0x1c[esp]
002A  52				push		edx
002B  56				push		esi
002C  53				push		ebx
002D  E8 00 00 00 00			call		_GetString
0032  8B 3D 00 00 00 00			mov		edi,dword ptr _GotEOF
0038  83 C4 0C				add		esp,0x0000000c
003B  89 C3				mov		ebx,eax
003D  8D 14 06				lea		edx,[esi+eax]
0040  8D 48 01				lea		ecx,0x1[eax]
0043  85 FF				test		edi,edi
0045  74 0D				je		L$3
0047  3B 44 24 1C			cmp		eax,dword ptr 0x1c[esp]
004B  73 2D				jae		L$5
004D  89 CB				mov		ebx,ecx
004F  C6 02 1A				mov		byte ptr [edx],0x1a
0052  EB 26				jmp		L$5
0054				L$3:
0054  85 C0				test		eax,eax
0056  75 0D				jne		L$4
0058  B8 01 00 00 00			mov		eax,0x00000001
005D  C6 06 0A				mov		byte ptr [esi],0x0a
0060  5D				pop		ebp
0061  5F				pop		edi
0062  5E				pop		esi
0063  5B				pop		ebx
0064  C3				ret		
0065				L$4:
0065  8B 6C 24 1C			mov		ebp,dword ptr 0x1c[esp]
0069  83 C0 02				add		eax,0x00000002
006C  39 E8				cmp		eax,ebp
006E  73 0A				jae		L$5
0070  C6 02 0D				mov		byte ptr [edx],0x0d
0073  8D 59 01				lea		ebx,0x1[ecx]
0076  C6 04 31 0A			mov		byte ptr [ecx+esi],0x0a
007A				L$5:
007A  89 D8				mov		eax,ebx
007C  5D				pop		ebp
007D  5F				pop		edi
007E  5E				pop		esi
007F  5B				pop		ebx
0080  C3				ret		

Routine Size: 129 bytes,    Routine Base: _TEXT + 0000

0081				_DoStdout:
0081  53				push		ebx
0082  8B 5C 24 08			mov		ebx,dword ptr 0x8[esp]
0086  85 DB				test		ebx,ebx
0088  75 04				jne		L$6
008A  31 C0				xor		eax,eax
008C  5B				pop		ebx
008D  C3				ret		
008E				L$6:
008E  F6 43 52 02			test		byte ptr 0x52[ebx],0x02
0092  75 09				jne		L$7
0094  53				push		ebx
0095  E8 00 00 00 00			call		_MakeWindowActive
009A  83 C4 04				add		esp,0x00000004
009D				L$7:
009D  8B 54 24 10			mov		edx,dword ptr 0x10[esp]
00A1  52				push		edx
00A2  8B 4C 24 10			mov		ecx,dword ptr 0x10[esp]
00A6  51				push		ecx
00A7  53				push		ebx
00A8  E8 00 00 00 00			call		_AddLine
00AD  83 C4 0C				add		esp,0x0000000c
00B0  6A 01				push		0x00000001
00B2  E8 00 00 00 00			call		_MessageLoop
00B7  83 C4 04				add		esp,0x00000004
00BA  8B 44 24 10			mov		eax,dword ptr 0x10[esp]
00BE  5B				pop		ebx
00BF  C3				ret		

Routine Size: 63 bytes,    Routine Base: _TEXT + 0081

00C0				_DoKbhit:
00C0  8B 44 24 04			mov		eax,dword ptr 0x4[esp]
00C4  85 C0				test		eax,eax
00C6  75 01				jne		L$8
00C8  C3				ret		
00C9				L$8:
00C9  F6 40 52 02			test		byte ptr 0x52[eax],0x02
00CD  75 09				jne		L$9
00CF  50				push		eax
00D0  E8 00 00 00 00			call		_MakeWindowActive
00D5  83 C4 04				add		esp,0x00000004
00D8				L$9:
00D8  6A 00				push		0x00000000
00DA  E8 00 00 00 00			call		_KeyboardHit
00DF  83 C4 04				add		esp,0x00000004
00E2  C3				ret		

Routine Size: 35 bytes,    Routine Base: _TEXT + 00C0

00E3				_DoGetch:
00E3  8B 44 24 04			mov		eax,dword ptr 0x4[esp]
00E7  85 C0				test		eax,eax
00E9  75 01				jne		L$10
00EB  C3				ret		
00EC				L$10:
00EC  F6 40 52 02			test		byte ptr 0x52[eax],0x02
00F0  75 09				jne		L$11
00F2  50				push		eax
00F3  E8 00 00 00 00			call		_MakeWindowActive
00F8  83 C4 04				add		esp,0x00000004
00FB				L$11:
00FB  6A 01				push		0x00000001
00FD  E8 00 00 00 00			call		_KeyboardHit
0102  83 C4 04				add		esp,0x00000004
0105  85 C0				test		eax,eax
0107  74 F2				je		L$11
0109  6A 00				push		0x00000000
010B  E8 00 00 00 00			call		_GetKeyboard
0110  83 C4 04				add		esp,0x00000004
0113  89 C2				mov		edx,eax
0115  3D 80 00 00 00			cmp		eax,0x00000080
011A  76 03				jbe		L$12
011C  8D 50 80				lea		edx,-0x80[eax]
011F				L$12:
011F  89 D0				mov		eax,edx
0121  C3				ret		

Routine Size: 63 bytes,    Routine Base: _TEXT + 00E3

0122				_DoGetche:
0122  53				push		ebx
0123  56				push		esi
0124  8B 54 24 0C			mov		edx,dword ptr 0xc[esp]
0128  52				push		edx
0129  E8 00 00 00 00			call		_DoGetch
012E  83 C4 04				add		esp,0x00000004
0131  89 C3				mov		ebx,eax
0133  83 F8 0D				cmp		eax,0x0000000d
0136  75 09				jne		L$13
0138  6A 0A				push		0x0000000a
013A  8B 74 24 10			mov		esi,dword ptr 0x10[esp]
013E  56				push		esi
013F  EB 06				jmp		L$14
0141				L$13:
0141  50				push		eax
0142  8B 4C 24 10			mov		ecx,dword ptr 0x10[esp]
0146  51				push		ecx
0147				L$14:
0147  E8 00 00 00 00			call		_DoPutch
014C  83 C4 08				add		esp,0x00000008
014F  89 D8				mov		eax,ebx
0151  5E				pop		esi
0152  5B				pop		ebx
0153  C3				ret		

Routine Size: 50 bytes,    Routine Base: _TEXT + 0122

0154				_DoPutch:
0154  53				push		ebx
0155  83 EC 04				sub		esp,0x00000004
0158  8B 5C 24 0C			mov		ebx,dword ptr 0xc[esp]
015C  85 DB				test		ebx,ebx
015E  74 37				je		L$16
0160  F6 43 52 02			test		byte ptr 0x52[ebx],0x02
0164  75 09				jne		L$15
0166  53				push		ebx
0167  E8 00 00 00 00			call		_MakeWindowActive
016C  83 C4 04				add		esp,0x00000004
016F				L$15:
016F  8A 44 24 10			mov		al,byte ptr 0x10[esp]
0173  6A 01				push		0x00000001
0175  88 44 24 04			mov		byte ptr 0x4[esp],al
0179  8D 44 24 04			lea		eax,0x4[esp]
017D  50				push		eax
017E  30 D2				xor		dl,dl
0180  53				push		ebx
0181  88 54 24 0D			mov		byte ptr 0xd[esp],dl
0185  E8 00 00 00 00			call		_AddLine
018A  83 C4 0C				add		esp,0x0000000c
018D  6A 01				push		0x00000001
018F  E8 00 00 00 00			call		_MessageLoop
0194  83 C4 04				add		esp,0x00000004
0197				L$16:
0197  83 C4 04				add		esp,0x00000004
019A  5B				pop		ebx
019B  C3				ret		

Routine Size: 72 bytes,    Routine Base: _TEXT + 0154

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes


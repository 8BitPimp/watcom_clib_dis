Module: winio
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 0000018B bytes
0000				_DoStdin:
0000  53				push		ebx
0001  56				push		esi
0002  57				push		edi
0003  55				push		ebp
0004  8B 5C 24 14			mov		ebx,dword ptr 0x14[esp]
0008  85 DB				test		ebx,ebx
000A  75 07				jne		L$1
000C  31 C0				xor		eax,eax
000E  5D				pop		ebp
000F  5F				pop		edi
0010  5E				pop		esi
0011  5B				pop		ebx
0012  C3				ret		
0013				L$1:
0013  F6 43 52 02			test		byte ptr 0x52[ebx],0x02
0017  75 09				jne		L$2
0019  53				push		ebx
001A  E8 00 00 00 00			call		_MakeWindowActive
001F  83 C4 04				add		esp,0x00000004
0022				L$2:
0022  8B 54 24 1C			mov		edx,dword ptr 0x1c[esp]
0026  52				push		edx
0027  8B 4C 24 1C			mov		ecx,dword ptr 0x1c[esp]
002B  51				push		ecx
002C  53				push		ebx
002D  E8 00 00 00 00			call		_GetString
0032  8B 35 00 00 00 00			mov		esi,dword ptr _GotEOF
0038  83 C4 0C				add		esp,0x0000000c
003B  89 C1				mov		ecx,eax
003D  8B 54 24 18			mov		edx,dword ptr 0x18[esp]
0041  8D 58 01				lea		ebx,0x1[eax]
0044  01 C2				add		edx,eax
0046  85 F6				test		esi,esi
0048  74 0D				je		L$3
004A  3B 44 24 1C			cmp		eax,dword ptr 0x1c[esp]
004E  73 21				jae		L$4
0050  89 D9				mov		ecx,ebx
0052  C6 02 1A				mov		byte ptr [edx],0x1a
0055  EB 1A				jmp		L$4
0057				L$3:
0057  8B 7C 24 1C			mov		edi,dword ptr 0x1c[esp]
005B  83 C0 02				add		eax,0x00000002
005E  39 F8				cmp		eax,edi
0060  73 0F				jae		L$4
0062  8B 6C 24 18			mov		ebp,dword ptr 0x18[esp]
0066  8D 4B 01				lea		ecx,0x1[ebx]
0069  01 EB				add		ebx,ebp
006B  C6 02 0D				mov		byte ptr [edx],0x0d
006E  C6 03 0A				mov		byte ptr [ebx],0x0a
0071				L$4:
0071  89 C8				mov		eax,ecx
0073  5D				pop		ebp
0074  5F				pop		edi
0075  5E				pop		esi
0076  5B				pop		ebx
0077  C3				ret		

Routine Size: 120 bytes,    Routine Base: _TEXT + 0000

0078				_DoStdout:
0078  53				push		ebx
0079  8B 5C 24 08			mov		ebx,dword ptr 0x8[esp]
007D  85 DB				test		ebx,ebx
007F  75 04				jne		L$5
0081  31 C0				xor		eax,eax
0083  5B				pop		ebx
0084  C3				ret		
0085				L$5:
0085  F6 43 52 02			test		byte ptr 0x52[ebx],0x02
0089  75 09				jne		L$6
008B  53				push		ebx
008C  E8 00 00 00 00			call		_MakeWindowActive
0091  83 C4 04				add		esp,0x00000004
0094				L$6:
0094  8B 54 24 10			mov		edx,dword ptr 0x10[esp]
0098  52				push		edx
0099  8B 4C 24 10			mov		ecx,dword ptr 0x10[esp]
009D  51				push		ecx
009E  53				push		ebx
009F  E8 00 00 00 00			call		_AddLine
00A4  83 C4 0C				add		esp,0x0000000c
00A7  6A 01				push		0x00000001
00A9  E8 00 00 00 00			call		_MessageLoop
00AE  83 C4 04				add		esp,0x00000004
00B1  8B 44 24 10			mov		eax,dword ptr 0x10[esp]
00B5  5B				pop		ebx
00B6				L$7:
00B6  C3				ret		

Routine Size: 63 bytes,    Routine Base: _TEXT + 0078

00B7				_DoKbhit:
00B7  8B 44 24 04			mov		eax,dword ptr 0x4[esp]
00BB  85 C0				test		eax,eax
00BD  74 F7				je		L$7
00BF  F6 40 52 02			test		byte ptr 0x52[eax],0x02
00C3  0F 85 00 00 00 00			jne		_KeyboardHit
00C9  50				push		eax
00CA  E8 00 00 00 00			call		_MakeWindowActive
00CF  83 C4 04				add		esp,0x00000004
00D2  E9 00 00 00 00			jmp		_KeyboardHit

Routine Size: 32 bytes,    Routine Base: _TEXT + 00B7

00D7				_DoGetch:
00D7  8B 44 24 04			mov		eax,dword ptr 0x4[esp]
00DB  85 C0				test		eax,eax
00DD  75 01				jne		L$8
00DF  C3				ret		
00E0				L$8:
00E0  F6 40 52 02			test		byte ptr 0x52[eax],0x02
00E4  75 09				jne		L$9
00E6  50				push		eax
00E7  E8 00 00 00 00			call		_MakeWindowActive
00EC  83 C4 04				add		esp,0x00000004
00EF				L$9:
00EF  E8 00 00 00 00			call		_KeyboardHit
00F4  85 C0				test		eax,eax
00F6  74 F7				je		L$9
00F8  6A 00				push		0x00000000
00FA  E8 00 00 00 00			call		_GetKeyboard
00FF  83 C4 04				add		esp,0x00000004
0102  89 C2				mov		edx,eax
0104  3D 80 00 00 00			cmp		eax,0x00000080
0109  76 03				jbe		L$10
010B  8D 50 80				lea		edx,-0x80[eax]
010E				L$10:
010E  89 D0				mov		eax,edx
0110  C3				ret		

Routine Size: 58 bytes,    Routine Base: _TEXT + 00D7

0111				_DoGetche:
0111  53				push		ebx
0112  56				push		esi
0113  8B 54 24 0C			mov		edx,dword ptr 0xc[esp]
0117  52				push		edx
0118  E8 00 00 00 00			call		_DoGetch
011D  83 C4 04				add		esp,0x00000004
0120  89 C3				mov		ebx,eax
0122  83 F8 0D				cmp		eax,0x0000000d
0125  75 09				jne		L$11
0127  6A 0A				push		0x0000000a
0129  8B 74 24 10			mov		esi,dword ptr 0x10[esp]
012D  56				push		esi
012E  EB 06				jmp		L$12
0130				L$11:
0130  50				push		eax
0131  8B 4C 24 10			mov		ecx,dword ptr 0x10[esp]
0135  51				push		ecx
0136				L$12:
0136  E8 00 00 00 00			call		_DoPutch
013B  83 C4 08				add		esp,0x00000008
013E  89 D8				mov		eax,ebx
0140  5E				pop		esi
0141  5B				pop		ebx
0142  C3				ret		

Routine Size: 50 bytes,    Routine Base: _TEXT + 0111

0143				_DoPutch:
0143  53				push		ebx
0144  83 EC 04				sub		esp,0x00000004
0147  8B 5C 24 0C			mov		ebx,dword ptr 0xc[esp]
014B  85 DB				test		ebx,ebx
014D  74 37				je		L$14
014F  F6 43 52 02			test		byte ptr 0x52[ebx],0x02
0153  75 09				jne		L$13
0155  53				push		ebx
0156  E8 00 00 00 00			call		_MakeWindowActive
015B  83 C4 04				add		esp,0x00000004
015E				L$13:
015E  8A 44 24 10			mov		al,byte ptr 0x10[esp]
0162  6A 01				push		0x00000001
0164  88 44 24 04			mov		byte ptr 0x4[esp],al
0168  8D 44 24 04			lea		eax,0x4[esp]
016C  50				push		eax
016D  30 D2				xor		dl,dl
016F  53				push		ebx
0170  88 54 24 0D			mov		byte ptr 0xd[esp],dl
0174  E8 00 00 00 00			call		_AddLine
0179  83 C4 0C				add		esp,0x0000000c
017C  6A 01				push		0x00000001
017E  E8 00 00 00 00			call		_MessageLoop
0183  83 C4 04				add		esp,0x00000004
0186				L$14:
0186  83 C4 04				add		esp,0x00000004
0189  5B				pop		ebx
018A  C3				ret		

Routine Size: 72 bytes,    Routine Base: _TEXT + 0143

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes


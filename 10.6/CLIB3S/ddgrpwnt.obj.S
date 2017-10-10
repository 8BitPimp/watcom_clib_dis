Module: ddgrpwnt
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 000000CC bytes
0000				__disallow_single_dgroup:
0000  56				push		esi
0001  57				push		edi
0002  68 04 01 00 00			push		0x00000104
0007  68 00 00 00 00			push		offset pgmname
000C  6A 00				push		0x00000000
000E  E8 00 00 00 00			call		_GetModuleFileNameA
0013  68 04 01 00 00			push		0x00000104
0018  68 00 00 00 00			push		offset dllname
001D  8B 54 24 14			mov		edx,dword ptr 0x14[esp]
0021  52				push		edx
0022  BE 00 00 00 00			mov		esi,offset DGROUP:L$7
0027  E8 00 00 00 00			call		_GetModuleFileNameA
002C  30 E4				xor		ah,ah
002E  BF 00 00 00 00			mov		edi,offset buf
0033  88 25 00 00 00 00			mov		byte ptr buf,ah
0039  06				push		es
003A  1E				push		ds
003B  07				pop		es
003C  57				push		edi
003D  2B C9				sub		ecx,ecx
003F  49				dec		ecx
0040  B0 00				mov		al,0x00
0042  F2 AE				repne scasb	
0044  4F				dec		edi
0045				L$1:
0045  8A 06				mov		al,byte ptr [esi]
0047  88 07				mov		byte ptr [edi],al
0049  3C 00				cmp		al,0x00
004B  74 10				je		L$2
004D  8A 46 01				mov		al,byte ptr 0x1[esi]
0050  83 C6 02				add		esi,0x00000002
0053  88 47 01				mov		byte ptr 0x1[edi],al
0056  83 C7 02				add		edi,0x00000002
0059  3C 00				cmp		al,0x00
005B  75 E8				jne		L$1
005D				L$2:
005D  5F				pop		edi
005E  07				pop		es
005F  BE 00 00 00 00			mov		esi,offset pgmname
0064  06				push		es
0065  1E				push		ds
0066  07				pop		es
0067  57				push		edi
0068  2B C9				sub		ecx,ecx
006A  49				dec		ecx
006B  B0 00				mov		al,0x00
006D  F2 AE				repne scasb	
006F  4F				dec		edi
0070				L$3:
0070  8A 06				mov		al,byte ptr [esi]
0072  88 07				mov		byte ptr [edi],al
0074  3C 00				cmp		al,0x00
0076  74 10				je		L$4
0078  8A 46 01				mov		al,byte ptr 0x1[esi]
007B  83 C6 02				add		esi,0x00000002
007E  88 47 01				mov		byte ptr 0x1[edi],al
0081  83 C7 02				add		edi,0x00000002
0084  3C 00				cmp		al,0x00
0086  75 E8				jne		L$3
0088				L$4:
0088  5F				pop		edi
0089  07				pop		es
008A  BE 31 00 00 00			mov		esi,offset DGROUP:L$8
008F  06				push		es
0090  1E				push		ds
0091  07				pop		es
0092  57				push		edi
0093  2B C9				sub		ecx,ecx
0095  49				dec		ecx
0096  B0 00				mov		al,0x00
0098  F2 AE				repne scasb	
009A  4F				dec		edi
009B				L$5:
009B  8A 06				mov		al,byte ptr [esi]
009D  88 07				mov		byte ptr [edi],al
009F  3C 00				cmp		al,0x00
00A1  74 10				je		L$6
00A3  8A 46 01				mov		al,byte ptr 0x1[esi]
00A6  83 C6 02				add		esi,0x00000002
00A9  88 47 01				mov		byte ptr 0x1[edi],al
00AC  83 C7 02				add		edi,0x00000002
00AF  3C 00				cmp		al,0x00
00B1  75 E8				jne		L$5
00B3				L$6:
00B3  5F				pop		edi
00B4  07				pop		es
00B5  6A 00				push		0x00000000
00B7  68 00 00 00 00			push		offset dllname
00BC  57				push		edi
00BD  6A 00				push		0x00000000
00BF  E8 00 00 00 00			call		_MessageBoxA
00C4  B8 01 00 00 00			mov		eax,0x00000001
00C9  5F				pop		edi
00CA  5E				pop		esi
00CB  C3				ret		

Routine Size: 204 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 000000E4 bytes
0000				L$7:
0000  54 68 69 73 20 44 79 6E 61 6D 69 63 20 4C 69 6E This Dynamic Lin
0010  6B 20 4C 69 62 72 61 72 79 20 69 73 20 61 6C 72 k Library is alr
0020  65 61 64 79 20 69 6E 20 75 73 65 20 62 79 3A 0A eady in use by:.
0030  00                                              .
0031				L$8:
0031  0A 0A 54 68 65 20 57 61 74 63 6F 6D 20 57 49 4E ..The Watcom WIN
0041  33 32 20 72 75 6E 74 69 6D 65 20 6C 69 62 72 61 32 runtime libra
0051  72 79 20 64 6F 65 73 20 6E 6F 74 20 73 75 70 70 ry does not supp
0061  6F 72 74 20 61 74 74 61 63 68 69 6E 67 20 6D 6F ort attaching mo
0071  72 65 20 74 68 61 6E 20 6F 6E 65 20 70 72 6F 63 re than one proc
0081  65 73 73 20 74 6F 20 61 20 44 79 6E 61 6D 69 63 ess to a Dynamic
0091  20 4C 69 6E 6B 20 4C 69 62 72 61 72 79 20 74 68  Link Library th
00A1  61 74 20 64 6F 65 73 20 6E 6F 74 20 68 61 76 65 at does not have
00B1  20 61 20 73 65 70 61 72 61 74 65 20 64 61 74 61  a separate data
00C1  20 73 70 61 63 65 20 66 6F 72 20 65 61 63 68 20  space for each 
00D1  61 74 74 61 63 68 65 64 20 70 72 6F 63 65 73 73 attached process
00E1  2E 0A 00                                        ...

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 000003F0 bytes
0000				buf:
01E8				pgmname:
02EC				dllname:

BSS Size: 1008 bytes


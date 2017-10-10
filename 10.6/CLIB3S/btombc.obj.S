Module: btombc
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 000000F2 bytes
0000				_mbbtombc:
0000  53				push		ebx
0001  8B 54 24 08			mov		edx,dword ptr 0x8[esp]
0005  8B 1D 00 00 00 00			mov		ebx,dword ptr __IsDBCS
000B  85 DB				test		ebx,ebx
000D  0F 84 7A 00 00 00			je		L$6
0013  74 12				je		L$1
0015  31 C0				xor		eax,eax
0017  88 D0				mov		al,dl
0019  8A 80 01 00 00 00			mov		al,byte ptr __MBCSIsTable+0x1[eax]
001F  31 DB				xor		ebx,ebx
0021  24 0C				and		al,0x0c
0023  88 C3				mov		bl,al
0025  EB 2E				jmp		L$3
0027				L$1:
0027  88 D0				mov		al,dl
0029  FE C0				inc		al
002B  25 FF 00 00 00			and		eax,0x000000ff
0030  8A 98 00 00 00 00			mov		bl,byte ptr _IsTable[eax]
0036  80 E3 C0				and		bl,0xc0
0039  81 E3 FF 00 00 00			and		ebx,0x000000ff
003F  75 0F				jne		L$2
0041  8A 80 00 00 00 00			mov		al,byte ptr _IsTable[eax]
0047  24 04				and		al,0x04
0049  25 FF 00 00 00			and		eax,0x000000ff
004E  74 05				je		L$3
0050				L$2:
0050  BB 01 00 00 00			mov		ebx,0x00000001
0055				L$3:
0055  89 D0				mov		eax,edx
0057  C1 E0 02				shl		eax,0x02
005A  85 DB				test		ebx,ebx
005C  74 08				je		L$4
005E  8B 80 7C FD FF FF			mov		eax,dword ptr KANAtoDBCS-0x284[eax]
0064  5B				pop		ebx
0065  C3				ret		
0066				L$4:
0066  88 D3				mov		bl,dl
0068  FE C3				inc		bl
006A  81 E3 FF 00 00 00			and		ebx,0x000000ff
0070  8A 9B 00 00 00 00			mov		bl,byte ptr _IsTable[ebx]
0076  80 E3 08				and		bl,0x08
0079  81 E3 FF 00 00 00			and		ebx,0x000000ff
007F  74 08				je		L$5
0081  8B 80 80 FF FF FF			mov		eax,dword ptr ASCIItoDBCS-0x80[eax]
0087  5B				pop		ebx
0088  C3				ret		
0089				L$5:
0089  89 D0				mov		eax,edx
008B  5B				pop		ebx
008C  C3				ret		
008D				L$6:
008D  89 D0				mov		eax,edx
008F  5B				pop		ebx
0090  C3				ret		

Routine Size: 145 bytes,    Routine Base: _TEXT + 0000

0091				_mbctombb:
0091  53				push		ebx
0092  8B 54 24 08			mov		edx,dword ptr 0x8[esp]
0096  83 3D 00 00 00 00 00		cmp		dword ptr __IsDBCS,0x00000000
009D  74 4F				je		L$12
009F  81 FA FF 00 00 00			cmp		edx,0x000000ff
00A5  72 47				jb		L$12
00A7  31 DB				xor		ebx,ebx
00A9  31 C0				xor		eax,eax
00AB				L$7:
00AB  3B 90 00 00 00 00			cmp		edx,dword ptr ASCIItoDBCS[eax]
00B1  75 07				jne		L$8
00B3  8D 53 20				lea		edx,0x20[ebx]
00B6  89 D0				mov		eax,edx
00B8  5B				pop		ebx
00B9  C3				ret		
00BA				L$8:
00BA  83 C0 04				add		eax,0x00000004
00BD  43				inc		ebx
00BE  3D 78 01 00 00			cmp		eax,0x00000178
00C3  7E E6				jle		L$7
00C5  31 DB				xor		ebx,ebx
00C7  31 C0				xor		eax,eax
00C9				L$9:
00C9  3B 90 00 00 00 00			cmp		edx,dword ptr KANAtoDBCS[eax]
00CF  74 08				je		L$10
00D1  3B 90 04 00 00 00			cmp		edx,dword ptr KANAtoDBCS+0x4[eax]
00D7  73 0A				jae		L$11
00D9				L$10:
00D9  8D 93 A1 00 00 00			lea		edx,0xa1[ebx]
00DF  89 D0				mov		eax,edx
00E1  5B				pop		ebx
00E2  C3				ret		
00E3				L$11:
00E3  83 C0 04				add		eax,0x00000004
00E6  43				inc		ebx
00E7  3D F8 00 00 00			cmp		eax,0x000000f8
00EC  7E DB				jle		L$9
00EE				L$12:
00EE  89 D0				mov		eax,edx
00F0  5B				pop		ebx
00F1  C3				ret		

Routine Size: 97 bytes,    Routine Base: _TEXT + 0091

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000278 bytes
0000				ASCIItoDBCS:
0000  40 81 00 00 49 81 00 00 68 81 00 00 94 81 00 00 @...I...h.......
0010  90 81 00 00 93 81 00 00 95 81 00 00 66 81 00 00 ............f...
0020  69 81 00 00 6A 81 00 00 96 81 00 00 7B 81 00 00 i...j.......{...
0030  43 81 00 00 7C 81 00 00 44 81 00 00 5E 81 00 00 C...|...D...^...
0040  4F 82 00 00 50 82 00 00 51 82 00 00 52 82 00 00 O...P...Q...R...
0050  53 82 00 00 54 82 00 00 55 82 00 00 56 82 00 00 S...T...U...V...
0060  57 82 00 00 58 82 00 00 46 81 00 00 47 81 00 00 W...X...F...G...
0070  83 81 00 00 81 81 00 00 84 81 00 00 48 81 00 00 ............H...
0080  97 81 00 00 60 82 00 00 61 82 00 00 62 82 00 00 ....`...a...b...
0090  63 82 00 00 64 82 00 00 65 82 00 00 66 82 00 00 c...d...e...f...
00A0  67 82 00 00 68 82 00 00 69 82 00 00 6A 82 00 00 g...h...i...j...
00B0  6B 82 00 00 6C 82 00 00 6D 82 00 00 6E 82 00 00 k...l...m...n...
00C0  6F 82 00 00 70 82 00 00 71 82 00 00 72 82 00 00 o...p...q...r...
00D0  73 82 00 00 74 82 00 00 75 82 00 00 76 82 00 00 s...t...u...v...
00E0  77 82 00 00 78 82 00 00 79 82 00 00 6D 81 00 00 w...x...y...m...
00F0  8F 81 00 00 6E 81 00 00 4F 81 00 00 51 81 00 00 ....n...O...Q...
0100  65 81 00 00 81 82 00 00 82 82 00 00 83 82 00 00 e...............
0110  84 82 00 00 85 82 00 00 86 82 00 00 87 82 00 00 ................
0120  88 82 00 00 89 82 00 00 8A 82 00 00 8B 82 00 00 ................
0130  8C 82 00 00 8D 82 00 00 8E 82 00 00 8F 82 00 00 ................
0140  90 82 00 00 91 82 00 00 92 82 00 00 93 82 00 00 ................
0150  94 82 00 00 95 82 00 00 96 82 00 00 97 82 00 00 ................
0160  98 82 00 00 99 82 00 00 9A 82 00 00 6F 81 00 00 ............o...
0170  62 81 00 00 70 81 00 00 50 81 00 00             b...p...P...
017C				KANAtoDBCS:
017C  42 81 00 00 75 81 00 00 76 81 00 00 41 81 00 00 B...u...v...A...
018C  45 81 00 00 92 83 00 00 40 83 00 00 42 83 00 00 E.......@...B...
019C  44 83 00 00 46 83 00 00 48 83 00 00 83 83 00 00 D...F...H.......
01AC  85 83 00 00 87 83 00 00 62 83 00 00 5B 81 00 00 ........b...[...
01BC  41 83 00 00 43 83 00 00 45 83 00 00 47 83 00 00 A...C...E...G...
01CC  49 83 00 00 4A 83 00 00 4C 83 00 00 4E 83 00 00 I...J...L...N...
01DC  50 83 00 00 52 83 00 00 54 83 00 00 56 83 00 00 P...R...T...V...
01EC  58 83 00 00 5A 83 00 00 5C 83 00 00 5E 83 00 00 X...Z...\...^...
01FC  60 83 00 00 63 83 00 00 65 83 00 00 67 83 00 00 `...c...e...g...
020C  69 83 00 00 6A 83 00 00 6B 83 00 00 6C 83 00 00 i...j...k...l...
021C  6D 83 00 00 6E 83 00 00 71 83 00 00 74 83 00 00 m...n...q...t...
022C  77 83 00 00 7A 83 00 00 7D 83 00 00 7E 83 00 00 w...z...}...~...
023C  80 83 00 00 81 83 00 00 82 83 00 00 84 83 00 00 ................
024C  86 83 00 00 88 83 00 00 89 83 00 00 8A 83 00 00 ................
025C  8B 83 00 00 8C 83 00 00 8D 83 00 00 8F 83 00 00 ................
026C  93 83 00 00 4A 81 00 00 4B 81 00 00             ....J...K...

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes


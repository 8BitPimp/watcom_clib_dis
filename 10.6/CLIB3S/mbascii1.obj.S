Module: mbascii1
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 000000EE bytes
0000				_ismbdupper:
0000  8B 44 24 04			mov		eax,dword ptr 0x4[esp]
0004  83 3D 00 00 00 00 00		cmp		dword ptr __IsDBCS,0x00000000
000B  74 17				je		L$2
000D  3D 60 82 00 00			cmp		eax,0x00008260
0012  72 0D				jb		L$1
0014  3D 79 82 00 00			cmp		eax,0x00008279
0019  77 06				ja		L$1
001B  B8 01 00 00 00			mov		eax,0x00000001
0020  C3				ret		
0021				L$1:
0021  31 C0				xor		eax,eax
0023  C3				ret		
0024				L$2:
0024  F6 C4 FF				test		ah,0xff
0027  75 F8				jne		L$1
0029  FE C0				inc		al
002B  25 FF 00 00 00			and		eax,0x000000ff
0030  8A 80 00 00 00 00			mov		al,byte ptr _IsTable[eax]
0036  24 40				and		al,0x40
0038  25 FF 00 00 00			and		eax,0x000000ff
003D  C3				ret		

Routine Size: 62 bytes,    Routine Base: _TEXT + 0000

003E				_ismbdlower:
003E  8B 44 24 04			mov		eax,dword ptr 0x4[esp]
0042  83 3D 00 00 00 00 00		cmp		dword ptr __IsDBCS,0x00000000
0049  74 17				je		L$4
004B  3D 81 82 00 00			cmp		eax,0x00008281
0050  72 0D				jb		L$3
0052  3D 9A 82 00 00			cmp		eax,0x0000829a
0057  77 06				ja		L$3
0059  B8 01 00 00 00			mov		eax,0x00000001
005E  C3				ret		
005F				L$3:
005F  31 C0				xor		eax,eax
0061  C3				ret		
0062				L$4:
0062  F6 C4 FF				test		ah,0xff
0065  75 F8				jne		L$3
0067  FE C0				inc		al
0069  25 FF 00 00 00			and		eax,0x000000ff
006E  8A 80 00 00 00 00			mov		al,byte ptr _IsTable[eax]
0074  24 80				and		al,0x80
0076  25 FF 00 00 00			and		eax,0x000000ff
007B  C3				ret		

Routine Size: 62 bytes,    Routine Base: _TEXT + 003E

007C				_ismbddigit:
007C  8B 44 24 04			mov		eax,dword ptr 0x4[esp]
0080  83 3D 00 00 00 00 00		cmp		dword ptr __IsDBCS,0x00000000
0087  74 17				je		L$6
0089  3D 4F 82 00 00			cmp		eax,0x0000824f
008E  72 0D				jb		L$5
0090  3D 58 82 00 00			cmp		eax,0x00008258
0095  77 06				ja		L$5
0097  B8 01 00 00 00			mov		eax,0x00000001
009C  C3				ret		
009D				L$5:
009D  31 C0				xor		eax,eax
009F  C3				ret		
00A0				L$6:
00A0  F6 C4 FF				test		ah,0xff
00A3  75 F8				jne		L$5
00A5  FE C0				inc		al
00A7  25 FF 00 00 00			and		eax,0x000000ff
00AC  8A 80 00 00 00 00			mov		al,byte ptr _IsTable[eax]
00B2  24 20				and		al,0x20
00B4  25 FF 00 00 00			and		eax,0x000000ff
00B9  C3				ret		

Routine Size: 62 bytes,    Routine Base: _TEXT + 007C

00BA				_ismbdspace:
00BA  8B 44 24 04			mov		eax,dword ptr 0x4[esp]
00BE  83 3D 00 00 00 00 00		cmp		dword ptr __IsDBCS,0x00000000
00C5  74 0A				je		L$7
00C7  3D 40 81 00 00			cmp		eax,0x00008140
00CC  0F 94 C0				sete		al
00CF  EB 17				jmp		L$9
00D1				L$7:
00D1  F6 C4 FF				test		ah,0xff
00D4  74 03				je		L$8
00D6  31 C0				xor		eax,eax
00D8  C3				ret		
00D9				L$8:
00D9  FE C0				inc		al
00DB  25 FF 00 00 00			and		eax,0x000000ff
00E0  8A 80 00 00 00 00			mov		al,byte ptr _IsTable[eax]
00E6  24 02				and		al,0x02
00E8				L$9:
00E8  25 FF 00 00 00			and		eax,0x000000ff
00ED  C3				ret		

Routine Size: 52 bytes,    Routine Base: _TEXT + 00BA

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes


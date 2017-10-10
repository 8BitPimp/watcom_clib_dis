Module: ufputs
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 0000009E bytes
0000				_ufputs:
0000  53				push		ebx
0001  56				push		esi
0002  57				push		edi
0003  C8 08 00 00			enter		0x0008,0x00
0007  8B 7D 14				mov		edi,dword ptr 0x14[ebp]
000A  8B 5D 18				mov		ebx,dword ptr 0x18[ebp]
000D  FF 73 10				push		dword ptr 0x10[ebx]
0010  FF 15 00 00 00 00			call		dword ptr _AccessFileH
0016  83 C4 04				add		esp,0x00000004
0019  83 7B 08 00			cmp		dword ptr 0x8[ebx],0x00000000
001D  75 09				jne		L$1
001F  53				push		ebx
0020  E8 00 00 00 00			call		__ioalloc
0025  83 C4 04				add		esp,0x00000004
0028				L$1:
0028  C7 45 FC 00 00 00 00		mov		dword ptr -0x4[ebp],0x00000000
002F  F6 43 0D 04			test		byte ptr 0xd[ebx],0x04
0033  74 0F				je		L$2
0035  80 63 0D F9			and		byte ptr 0xd[ebx],0xf9
0039  C7 45 FC 01 00 00 00		mov		dword ptr -0x4[ebp],0x00000001
0040  80 4B 0D 02			or		byte ptr 0xd[ebx],0x02
0044				L$2:
0044  89 7D F8				mov		dword ptr -0x8[ebp],edi
0047  31 F6				xor		esi,esi
0049				L$3:
0049  0F B7 07				movzx		eax,word ptr [edi]
004C  85 C0				test		eax,eax
004E  74 13				je		L$4
0050  53				push		ebx
0051  50				push		eax
0052  47				inc		edi
0053  47				inc		edi
0054  E8 00 00 00 00			call		_ufputc
0059  83 C4 08				add		esp,0x00000008
005C  83 F8 FF				cmp		eax,0xffffffff
005F  75 E8				jne		L$3
0061  89 C6				mov		esi,eax
0063				L$4:
0063  83 7D FC 00			cmp		dword ptr -0x4[ebp],0x00000000
0067  74 17				je		L$5
0069  80 63 0D F9			and		byte ptr 0xd[ebx],0xf9
006D  80 4B 0D 04			or		byte ptr 0xd[ebx],0x04
0071  85 F6				test		esi,esi
0073  75 0B				jne		L$5
0075  53				push		ebx
0076  E8 00 00 00 00			call		__flush
007B  83 C4 04				add		esp,0x00000004
007E  89 C6				mov		esi,eax
0080				L$5:
0080  85 F6				test		esi,esi
0082  75 07				jne		L$6
0084  89 FE				mov		esi,edi
0086  2B 75 F8				sub		esi,dword ptr -0x8[ebp]
0089  D1 FE				sar		esi,0x01
008B				L$6:
008B  FF 73 10				push		dword ptr 0x10[ebx]
008E  FF 15 00 00 00 00			call		dword ptr _ReleaseFileH
0094  83 C4 04				add		esp,0x00000004
0097  89 F0				mov		eax,esi
0099  C9				leave		
009A  5F				pop		edi
009B  5E				pop		esi
009C  5B				pop		ebx
009D  C3				ret		

Routine Size: 158 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes


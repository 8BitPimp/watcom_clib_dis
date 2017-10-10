Module: thrdxwnt
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 0000014E bytes
0000				_begin_thread_helper:
0000  53				push		ebx
0001  56				push		esi
0002  57				push		edi
0003  55				push		ebp
0004  89 E5				mov		ebp,esp
0006  83 EC 0C				sub		esp,0x0000000c
0009  8B 5D 14				mov		ebx,dword ptr 0x14[ebp]
000C  8B 15 00 00 00 00			mov		edx,dword ptr __Is_DLL
0012  8B 03				mov		eax,dword ptr [ebx]
0014  8B 7B 04				mov		edi,dword ptr 0x4[ebx]
0017  89 45 FC				mov		dword ptr -0x4[ebp],eax
001A  85 D2				test		edx,edx
001C  75 2C				jne		L$1
001E  A1 00 00 00 00			mov		eax,dword ptr __ThreadDataSize
0023  83 C0 03				add		eax,0x00000003
0026  24 FC				and		al,0xfc
0028  29 C4				sub		esp,eax
002A  89 E6				mov		esi,esp
002C  8B 0D 00 00 00 00			mov		ecx,dword ptr __ThreadDataSize
0032  51				push		ecx
0033  52				push		edx
0034  56				push		esi
0035  E8 00 00 00 00			call		memset
003A  83 C4 0C				add		esp,0x0000000c
003D  56				push		esi
003E  E8 00 00 00 00			call		__NTAddThread
0043  83 C4 04				add		esp,0x00000004
0046  85 C0				test		eax,eax
0048  74 4B				je		L$3
004A				L$1:
004A  8B 73 0C				mov		esi,dword ptr 0xc[ebx]
004D  85 F6				test		esi,esi
004F  74 11				je		L$2
0051  89 E0				mov		eax,esp
0053  2B 43 0C				sub		eax,dword ptr 0xc[ebx]
0056  05 FF 0F 00 00			add		eax,0x00000fff
005B  30 C0				xor		al,al
005D  80 E4 F0				and		ah,0xf0
0060  89 C6				mov		esi,eax
0062				L$2:
0062  FF 15 00 00 00 00			call		dword ptr __GetThreadPtr
0068  89 30				mov		dword ptr [eax],esi
006A  53				push		ebx
006B  E8 00 00 00 00			call		free
0070  83 C4 04				add		esp,0x00000004
0073  8D 45 F4				lea		eax,-0xc[ebp]
0076  50				push		eax
0077  E8 00 00 00 00			call		__NewExceptionHandler
007C  83 C4 04				add		esp,0x00000004
007F  FF 15 00 00 00 00			call		dword ptr __sig_init_rtn
0085  57				push		edi
0086  FF 55 FC				call		dword ptr -0x4[ebp]
0089  6A 00				push		0x00000000
008B  E8 00 00 00 00			call		_endthreadex
0090  83 C4 04				add		esp,0x00000004
0093  31 C0				xor		eax,eax
0095				L$3:
0095  89 EC				mov		esp,ebp
0097  5D				pop		ebp
0098  5F				pop		edi
0099  5E				pop		esi
009A  5B				pop		ebx
009B  C2 04 00				ret		0x0004

Routine Size: 158 bytes,    Routine Base: _TEXT + 0000

009E				__CBeginThreadEx:
009E  53				push		ebx
009F  56				push		esi
00A0  57				push		edi
00A1  55				push		ebp
00A2  8B 74 24 18			mov		esi,dword ptr 0x18[esp]
00A6  6A 10				push		0x00000010
00A8  E8 00 00 00 00			call		malloc
00AD  83 C4 04				add		esp,0x00000004
00B0  89 C3				mov		ebx,eax
00B2  85 C0				test		eax,eax
00B4  75 11				jne		L$4
00B6  6A 05				push		0x00000005
00B8  E8 00 00 00 00			call		__set_errno
00BD  83 C4 04				add		esp,0x00000004
00C0  31 C0				xor		eax,eax
00C2  5D				pop		ebp
00C3  5F				pop		edi
00C4  5E				pop		esi
00C5  5B				pop		ebx
00C6  C3				ret		
00C7				L$4:
00C7  83 3D 00 00 00 00 FF		cmp		dword ptr __TlsIndex,0xffffffff
00CE  75 0E				jne		L$5
00D0  E8 00 00 00 00			call		__NTThreadInit
00D5  85 C0				test		eax,eax
00D7  74 45				je		L$6
00D9  E8 00 00 00 00			call		__InitMultipleThread
00DE				L$5:
00DE  8D 86 FF 0F 00 00			lea		eax,0xfff[esi]
00E4  30 C0				xor		al,al
00E6  80 E4 F0				and		ah,0xf0
00E9  89 C6				mov		esi,eax
00EB  8B 44 24 1C			mov		eax,dword ptr 0x1c[esp]
00EF  89 03				mov		dword ptr [ebx],eax
00F1  8B 44 24 20			mov		eax,dword ptr 0x20[esp]
00F5  89 43 04				mov		dword ptr 0x4[ebx],eax
00F8  E8 00 00 00 00			call		_GetCurrentThread
00FD  8B 4C 24 28			mov		ecx,dword ptr 0x28[esp]
0101  51				push		ecx
0102  8B 7C 24 28			mov		edi,dword ptr 0x28[esp]
0106  57				push		edi
0107  53				push		ebx
0108  68 00 00 00 00			push		offset _begin_thread_helper
010D  56				push		esi
010E  8B 6C 24 28			mov		ebp,dword ptr 0x28[esp]
0112  89 43 08				mov		dword ptr 0x8[ebx],eax
0115  55				push		ebp
0116  89 73 0C				mov		dword ptr 0xc[ebx],esi
0119  E8 00 00 00 00			call		_CreateThread
011E				L$6:
011E  5D				pop		ebp
011F  5F				pop		edi
0120  5E				pop		esi
0121  5B				pop		ebx
0122  C3				ret		

Routine Size: 133 bytes,    Routine Base: _TEXT + 009E

0123				__CEndThreadEx:
0123  53				push		ebx
0124  FF 15 00 00 00 00			call		dword ptr __sig_fini_rtn
012A  E8 00 00 00 00			call		__DoneExceptionHandler
012F  83 3D 00 00 00 00 00		cmp		dword ptr __Is_DLL,0x00000000
0136  75 0A				jne		L$7
0138  6A 01				push		0x00000001
013A  E8 00 00 00 00			call		__NTRemoveThread
013F  83 C4 04				add		esp,0x00000004
0142				L$7:
0142  8B 5C 24 08			mov		ebx,dword ptr 0x8[esp]
0146  53				push		ebx
0147  E8 00 00 00 00			call		_ExitThread
014C  5B				pop		ebx
014D  C3				ret		

Routine Size: 43 bytes,    Routine Base: _TEXT + 0123

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes


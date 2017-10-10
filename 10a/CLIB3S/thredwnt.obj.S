Module: thredwnt
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 000001DA bytes
0000				_begin_thread_helper:
0000  56				push		esi
0001  57				push		edi
0002  55				push		ebp
0003  89 E5				mov		ebp,esp
0005  83 EC 0C				sub		esp,0x0000000c
0008  8B 5D 10				mov		ebx,dword ptr 0x10[ebp]
000B  8B 03				mov		eax,dword ptr [ebx]
000D  89 45 FC				mov		dword ptr -0x4[ebp],eax
0010  A1 00 00 00 00			mov		eax,dword ptr __ThreadDataSize
0015  83 C0 03				add		eax,0x00000003
0018  24 FC				and		al,0xfc
001A  8B 7B 04				mov		edi,dword ptr 0x4[ebx]
001D  29 C4				sub		esp,eax
001F  89 E6				mov		esi,esp
0021  8B 15 00 00 00 00			mov		edx,dword ptr __ThreadDataSize
0027  52				push		edx
0028  6A 00				push		0x00000000
002A  56				push		esi
002B  E8 00 00 00 00			call		memset
0030  8B 0D 00 00 00 00			mov		ecx,dword ptr __Is_DLL
0036  83 C4 0C				add		esp,0x0000000c
0039  85 C9				test		ecx,ecx
003B  75 0D				jne		L$1
003D  56				push		esi
003E  E8 00 00 00 00			call		__NTAddThread
0043  83 C4 04				add		esp,0x00000004
0046  85 C0				test		eax,eax
0048  74 32				je		L$2
004A				L$1:
004A  FF 15 00 00 00 00			call		dword ptr __GetThreadPtr
0050  8B 73 0C				mov		esi,dword ptr 0xc[ebx]
0053  89 30				mov		dword ptr [eax],esi
0055  8B 73 10				mov		esi,dword ptr 0x10[ebx]
0058  56				push		esi
0059  E8 00 00 00 00			call		_SetEvent
005E  8D 45 F4				lea		eax,-0xc[ebp]
0061  50				push		eax
0062  E8 00 00 00 00			call		__NewExceptionHandler
0067  83 C4 04				add		esp,0x00000004
006A  FF 15 00 00 00 00			call		dword ptr __sig_init_rtn
0070  57				push		edi
0071  FF 55 FC				call		dword ptr -0x4[ebp]
0074  83 C4 04				add		esp,0x00000004
0077  E8 00 00 00 00			call		_endthread
007C				L$2:
007C  89 EC				mov		esp,ebp
007E  5D				pop		ebp
007F  5F				pop		edi
0080  5E				pop		esi
0081  C3				ret		

Routine Size: 130 bytes,    Routine Base: _TEXT + 0000

0082				__CBeginThread:
0082  53				push		ebx
0083  56				push		esi
0084  57				push		edi
0085  06				push		es
0086  55				push		ebp
0087  81 EC 04 01 00 00			sub		esp,0x00000104
008D  8B AC 24 24 01 00 00		mov		ebp,dword ptr 0x124[esp]
0094  83 3D 00 00 00 00 FF		cmp		dword ptr __TlsIndex,0xffffffff
009B  75 18				jne		L$5
009D  E8 00 00 00 00			call		__NTThreadInit
00A2  85 C0				test		eax,eax
00A4  75 0A				jne		L$4
00A6				L$3:
00A6  B8 FF FF FF FF			mov		eax,0xffffffff
00AB  E9 FD 00 00 00			jmp		L$6
00B0				L$4:
00B0  E8 00 00 00 00			call		__InitMultipleThread
00B5				L$5:
00B5  8D 85 FF 0F 00 00			lea		eax,0xfff[ebp]
00BB  80 E4 F0				and		ah,0xf0
00BE  30 C0				xor		al,al
00C0  89 C5				mov		ebp,eax
00C2  8B 84 24 1C 01 00 00		mov		eax,dword ptr 0x11c[esp]
00C9  89 84 24 EC 00 00 00		mov		dword ptr 0xec[esp],eax
00D0  8B 84 24 28 01 00 00		mov		eax,dword ptr 0x128[esp]
00D7  8D BC 24 CC 00 00 00		lea		edi,0xcc[esp]
00DE  89 84 24 F0 00 00 00		mov		dword ptr 0xf0[esp],eax
00E5  E8 00 00 00 00			call		_GetCurrentThread
00EA  89 84 24 F4 00 00 00		mov		dword ptr 0xf4[esp],eax
00F1  8C D8				mov		eax,ds
00F3  6A 10				push		0x00000010
00F5  8E C0				mov		es,eax
00F7  8D 84 24 D8 00 00 00		lea		eax,0xd8[esp]
00FE  BE 00 00 00 00			mov		esi,offset DGROUP:L$8
0103  50				push		eax
0104  A5				movsd		
0105  A5				movsd		
0106  A4				movsb		
0107  E8 00 00 00 00			call		_GetCurrentThreadId
010C  50				push		eax
010D  E8 00 00 00 00			call		itoa
0112  83 C4 0C				add		esp,0x0000000c
0115  8D 84 24 CC 00 00 00		lea		eax,0xcc[esp]
011C  50				push		eax
011D  6A 00				push		0x00000000
011F  6A 00				push		0x00000000
0121  6A 00				push		0x00000000
0123  E8 00 00 00 00			call		_CreateEventA
0128  89 84 24 FC 00 00 00		mov		dword ptr 0xfc[esp],eax
012F  8D 84 24 00 01 00 00		lea		eax,0x100[esp]
0136  50				push		eax
0137  6A 04				push		0x00000004
0139  8D 84 24 F4 00 00 00		lea		eax,0xf4[esp]
0140  50				push		eax
0141  68 00 00 00 00			push		offset _begin_thread_helper
0146  55				push		ebp
0147  6A 00				push		0x00000000
0149  E8 00 00 00 00			call		_CreateThread
014E  89 C3				mov		ebx,eax
0150  85 C0				test		eax,eax
0152  0F 84 4E FF FF FF			je		L$3
0158  89 E0				mov		eax,esp
015A  50				push		eax
015B  B9 03 00 01 00			mov		ecx,0x00010003
0160  53				push		ebx
0161  89 4C 24 08			mov		dword ptr 0x8[esp],ecx
0165  E8 00 00 00 00			call		_GetThreadContext
016A  8B 84 24 C4 00 00 00		mov		eax,dword ptr 0xc4[esp]
0171  05 FF 0F 00 00			add		eax,0x00000fff
0176  80 E4 F0				and		ah,0xf0
0179  30 C0				xor		al,al
017B  29 E8				sub		eax,ebp
017D  53				push		ebx
017E  89 84 24 FC 00 00 00		mov		dword ptr 0xfc[esp],eax
0185  E8 00 00 00 00			call		_ResumeThread
018A  6A FF				push		0xffffffff
018C  8B B4 24 00 01 00 00		mov		esi,dword ptr 0x100[esp]
0193  56				push		esi
0194  E8 00 00 00 00			call		_WaitForSingleObject
0199  8B BC 24 FC 00 00 00		mov		edi,dword ptr 0xfc[esp]
01A0  57				push		edi
01A1  E8 00 00 00 00			call		_CloseHandle
01A6  8B 84 24 00 01 00 00		mov		eax,dword ptr 0x100[esp]
01AD				L$6:
01AD  81 C4 04 01 00 00			add		esp,0x00000104
01B3  5D				pop		ebp
01B4  07				pop		es
01B5  5F				pop		edi
01B6  5E				pop		esi
01B7  5B				pop		ebx
01B8  C3				ret		

Routine Size: 311 bytes,    Routine Base: _TEXT + 0082

01B9				__CEndThread:
01B9  FF 15 00 00 00 00			call		dword ptr __sig_fini_rtn
01BF  E8 00 00 00 00			call		__DoneExceptionHandler
01C4  83 3D 00 00 00 00 00		cmp		dword ptr __Is_DLL,0x00000000
01CB  75 05				jne		L$7
01CD  E8 00 00 00 00			call		__NTRemoveThread
01D2				L$7:
01D2  6A 00				push		0x00000000
01D4  E8 00 00 00 00			call		_ExitThread
01D9  C3				ret		

Routine Size: 33 bytes,    Routine Base: _TEXT + 01B9

No disassembly errors

Segment: CONST DWORD USE32 00000009 bytes
0000				L$8:
0000  5F 5F 62 67 6E 74 68 64 00                      __bgnthd.

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes


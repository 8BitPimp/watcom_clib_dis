Module: thredwnt
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 000001BB bytes
0000				_begin_thread_helper:
0000  56				push		esi
0001  57				push		edi
0002  55				push		ebp
0003  89 E5				mov		ebp,esp
0005  83 EC 10				sub		esp,0x00000010
0008  8B 5D 10				mov		ebx,dword ptr 0x10[ebp]
000B  8B 15 00 00 00 00			mov		edx,dword ptr __Is_DLL
0011  8B 03				mov		eax,dword ptr [ebx]
0013  8B 7B 14				mov		edi,dword ptr 0x14[ebx]
0016  89 45 F8				mov		dword ptr -0x8[ebp],eax
0019  8B 43 04				mov		eax,dword ptr 0x4[ebx]
001C  8B 3F				mov		edi,dword ptr [edi]
001E  89 45 FC				mov		dword ptr -0x4[ebp],eax
0021  85 D2				test		edx,edx
0023  75 34				jne		L$1
0025  A1 00 00 00 00			mov		eax,dword ptr __ThreadDataSize
002A  83 C0 03				add		eax,0x00000003
002D  24 FC				and		al,0xfc
002F  29 C4				sub		esp,eax
0031  89 E6				mov		esi,esp
0033  8B 0D 00 00 00 00			mov		ecx,dword ptr __ThreadDataSize
0039  51				push		ecx
003A  52				push		edx
003B  56				push		esi
003C  E8 00 00 00 00			call		memset
0041  83 C4 0C				add		esp,0x0000000c
0044  56				push		esi
0045  E8 00 00 00 00			call		__NTAddThread
004A  83 C4 04				add		esp,0x00000004
004D  85 C0				test		eax,eax
004F  75 08				jne		L$1
0051  57				push		edi
0052  E8 00 00 00 00			call		_CloseHandle
0057  EB 56				jmp		L$3
0059				L$1:
0059  FF 15 00 00 00 00			call		dword ptr __GetThreadPtr
005F  89 B8 DE 00 00 00			mov		dword ptr 0xde[eax],edi
0065  8B 73 0C				mov		esi,dword ptr 0xc[ebx]
0068  85 F6				test		esi,esi
006A  74 11				je		L$2
006C  89 E0				mov		eax,esp
006E  2B 43 0C				sub		eax,dword ptr 0xc[ebx]
0071  05 FF 0F 00 00			add		eax,0x00000fff
0076  30 C0				xor		al,al
0078  80 E4 F0				and		ah,0xf0
007B  89 C6				mov		esi,eax
007D				L$2:
007D  FF 15 00 00 00 00			call		dword ptr __GetThreadPtr
0083  89 30				mov		dword ptr [eax],esi
0085  8B 43 10				mov		eax,dword ptr 0x10[ebx]
0088  50				push		eax
0089  E8 00 00 00 00			call		_SetEvent
008E  8D 45 F0				lea		eax,-0x10[ebp]
0091  50				push		eax
0092  E8 00 00 00 00			call		__NewExceptionHandler
0097  83 C4 04				add		esp,0x00000004
009A  FF 15 00 00 00 00			call		dword ptr __sig_init_rtn
00A0  8B 55 FC				mov		edx,dword ptr -0x4[ebp]
00A3  52				push		edx
00A4  FF 55 F8				call		dword ptr -0x8[ebp]
00A7  83 C4 04				add		esp,0x00000004
00AA  E8 00 00 00 00			call		_endthread
00AF				L$3:
00AF  89 EC				mov		esp,ebp
00B1  5D				pop		ebp
00B2  5F				pop		edi
00B3  5E				pop		esi
00B4  C3				ret		

Routine Size: 181 bytes,    Routine Base: _TEXT + 0000

00B5				__CBeginThread:
00B5  53				push		ebx
00B6  56				push		esi
00B7  57				push		edi
00B8  06				push		es
00B9  83 EC 40				sub		esp,0x00000040
00BC  8B 5C 24 5C			mov		ebx,dword ptr 0x5c[esp]
00C0  83 3D 00 00 00 00 FF		cmp		dword ptr __TlsIndex,0xffffffff
00C7  75 18				jne		L$5
00C9  E8 00 00 00 00			call		__NTThreadInit
00CE  85 C0				test		eax,eax
00D0  75 0A				jne		L$4
00D2  B8 FF FF FF FF			mov		eax,0xffffffff
00D7  E9 B1 00 00 00			jmp		L$8
00DC				L$4:
00DC  E8 00 00 00 00			call		__InitMultipleThread
00E1				L$5:
00E1  8D 83 FF 0F 00 00			lea		eax,0xfff[ebx]
00E7  30 C0				xor		al,al
00E9  80 E4 F0				and		ah,0xf0
00EC  89 C3				mov		ebx,eax
00EE  8B 44 24 54			mov		eax,dword ptr 0x54[esp]
00F2  89 44 24 20			mov		dword ptr 0x20[esp],eax
00F6  8B 44 24 60			mov		eax,dword ptr 0x60[esp]
00FA  89 E7				mov		edi,esp
00FC  89 44 24 24			mov		dword ptr 0x24[esp],eax
0100  E8 00 00 00 00			call		_GetCurrentThread
0105  89 44 24 28			mov		dword ptr 0x28[esp],eax
0109  8C D8				mov		eax,ds
010B  6A 10				push		0x00000010
010D  8E C0				mov		es,eax
010F  8D 44 24 0C			lea		eax,0xc[esp]
0113  BE 00 00 00 00			mov		esi,offset DGROUP:L$10
0118  89 5C 24 30			mov		dword ptr 0x30[esp],ebx
011C  50				push		eax
011D  A5				movsd		
011E  A5				movsd		
011F  A4				movsb		
0120  E8 00 00 00 00			call		_GetCurrentThreadId
0125  50				push		eax
0126  E8 00 00 00 00			call		itoa
012B  83 C4 0C				add		esp,0x0000000c
012E  89 E0				mov		eax,esp
0130  50				push		eax
0131  6A 00				push		0x00000000
0133  6A 00				push		0x00000000
0135  6A 00				push		0x00000000
0137  E8 00 00 00 00			call		_CreateEventA
013C  89 44 24 30			mov		dword ptr 0x30[esp],eax
0140  8D 44 24 38			lea		eax,0x38[esp]
0144  89 44 24 34			mov		dword ptr 0x34[esp],eax
0148  8D 44 24 3C			lea		eax,0x3c[esp]
014C  50				push		eax
014D  6A 00				push		0x00000000
014F  8D 44 24 28			lea		eax,0x28[esp]
0153  50				push		eax
0154  68 00 00 00 00			push		offset _begin_thread_helper
0159  53				push		ebx
015A  6A 00				push		0x00000000
015C  E8 00 00 00 00			call		_CreateThread
0161  89 44 24 38			mov		dword ptr 0x38[esp],eax
0165  85 C0				test		eax,eax
0167  75 0A				jne		L$6
0169  C7 44 24 3C FF FF FF FF		mov		dword ptr 0x3c[esp],0xffffffff
0171  EB 0C				jmp		L$7
0173				L$6:
0173  6A FF				push		0xffffffff
0175  8B 5C 24 34			mov		ebx,dword ptr 0x34[esp]
0179  53				push		ebx
017A  E8 00 00 00 00			call		_WaitForSingleObject
017F				L$7:
017F  8B 74 24 30			mov		esi,dword ptr 0x30[esp]
0183  56				push		esi
0184  E8 00 00 00 00			call		_CloseHandle
0189  8B 44 24 3C			mov		eax,dword ptr 0x3c[esp]
018D				L$8:
018D  83 C4 40				add		esp,0x00000040
0190  07				pop		es
0191  5F				pop		edi
0192  5E				pop		esi
0193  5B				pop		ebx
0194  C3				ret		

Routine Size: 224 bytes,    Routine Base: _TEXT + 00B5

0195				__CEndThread:
0195  FF 15 00 00 00 00			call		dword ptr __sig_fini_rtn
019B  E8 00 00 00 00			call		__DoneExceptionHandler
01A0  83 3D 00 00 00 00 00		cmp		dword ptr __Is_DLL,0x00000000
01A7  75 0A				jne		L$9
01A9  6A 01				push		0x00000001
01AB  E8 00 00 00 00			call		__NTRemoveThread
01B0  83 C4 04				add		esp,0x00000004
01B3				L$9:
01B3  6A 00				push		0x00000000
01B5  E8 00 00 00 00			call		_ExitThread
01BA  C3				ret		

Routine Size: 38 bytes,    Routine Base: _TEXT + 0195

No disassembly errors

Segment: CONST DWORD USE32 00000009 bytes
0000				L$10:
0000  5F 5F 62 67 6E 74 68 64 00                      __bgnthd.

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes


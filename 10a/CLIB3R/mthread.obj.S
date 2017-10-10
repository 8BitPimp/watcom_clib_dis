Module: mthread
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS,YIB,YI,YIE

Segment: _TEXT BYTE USE32 000003E2 bytes
0000				nullSema4Rtn_:
0000  C3				ret		

Routine Size: 1 bytes,    Routine Base: _TEXT + 0000

0001				__CloseSemaphore_:
0001  53				push		ebx
0002  51				push		ecx
0003  52				push		edx
0004  89 C3				mov		ebx,eax
0006  8B 10				mov		edx,dword ptr [eax]
0008  85 D2				test		edx,edx
000A  74 06				je		L$1
000C  52				push		edx
000D  E8 00 00 00 00			call		_CloseHandle
0012				L$1:
0012  C7 03 00 00 00 00			mov		dword ptr [ebx],0x00000000
0018  C7 43 04 00 00 00 00		mov		dword ptr 0x4[ebx],0x00000000
001F  C7 43 08 00 00 00 00		mov		dword ptr 0x8[ebx],0x00000000
0026  5A				pop		edx
0027  59				pop		ecx
0028  5B				pop		ebx
0029  C3				ret		

Routine Size: 41 bytes,    Routine Base: _TEXT + 0001

002A				__AccessIOB_:
002A  B8 00 00 00 00			mov		eax,offset _IOBSemaphore
002F  E9 00 00 00 00			jmp		__AccessSemaphore_

Routine Size: 10 bytes,    Routine Base: _TEXT + 002A

0034				__ReleaseIOB_:
0034  B8 00 00 00 00			mov		eax,offset _IOBSemaphore
0039  E9 00 00 00 00			jmp		__ReleaseSemaphore_

Routine Size: 10 bytes,    Routine Base: _TEXT + 0034

003E				__AccessFileH_:
003E  52				push		edx
003F  83 E0 0F				and		eax,0x0000000f
0042  89 C2				mov		edx,eax
0044  C1 E0 02				shl		eax,0x02
0047  29 D0				sub		eax,edx
0049  C1 E0 02				shl		eax,0x02
004C  05 00 00 00 00			add		eax,offset _FileSemaphores
0051  E8 00 00 00 00			call		__AccessSemaphore_
0056  5A				pop		edx
0057  C3				ret		

Routine Size: 26 bytes,    Routine Base: _TEXT + 003E

0058				__ReleaseFileH_:
0058  52				push		edx
0059  83 E0 0F				and		eax,0x0000000f
005C  89 C2				mov		edx,eax
005E  C1 E0 02				shl		eax,0x02
0061  29 D0				sub		eax,edx
0063  C1 E0 02				shl		eax,0x02
0066  05 00 00 00 00			add		eax,offset _FileSemaphores
006B  E8 00 00 00 00			call		__ReleaseSemaphore_
0070  5A				pop		edx
0071  C3				ret		

Routine Size: 26 bytes,    Routine Base: _TEXT + 0058

0072				__InitAccessH_:
0072  E9 00 00 00 00			jmp		__NTAddFileHandle_

Routine Size: 5 bytes,    Routine Base: _TEXT + 0072

0077				__FiniAccessH_:
0077  53				push		ebx
0078  52				push		edx
0079  89 C2				mov		edx,eax
007B  83 E0 0F				and		eax,0x0000000f
007E  89 C3				mov		ebx,eax
0080  C1 E0 02				shl		eax,0x02
0083  29 D8				sub		eax,ebx
0085  C1 E0 02				shl		eax,0x02
0088  05 00 00 00 00			add		eax,offset _FileSemaphores
008D  E8 00 00 00 00			call		__CloseSemaphore_
0092  89 D0				mov		eax,edx
0094  E8 00 00 00 00			call		__NTRemoveFileHandle_
0099  5A				pop		edx
009A  5B				pop		ebx
009B  C3				ret		

Routine Size: 37 bytes,    Routine Base: _TEXT + 0077

009C				__AccessNHeap_:
009C  B8 00 00 00 00			mov		eax,offset _NHeapSemaphore
00A1  EB 2E				jmp		__AccessSemaphore_

Routine Size: 7 bytes,    Routine Base: _TEXT + 009C

00A3				__ReleaseNHeap_:
00A3  B8 00 00 00 00			mov		eax,offset _NHeapSemaphore
00A8  E9 00 00 00 00			jmp		__ReleaseSemaphore_

Routine Size: 10 bytes,    Routine Base: _TEXT + 00A3

00AD				__AccessFHeap_:
00AD  B8 00 00 00 00			mov		eax,offset _FHeapSemaphore
00B2  EB 1D				jmp		__AccessSemaphore_

Routine Size: 7 bytes,    Routine Base: _TEXT + 00AD

00B4				__ReleaseFHeap_:
00B4  B8 00 00 00 00			mov		eax,offset _FHeapSemaphore
00B9  E9 00 00 00 00			jmp		__ReleaseSemaphore_

Routine Size: 10 bytes,    Routine Base: _TEXT + 00B4

00BE				__AccessTDList_:
00BE  B8 00 00 00 00			mov		eax,offset _TDListSemaphore
00C3  EB 0C				jmp		__AccessSemaphore_

Routine Size: 7 bytes,    Routine Base: _TEXT + 00BE

00C5				__ReleaseTDList_:
00C5  B8 00 00 00 00			mov		eax,offset _TDListSemaphore
00CA  EB 5E				jmp		__ReleaseSemaphore_

Routine Size: 7 bytes,    Routine Base: _TEXT + 00C5

00CC				__AccessFList_:
00CC  B8 00 00 00 00			mov		eax,offset _FListSemaphore

Routine Size: 5 bytes,    Routine Base: _TEXT + 00CC

00D1				__AccessSemaphore_:
00D1  53				push		ebx
00D2  51				push		ecx
00D3  52				push		edx
00D4  56				push		esi
00D5  57				push		edi
00D6  89 C3				mov		ebx,eax
00D8  E8 00 00 00 00			call		_GetCurrentThreadId
00DD  8B 4B 04				mov		ecx,dword ptr 0x4[ebx]
00E0  89 C6				mov		esi,eax
00E2  39 C8				cmp		eax,ecx
00E4  74 36				je		L$4
00E6  8B 3B				mov		edi,dword ptr [ebx]
00E8  85 FF				test		edi,edi
00EA  75 23				jne		L$3
00EC  B8 00 00 00 00			mov		eax,offset _InitSemaphore
00F1  E8 00 00 00 00			call		__AccessSemaphore_
00F6  83 3B 00				cmp		dword ptr [ebx],0x00000000
00F9  75 0A				jne		L$2
00FB  57				push		edi
00FC  57				push		edi
00FD  57				push		edi
00FE  E8 00 00 00 00			call		_CreateMutexA
0103  89 03				mov		dword ptr [ebx],eax
0105				L$2:
0105  B8 00 00 00 00			mov		eax,offset _InitSemaphore
010A  E8 00 00 00 00			call		__ReleaseSemaphore_
010F				L$3:
010F  6A FF				push		0xffffffff
0111  8B 03				mov		eax,dword ptr [ebx]
0113  50				push		eax
0114  E8 00 00 00 00			call		_WaitForSingleObject
0119  89 73 04				mov		dword ptr 0x4[ebx],esi
011C				L$4:
011C  FF 43 08				inc		dword ptr 0x8[ebx]
011F				L$5:
011F  5F				pop		edi
0120  5E				pop		esi
0121  5A				pop		edx
0122  59				pop		ecx
0123  5B				pop		ebx
0124  C3				ret		

Routine Size: 84 bytes,    Routine Base: _TEXT + 00D1

0125				__ReleaseFList_:
0125  B8 00 00 00 00			mov		eax,offset _FListSemaphore

Routine Size: 5 bytes,    Routine Base: _TEXT + 0125

012A				__ReleaseSemaphore_:
012A  53				push		ebx
012B  51				push		ecx
012C  52				push		edx
012D  56				push		esi
012E  8B 50 08				mov		edx,dword ptr 0x8[eax]
0131  85 D2				test		edx,edx
0133  76 15				jbe		L$6
0135  8D 5A FF				lea		ebx,-0x1[edx]
0138  89 58 08				mov		dword ptr 0x8[eax],ebx
013B  85 DB				test		ebx,ebx
013D  75 0B				jne		L$6
013F  8B 30				mov		esi,dword ptr [eax]
0141  56				push		esi
0142  89 58 04				mov		dword ptr 0x4[eax],ebx
0145  E8 00 00 00 00			call		_ReleaseMutex
014A				L$6:
014A  5E				pop		esi
014B  5A				pop		edx
014C  59				pop		ecx
014D  5B				pop		ebx
014E  C3				ret		

Routine Size: 37 bytes,    Routine Base: _TEXT + 012A

014F				__MultipleThread_:
014F  51				push		ecx
0150  52				push		edx
0151  8B 15 00 00 00 00			mov		edx,dword ptr ___TlsIndex
0157  52				push		edx
0158  E8 00 00 00 00			call		_TlsGetValue
015D  85 C0				test		eax,eax
015F  75 05				jne		L$7
0161  E8 00 00 00 00			call		__GetThreadData_
0166				L$7:
0166  5A				pop		edx
0167  59				pop		ecx
0168  C3				ret		

Routine Size: 26 bytes,    Routine Base: _TEXT + 014F

0169				__InitThreadData_:
0169  53				push		ebx
016A  51				push		ecx
016B  52				push		edx
016C  89 C3				mov		ebx,eax
016E  85 C0				test		eax,eax
0170  75 1C				jne		L$8
0172  B8 01 00 00 00			mov		eax,0x00000001
0177  8B 15 00 00 00 00			mov		edx,dword ptr ___ThreadDataSize
017D  E8 00 00 00 00			call		calloc_
0182  89 C2				mov		edx,eax
0184  89 C3				mov		ebx,eax
0186  85 C0				test		eax,eax
0188  74 04				je		L$8
018A  C6 40 52 01			mov		byte ptr 0x52[eax],0x01
018E				L$8:
018E  85 DB				test		ebx,ebx
0190  74 12				je		L$9
0192  C7 43 0C 01 00 00 00		mov		dword ptr 0xc[ebx],0x00000001
0199  E8 00 00 00 00			call		_GetCurrentThreadId
019E  89 83 DA 00 00 00			mov		dword ptr 0xda[ebx],eax
01A4				L$9:
01A4  89 D8				mov		eax,ebx
01A6  5A				pop		edx
01A7  59				pop		ecx
01A8  5B				pop		ebx
01A9  C3				ret		

Routine Size: 65 bytes,    Routine Base: _TEXT + 0169

01AA				__NTThreadInit_:
01AA  51				push		ecx
01AB  52				push		edx
01AC  E8 00 00 00 00			call		_TlsAlloc
01B1  A3 00 00 00 00			mov		dword ptr ___TlsIndex,eax
01B6  83 F8 FF				cmp		eax,0xffffffff
01B9  0F 95 C0				setne		al
01BC  25 FF 00 00 00			and		eax,0x000000ff
01C1  5A				pop		edx
01C2  59				pop		ecx
01C3  C3				ret		

Routine Size: 26 bytes,    Routine Base: _TEXT + 01AA

01C4				__NTAddThread_:
01C4  53				push		ebx
01C5  51				push		ecx
01C6  52				push		edx
01C7  83 3D 00 00 00 00 FF		cmp		dword ptr ___TlsIndex,0xffffffff
01CE  75 06				jne		L$11
01D0				L$10:
01D0  31 C0				xor		eax,eax
01D2  5A				pop		edx
01D3  59				pop		ecx
01D4  5B				pop		ebx
01D5  C3				ret		
01D6				L$11:
01D6  E8 00 00 00 00			call		__InitThreadData_
01DB  89 C3				mov		ebx,eax
01DD  85 C0				test		eax,eax
01DF  74 2C				je		L$13
01E1  89 DA				mov		edx,ebx
01E3  8B 80 DA 00 00 00			mov		eax,dword ptr 0xda[eax]
01E9  E8 00 00 00 00			call		__AddThreadData_
01EE  85 C0				test		eax,eax
01F0  75 09				jne		L$12
01F2  89 D8				mov		eax,ebx
01F4  E8 00 00 00 00			call		free_
01F9  EB D5				jmp		L$10
01FB				L$12:
01FB  53				push		ebx
01FC  8B 1D 00 00 00 00			mov		ebx,dword ptr ___TlsIndex
0202  53				push		ebx
0203  E8 00 00 00 00			call		_TlsSetValue
0208  B8 01 00 00 00			mov		eax,0x00000001
020D				L$13:
020D  5A				pop		edx
020E  59				pop		ecx
020F  5B				pop		ebx
0210  C3				ret		

Routine Size: 77 bytes,    Routine Base: _TEXT + 01C4

0211				__NTRemoveThread_:
0211  51				push		ecx
0212  52				push		edx
0213  8B 15 00 00 00 00			mov		edx,dword ptr ___TlsIndex
0219  83 FA FF				cmp		edx,0xffffffff
021C  74 23				je		L$14
021E  52				push		edx
021F  E8 00 00 00 00			call		_TlsGetValue
0224  85 C0				test		eax,eax
0226  74 19				je		L$14
0228  8B 80 DA 00 00 00			mov		eax,dword ptr 0xda[eax]
022E  E8 00 00 00 00			call		__RemoveThreadData_
0233  6A 00				push		0x00000000
0235  8B 0D 00 00 00 00			mov		ecx,dword ptr ___TlsIndex
023B  51				push		ecx
023C  E8 00 00 00 00			call		_TlsSetValue
0241				L$14:
0241  5A				pop		edx
0242  59				pop		ecx
0243  C3				ret		
0244				__ThreadExit_:
0244  E8 00 00 00 00			call		__NTRemoveThread_

Routine Size: 56 bytes,    Routine Base: _TEXT + 0211

0249				__NTThreadFini_:
0249  51				push		ecx
024A  52				push		edx
024B  8B 15 00 00 00 00			mov		edx,dword ptr ___TlsIndex
0251  83 FA FF				cmp		edx,0xffffffff
0254  74 10				je		L$15
0256  52				push		edx
0257  E8 00 00 00 00			call		_TlsFree
025C  C7 05 00 00 00 00 FF FF FF FF
					mov		dword ptr ___TlsIndex,0xffffffff
0266				L$15:
0266  5A				pop		edx
0267  59				pop		ecx
0268  C3				ret		

Routine Size: 32 bytes,    Routine Base: _TEXT + 0249

0269				__InitMultipleThread_:
0269  53				push		ebx
026A  51				push		ecx
026B  52				push		edx
026C  56				push		esi
026D  57				push		edi
026E  55				push		ebp
026F  BA 00 00 00 00			mov		edx,offset __AccessFileH_
0274  BB 00 00 00 00			mov		ebx,offset __ReleaseFileH_
0279  B9 00 00 00 00			mov		ecx,offset __InitAccessH_
027E  BE 00 00 00 00			mov		esi,offset __FiniAccessH_
0283  BF 00 00 00 00			mov		edi,offset __AccessIOB_
0288  6A 00				push		0x00000000
028A  BD 00 00 00 00			mov		ebp,offset __ReleaseIOB_
028F  B8 00 00 00 00			mov		eax,offset __AccessSemaphore_
0294  6A 00				push		0x00000000
0296  89 15 00 00 00 00			mov		dword ptr __AccessFileH,edx
029C  89 1D 00 00 00 00			mov		dword ptr __ReleaseFileH,ebx
02A2  89 0D 00 00 00 00			mov		dword ptr __InitAccessH,ecx
02A8  89 35 00 00 00 00			mov		dword ptr __FiniAccessH,esi
02AE  89 3D 00 00 00 00			mov		dword ptr __AccessIOB,edi
02B4  89 2D 00 00 00 00			mov		dword ptr __ReleaseIOB,ebp
02BA  A3 00 00 00 00			mov		dword ptr ___AccessSema4,eax
02BF  BA 00 00 00 00			mov		edx,offset __ReleaseSemaphore_
02C4  BB 00 00 00 00			mov		ebx,offset __CloseSemaphore_
02C9  B9 00 00 00 00			mov		ecx,offset __AccessNHeap_
02CE  BE 00 00 00 00			mov		esi,offset __AccessFHeap_
02D3  BF 00 00 00 00			mov		edi,offset __ReleaseNHeap_
02D8  BD 00 00 00 00			mov		ebp,offset __ReleaseFHeap_
02DD  B8 00 00 00 00			mov		eax,offset __AccessTDList_
02E2  6A 00				push		0x00000000
02E4  89 15 00 00 00 00			mov		dword ptr ___ReleaseSema4,edx
02EA  89 1D 00 00 00 00			mov		dword ptr ___CloseSema4,ebx
02F0  89 0D 00 00 00 00			mov		dword ptr __AccessNHeap,ecx
02F6  89 35 00 00 00 00			mov		dword ptr __AccessFHeap,esi
02FC  89 3D 00 00 00 00			mov		dword ptr __ReleaseNHeap,edi
0302  89 2D 00 00 00 00			mov		dword ptr __ReleaseFHeap,ebp
0308  A3 00 00 00 00			mov		dword ptr __AccessTDList,eax
030D  BA 00 00 00 00			mov		edx,offset __ReleaseTDList_
0312  BB 00 00 00 00			mov		ebx,offset __AccessFList_
0317  BE 00 00 00 00			mov		esi,offset __ThreadExit_
031C  89 15 00 00 00 00			mov		dword ptr __ReleaseTDList,edx
0322  E8 00 00 00 00			call		_CreateMutexA
0327  B9 00 00 00 00			mov		ecx,offset __ReleaseFList_
032C  8B 15 00 00 00 00			mov		edx,dword ptr ___FirstThreadData
0332  A3 00 00 00 00			mov		dword ptr _InitSemaphore,eax
0337  89 1D 00 00 00 00			mov		dword ptr __AccessFList,ebx
033D  89 35 00 00 00 00			mov		dword ptr __ThreadExitRtn,esi
0343  8B 82 DA 00 00 00			mov		eax,dword ptr 0xda[edx]
0349  89 0D 00 00 00 00			mov		dword ptr __ReleaseFList,ecx
034F  E8 00 00 00 00			call		__AddThreadData_
0354  8B 3D 00 00 00 00			mov		edi,dword ptr ___FirstThreadData
035A  57				push		edi
035B  8B 2D 00 00 00 00			mov		ebp,dword ptr ___TlsIndex
0361  55				push		ebp
0362  E8 00 00 00 00			call		_TlsSetValue
0367  C7 05 00 00 00 00 00 00 00 00
					mov		dword ptr ___GetThreadPtr,offset __MultipleThread_
0371  5D				pop		ebp
0372  E9 A8 FD FF FF			jmp		L$5
0377				__FiniSema4s_:
0377  53				push		ebx
0378  52				push		edx
0379  B8 00 00 00 00			mov		eax,offset _NHeapSemaphore
037E  FF 15 00 00 00 00			call		dword ptr ___CloseSema4
0384  B8 00 00 00 00			mov		eax,offset _FHeapSemaphore
0389  BA 00 00 00 00			mov		edx,offset _FileSemaphores
038E  FF 15 00 00 00 00			call		dword ptr ___CloseSema4
0394  B8 00 00 00 00			mov		eax,offset _IOBSemaphore
0399  8D 9A C0 00 00 00			lea		ebx,0xc0[edx]
039F  FF 15 00 00 00 00			call		dword ptr ___CloseSema4
03A5				L$16:
03A5  89 D0				mov		eax,edx
03A7  83 C2 0C				add		edx,0x0000000c
03AA  FF 15 00 00 00 00			call		dword ptr ___CloseSema4
03B0  39 DA				cmp		edx,ebx
03B2  75 F1				jne		L$16
03B4  B8 00 00 00 00			mov		eax,offset _FListSemaphore
03B9  FF 15 00 00 00 00			call		dword ptr ___CloseSema4
03BF  E8 00 00 00 00			call		__FiniThreadProcessing_
03C4  B8 00 00 00 00			mov		eax,offset _TDListSemaphore
03C9  FF 15 00 00 00 00			call		dword ptr ___CloseSema4
03CF  B8 00 00 00 00			mov		eax,offset _InitSemaphore
03D4  FF 15 00 00 00 00			call		dword ptr ___CloseSema4
03DA  E8 00 00 00 00			call		__NTThreadFini_
03DF  5A				pop		edx
03E0  5B				pop		ebx
03E1  C3				ret		

Routine Size: 377 bytes,    Routine Base: _TEXT + 0269

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 0000000C bytes
0000				___AccessSema4:
0000  00 00 00 00                                     DD	offset nullSema4Rtn_
0004				___ReleaseSema4:
0004  00 00 00 00                                     DD	offset nullSema4Rtn_
0008				___CloseSema4:
0008  00 00 00 00                                     DD	offset nullSema4Rtn_

Segment: _BSS DWORD USE32 00000108 bytes
0000				_FileSemaphores:
00C0				_TDListSemaphore:
00CC				_InitSemaphore:
00D8				_IOBSemaphore:
00E4				_NHeapSemaphore:
00F0				_FHeapSemaphore:
00FC				_FListSemaphore:

BSS Size: 264 bytes

Segment: YIB BYTE USE32 00000000 bytes

Segment: YI BYTE USE32 00000006 bytes
0000				___AccessSema4Fini:
0000  00 0A                                           ..
0002  00 00 00 00                                     DD	offset __FiniSema4s_

Segment: YIE BYTE USE32 00000000 bytes


Module: mthread
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS,YIB,YI,YIE

Segment: _TEXT BYTE USE32 00000476 bytes
0000				nullSema4Rtn:
0000  C3				ret		

Routine Size: 1 bytes,    Routine Base: _TEXT + 0000

0001				__CloseSemaphore:
0001  53				push		ebx
0002  8B 5C 24 08			mov		ebx,dword ptr 0x8[esp]
0006  83 7B 04 00			cmp		dword ptr 0x4[ebx],0x00000000
000A  74 08				je		L$1
000C  8B 0B				mov		ecx,dword ptr [ebx]
000E  51				push		ecx
000F  E8 00 00 00 00			call		_CloseHandle
0014				L$1:
0014  C7 43 04 00 00 00 00		mov		dword ptr 0x4[ebx],0x00000000
001B  C7 43 08 00 00 00 00		mov		dword ptr 0x8[ebx],0x00000000
0022  C7 43 0C 00 00 00 00		mov		dword ptr 0xc[ebx],0x00000000
0029  5B				pop		ebx
002A  C3				ret		

Routine Size: 42 bytes,    Routine Base: _TEXT + 0001

002B				__AccessSemaphore:
002B  53				push		ebx
002C  56				push		esi
002D  57				push		edi
002E  55				push		ebp
002F  8B 5C 24 14			mov		ebx,dword ptr 0x14[esp]
0033  E8 00 00 00 00			call		_GetCurrentThreadId
0038  8B 53 08				mov		edx,dword ptr 0x8[ebx]
003B  89 C6				mov		esi,eax
003D  39 D0				cmp		eax,edx
003F  74 45				je		L$4
0041  83 7B 04 00			cmp		dword ptr 0x4[ebx],0x00000000
0045  75 32				jne		L$3
0047  68 00 00 00 00			push		offset InitSemaphore
004C  E8 00 00 00 00			call		__AccessSemaphore
0051  8B 7B 04				mov		edi,dword ptr 0x4[ebx]
0054  83 C4 04				add		esp,0x00000004
0057  85 FF				test		edi,edi
0059  75 11				jne		L$2
005B  57				push		edi
005C  57				push		edi
005D  57				push		edi
005E  E8 00 00 00 00			call		_CreateMutexA
0063  C7 43 04 01 00 00 00		mov		dword ptr 0x4[ebx],0x00000001
006A  89 03				mov		dword ptr [ebx],eax
006C				L$2:
006C  68 00 00 00 00			push		offset InitSemaphore
0071  E8 00 00 00 00			call		__ReleaseSemaphore
0076  83 C4 04				add		esp,0x00000004
0079				L$3:
0079  6A FF				push		0xffffffff
007B  8B 2B				mov		ebp,dword ptr [ebx]
007D  55				push		ebp
007E  E8 00 00 00 00			call		_WaitForSingleObject
0083  89 73 08				mov		dword ptr 0x8[ebx],esi
0086				L$4:
0086  FF 43 0C				inc		dword ptr 0xc[ebx]
0089  5D				pop		ebp
008A  5F				pop		edi
008B  5E				pop		esi
008C  5B				pop		ebx
008D  C3				ret		

Routine Size: 99 bytes,    Routine Base: _TEXT + 002B

008E				__ReleaseSemaphore:
008E  53				push		ebx
008F  56				push		esi
0090  8B 44 24 0C			mov		eax,dword ptr 0xc[esp]
0094  8B 50 0C				mov		edx,dword ptr 0xc[eax]
0097  85 D2				test		edx,edx
0099  76 15				jbe		L$5
009B  8D 5A FF				lea		ebx,-0x1[edx]
009E  89 58 0C				mov		dword ptr 0xc[eax],ebx
00A1  85 DB				test		ebx,ebx
00A3  75 0B				jne		L$5
00A5  8B 30				mov		esi,dword ptr [eax]
00A7  56				push		esi
00A8  89 58 08				mov		dword ptr 0x8[eax],ebx
00AB  E8 00 00 00 00			call		_ReleaseMutex
00B0				L$5:
00B0  5E				pop		esi
00B1  5B				pop		ebx
00B2  C3				ret		

Routine Size: 37 bytes,    Routine Base: _TEXT + 008E

00B3				__AccessIOB:
00B3  68 00 00 00 00			push		offset IOBSemaphore
00B8				L$6:
00B8  E8 00 00 00 00			call		__AccessSemaphore
00BD  83 C4 04				add		esp,0x00000004
00C0  C3				ret		

Routine Size: 14 bytes,    Routine Base: _TEXT + 00B3

00C1				__ReleaseIOB:
00C1  68 00 00 00 00			push		offset IOBSemaphore
00C6				L$7:
00C6  E8 00 00 00 00			call		__ReleaseSemaphore
00CB  83 C4 04				add		esp,0x00000004
00CE  C3				ret		

Routine Size: 14 bytes,    Routine Base: _TEXT + 00C1

00CF				__AccessFileH:
00CF  8B 44 24 04			mov		eax,dword ptr 0x4[esp]
00D3  83 E0 0F				and		eax,0x0000000f
00D6  C1 E0 04				shl		eax,0x04
00D9  05 00 00 00 00			add		eax,offset FileSemaphores
00DE  50				push		eax
00DF  EB D7				jmp		L$6

Routine Size: 18 bytes,    Routine Base: _TEXT + 00CF

00E1				__ReleaseFileH:
00E1  8B 44 24 04			mov		eax,dword ptr 0x4[esp]
00E5  83 E0 0F				and		eax,0x0000000f
00E8  C1 E0 04				shl		eax,0x04
00EB  05 00 00 00 00			add		eax,offset FileSemaphores
00F0  50				push		eax
00F1  EB D3				jmp		L$7

Routine Size: 18 bytes,    Routine Base: _TEXT + 00E1

00F3				__InitAccessH:
00F3  8B 54 24 04			mov		edx,dword ptr 0x4[esp]
00F7  52				push		edx
00F8  E8 00 00 00 00			call		__NTAddFileHandle
00FD  83 C4 04				add		esp,0x00000004
0100  C3				ret		

Routine Size: 14 bytes,    Routine Base: _TEXT + 00F3

0101				__FiniAccessH:
0101  8B 44 24 04			mov		eax,dword ptr 0x4[esp]
0105  83 E0 0F				and		eax,0x0000000f
0108  C1 E0 04				shl		eax,0x04
010B  05 00 00 00 00			add		eax,offset FileSemaphores
0110  50				push		eax
0111  E8 00 00 00 00			call		__CloseSemaphore
0116  83 C4 04				add		esp,0x00000004
0119  8B 54 24 04			mov		edx,dword ptr 0x4[esp]
011D  52				push		edx
011E  E8 00 00 00 00			call		__NTRemoveFileHandle
0123  83 C4 04				add		esp,0x00000004
0126  C3				ret		

Routine Size: 38 bytes,    Routine Base: _TEXT + 0101

0127				__AccessNHeap:
0127  68 00 00 00 00			push		offset NHeapSemaphore
012C  EB 8A				jmp		L$6

Routine Size: 7 bytes,    Routine Base: _TEXT + 0127

012E				__ReleaseNHeap:
012E  68 00 00 00 00			push		offset NHeapSemaphore
0133  EB 91				jmp		L$7

Routine Size: 7 bytes,    Routine Base: _TEXT + 012E

0135				__AccessFHeap:
0135  68 00 00 00 00			push		offset FHeapSemaphore
013A  E9 79 FF FF FF			jmp		L$6

Routine Size: 10 bytes,    Routine Base: _TEXT + 0135

013F				__ReleaseFHeap:
013F  68 00 00 00 00			push		offset FHeapSemaphore
0144  EB 80				jmp		L$7

Routine Size: 7 bytes,    Routine Base: _TEXT + 013F

0146				__AccessTDList:
0146  68 00 00 00 00			push		offset TDListSemaphore
014B  E9 68 FF FF FF			jmp		L$6

Routine Size: 10 bytes,    Routine Base: _TEXT + 0146

0150				__ReleaseTDList:
0150  68 00 00 00 00			push		offset TDListSemaphore
0155  E9 6C FF FF FF			jmp		L$7

Routine Size: 10 bytes,    Routine Base: _TEXT + 0150

015A				__AccessFList:
015A  68 00 00 00 00			push		offset FListSemaphore
015F  E9 54 FF FF FF			jmp		L$6

Routine Size: 10 bytes,    Routine Base: _TEXT + 015A

0164				__ReleaseFList:
0164  68 00 00 00 00			push		offset FListSemaphore
0169  E9 58 FF FF FF			jmp		L$7

Routine Size: 10 bytes,    Routine Base: _TEXT + 0164

016E				__MultipleThread:
016E  8B 15 00 00 00 00			mov		edx,dword ptr __TlsIndex
0174  52				push		edx
0175  E8 00 00 00 00			call		_TlsGetValue
017A  89 C2				mov		edx,eax
017C  85 C0				test		eax,eax
017E  75 07				jne		L$8
0180  E8 00 00 00 00			call		__GetThreadData
0185  89 C2				mov		edx,eax
0187				L$8:
0187  89 D0				mov		eax,edx
0189  C3				ret		

Routine Size: 28 bytes,    Routine Base: _TEXT + 016E

018A				__InitThreadData:
018A  53				push		ebx
018B  8B 5C 24 08			mov		ebx,dword ptr 0x8[esp]
018F  85 DB				test		ebx,ebx
0191  75 1B				jne		L$9
0193  8B 15 00 00 00 00			mov		edx,dword ptr __ThreadDataSize
0199  52				push		edx
019A  6A 01				push		0x00000001
019C  E8 00 00 00 00			call		calloc
01A1  83 C4 08				add		esp,0x00000008
01A4  89 C3				mov		ebx,eax
01A6  85 C0				test		eax,eax
01A8  74 04				je		L$9
01AA  C6 40 52 01			mov		byte ptr 0x52[eax],0x01
01AE				L$9:
01AE  85 DB				test		ebx,ebx
01B0  74 12				je		L$10
01B2  C7 43 0C 01 00 00 00		mov		dword ptr 0xc[ebx],0x00000001
01B9  E8 00 00 00 00			call		_GetCurrentThreadId
01BE  89 83 DA 00 00 00			mov		dword ptr 0xda[ebx],eax
01C4				L$10:
01C4  89 D8				mov		eax,ebx
01C6  5B				pop		ebx
01C7  C3				ret		

Routine Size: 62 bytes,    Routine Base: _TEXT + 018A

01C8				__NTThreadInit:
01C8  E8 00 00 00 00			call		_TlsAlloc
01CD  A3 00 00 00 00			mov		dword ptr __TlsIndex,eax
01D2  66 A1 00 00 00 00			mov		ax,word ptr _osbuild
01D8  30 C0				xor		al,al
01DA  80 E4 80				and		ah,0x80
01DD  25 FF FF 00 00			and		eax,0x0000ffff
01E2  74 1C				je		L$12
01E4				L$11:
01E4  8B 15 00 00 00 00			mov		edx,dword ptr __TlsIndex
01EA  83 FA FF				cmp		edx,0xffffffff
01ED  74 11				je		L$12
01EF  83 FA 02				cmp		edx,0x00000002
01F2  77 0C				ja		L$12
01F4  E8 00 00 00 00			call		_TlsAlloc
01F9  A3 00 00 00 00			mov		dword ptr __TlsIndex,eax
01FE  EB E4				jmp		L$11
0200				L$12:
0200  83 3D 00 00 00 00 FF		cmp		dword ptr __TlsIndex,0xffffffff
0207  0F 95 C0				setne		al
020A  25 FF 00 00 00			and		eax,0x000000ff
020F  C3				ret		

Routine Size: 72 bytes,    Routine Base: _TEXT + 01C8

0210				__NTAddThread:
0210  53				push		ebx
0211  56				push		esi
0212  83 3D 00 00 00 00 FF		cmp		dword ptr __TlsIndex,0xffffffff
0219  75 05				jne		L$14
021B				L$13:
021B  31 C0				xor		eax,eax
021D  5E				pop		esi
021E  5B				pop		ebx
021F  C3				ret		
0220				L$14:
0220  8B 5C 24 0C			mov		ebx,dword ptr 0xc[esp]
0224  53				push		ebx
0225  E8 00 00 00 00			call		__InitThreadData
022A  89 C3				mov		ebx,eax
022C  83 C4 04				add		esp,0x00000004
022F  85 C0				test		eax,eax
0231  74 31				je		L$16
0233  50				push		eax
0234  8B 88 DA 00 00 00			mov		ecx,dword ptr 0xda[eax]
023A  51				push		ecx
023B  E8 00 00 00 00			call		__AddThreadData
0240  83 C4 08				add		esp,0x00000008
0243  85 C0				test		eax,eax
0245  75 0B				jne		L$15
0247  53				push		ebx
0248  E8 00 00 00 00			call		free
024D  83 C4 04				add		esp,0x00000004
0250  EB C9				jmp		L$13
0252				L$15:
0252  53				push		ebx
0253  8B 35 00 00 00 00			mov		esi,dword ptr __TlsIndex
0259  56				push		esi
025A  E8 00 00 00 00			call		_TlsSetValue
025F  B8 01 00 00 00			mov		eax,0x00000001
0264				L$16:
0264  5E				pop		esi
0265  5B				pop		ebx
0266  C3				ret		

Routine Size: 87 bytes,    Routine Base: _TEXT + 0210

0267				__NTRemoveThread:
0267  53				push		ebx
0268  56				push		esi
0269  8B 15 00 00 00 00			mov		edx,dword ptr __TlsIndex
026F  83 FA FF				cmp		edx,0xffffffff
0272  74 3E				je		L$17
0274  52				push		edx
0275  E8 00 00 00 00			call		_TlsGetValue
027A  85 C0				test		eax,eax
027C  74 34				je		L$17
027E  8B 88 DA 00 00 00			mov		ecx,dword ptr 0xda[eax]
0284  51				push		ecx
0285  8B 98 DE 00 00 00			mov		ebx,dword ptr 0xde[eax]
028B  E8 00 00 00 00			call		__RemoveThreadData
0290  83 C4 04				add		esp,0x00000004
0293  6A 00				push		0x00000000
0295  8B 35 00 00 00 00			mov		esi,dword ptr __TlsIndex
029B  56				push		esi
029C  E8 00 00 00 00			call		_TlsSetValue
02A1  85 DB				test		ebx,ebx
02A3  74 0D				je		L$17
02A5  83 7C 24 0C 00			cmp		dword ptr 0xc[esp],0x00000000
02AA  74 06				je		L$17
02AC  53				push		ebx
02AD  E8 00 00 00 00			call		_CloseHandle
02B2				L$17:
02B2  5E				pop		esi
02B3  5B				pop		ebx
02B4  C3				ret		
02B5				__ThreadExit:
02B5  6A 01				push		0x00000001
02B7  E8 00 00 00 00			call		__NTRemoveThread
02BC  83 C4 04				add		esp,0x00000004

Routine Size: 88 bytes,    Routine Base: _TEXT + 0267

02BF				__NTThreadFini:
02BF  8B 15 00 00 00 00			mov		edx,dword ptr __TlsIndex
02C5  83 FA FF				cmp		edx,0xffffffff
02C8  74 10				je		L$18
02CA  52				push		edx
02CB  E8 00 00 00 00			call		_TlsFree
02D0  C7 05 00 00 00 00 FF FF FF FF
					mov		dword ptr __TlsIndex,0xffffffff
02DA				L$18:
02DA  C3				ret		

Routine Size: 28 bytes,    Routine Base: _TEXT + 02BF

02DB				__InitMultipleThread:
02DB  53				push		ebx
02DC  56				push		esi
02DD  57				push		edi
02DE  55				push		ebp
02DF  BA 00 00 00 00			mov		edx,offset __AccessFileH
02E4  BB 00 00 00 00			mov		ebx,offset __ReleaseFileH
02E9  B9 00 00 00 00			mov		ecx,offset __InitAccessH
02EE  BE 00 00 00 00			mov		esi,offset __FiniAccessH
02F3  BF 00 00 00 00			mov		edi,offset __AccessIOB
02F8  6A 00				push		0x00000000
02FA  BD 00 00 00 00			mov		ebp,offset __ReleaseIOB
02FF  B8 00 00 00 00			mov		eax,offset __AccessSemaphore
0304  6A 00				push		0x00000000
0306  89 15 00 00 00 00			mov		dword ptr _AccessFileH,edx
030C  89 1D 00 00 00 00			mov		dword ptr _ReleaseFileH,ebx
0312  89 0D 00 00 00 00			mov		dword ptr _InitAccessH,ecx
0318  89 35 00 00 00 00			mov		dword ptr _FiniAccessH,esi
031E  89 3D 00 00 00 00			mov		dword ptr _AccessIOB,edi
0324  89 2D 00 00 00 00			mov		dword ptr _ReleaseIOB,ebp
032A  A3 00 00 00 00			mov		dword ptr __AccessSema4,eax
032F  BA 00 00 00 00			mov		edx,offset __ReleaseSemaphore
0334  BB 00 00 00 00			mov		ebx,offset __CloseSemaphore
0339  B9 00 00 00 00			mov		ecx,offset __AccessNHeap
033E  BE 00 00 00 00			mov		esi,offset __AccessFHeap
0343  BF 00 00 00 00			mov		edi,offset __ReleaseNHeap
0348  BD 00 00 00 00			mov		ebp,offset __ReleaseFHeap
034D  B8 00 00 00 00			mov		eax,offset __AccessTDList
0352  6A 00				push		0x00000000
0354  89 15 00 00 00 00			mov		dword ptr __ReleaseSema4,edx
035A  89 1D 00 00 00 00			mov		dword ptr __CloseSema4,ebx
0360  89 0D 00 00 00 00			mov		dword ptr _AccessNHeap,ecx
0366  89 35 00 00 00 00			mov		dword ptr _AccessFHeap,esi
036C  89 3D 00 00 00 00			mov		dword ptr _ReleaseNHeap,edi
0372  89 2D 00 00 00 00			mov		dword ptr _ReleaseFHeap,ebp
0378  A3 00 00 00 00			mov		dword ptr _AccessTDList,eax
037D  BA 00 00 00 00			mov		edx,offset __ReleaseTDList
0382  BB 01 00 00 00			mov		ebx,0x00000001
0387  BE 00 00 00 00			mov		esi,offset __ReleaseFList
038C  BF 00 00 00 00			mov		edi,offset __ThreadExit
0391  89 15 00 00 00 00			mov		dword ptr _ReleaseTDList,edx
0397  E8 00 00 00 00			call		_CreateMutexA
039C  B9 00 00 00 00			mov		ecx,offset __AccessFList
03A1  8B 2D 00 00 00 00			mov		ebp,dword ptr __FirstThreadData
03A7  A3 00 00 00 00			mov		dword ptr InitSemaphore,eax
03AC  89 1D 04 00 00 00			mov		dword ptr InitSemaphore+0x4,ebx
03B2  55				push		ebp
03B3  8B 95 DA 00 00 00			mov		edx,dword ptr 0xda[ebp]
03B9  89 35 00 00 00 00			mov		dword ptr _ReleaseFList,esi
03BF  52				push		edx
03C0  89 3D 00 00 00 00			mov		dword ptr _ThreadExitRtn,edi
03C6  89 0D 00 00 00 00			mov		dword ptr _AccessFList,ecx
03CC  E8 00 00 00 00			call		__AddThreadData
03D1  83 C4 08				add		esp,0x00000008
03D4  8B 1D 00 00 00 00			mov		ebx,dword ptr __FirstThreadData
03DA  53				push		ebx
03DB  8B 0D 00 00 00 00			mov		ecx,dword ptr __TlsIndex
03E1  51				push		ecx
03E2  BE 00 00 00 00			mov		esi,offset __MultipleThread
03E7  E8 00 00 00 00			call		_TlsSetValue
03EC  89 35 00 00 00 00			mov		dword ptr __GetThreadPtr,esi
03F2  5D				pop		ebp
03F3  5F				pop		edi
03F4  5E				pop		esi
03F5  5B				pop		ebx
03F6  C3				ret		
03F7				__FiniSema4s:
03F7  53				push		ebx
03F8  56				push		esi
03F9  68 00 00 00 00			push		offset NHeapSemaphore
03FE  FF 15 00 00 00 00			call		dword ptr __CloseSema4
0404  83 C4 04				add		esp,0x00000004
0407  68 00 00 00 00			push		offset FHeapSemaphore
040C  FF 15 00 00 00 00			call		dword ptr __CloseSema4
0412  83 C4 04				add		esp,0x00000004
0415  BB 00 00 00 00			mov		ebx,offset FileSemaphores
041A  68 00 00 00 00			push		offset IOBSemaphore
041F  8D B3 00 01 00 00			lea		esi,0x100[ebx]
0425  FF 15 00 00 00 00			call		dword ptr __CloseSema4
042B  83 C4 04				add		esp,0x00000004
042E				L$19:
042E  53				push		ebx
042F  FF 15 00 00 00 00			call		dword ptr __CloseSema4
0435  83 C3 10				add		ebx,0x00000010
0438  83 C4 04				add		esp,0x00000004
043B  39 F3				cmp		ebx,esi
043D  75 EF				jne		L$19
043F  68 00 00 00 00			push		offset FListSemaphore
0444  FF 15 00 00 00 00			call		dword ptr __CloseSema4
044A  83 C4 04				add		esp,0x00000004
044D  E8 00 00 00 00			call		__FiniThreadProcessing
0452  68 00 00 00 00			push		offset TDListSemaphore
0457  FF 15 00 00 00 00			call		dword ptr __CloseSema4
045D  83 C4 04				add		esp,0x00000004
0460  68 00 00 00 00			push		offset InitSemaphore
0465  FF 15 00 00 00 00			call		dword ptr __CloseSema4
046B  83 C4 04				add		esp,0x00000004
046E  E8 00 00 00 00			call		__NTThreadFini
0473  5E				pop		esi
0474  5B				pop		ebx
0475  C3				ret		

Routine Size: 411 bytes,    Routine Base: _TEXT + 02DB

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 0000000C bytes
0000				__AccessSema4:
0000  00 00 00 00                                     DD	offset nullSema4Rtn
0004				__ReleaseSema4:
0004  00 00 00 00                                     DD	offset nullSema4Rtn
0008				__CloseSema4:
0008  00 00 00 00                                     DD	offset nullSema4Rtn

Segment: _BSS DWORD USE32 00000160 bytes
0000				IOBSemaphore:
0010				FHeapSemaphore:
0020				FileSemaphores:
0120				NHeapSemaphore:
0130				InitSemaphore:
0140				TDListSemaphore:
0150				FListSemaphore:

BSS Size: 352 bytes

Segment: YIB BYTE USE32 00000000 bytes

Segment: YI BYTE USE32 00000006 bytes
0000				__AccessSema4Fini:
0000  00 0A                                           ..
0002  00 00 00 00                                     DD	offset __FiniSema4s

Segment: YIE BYTE USE32 00000000 bytes


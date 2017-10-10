Module: mainwnt
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000138 bytes
0000				__threadid_:
0000  FF 15 00 00 00 00			call		dword ptr ___GetThreadPtr
0006  05 DA 00 00 00			add		eax,0x000000da
000B  C3				ret		
000C				__SingleThread_:
000C  A1 00 00 00 00			mov		eax,dword ptr ___FirstThreadData
0011				__NullAccessRtn_:
0011				__NullExitRtn_:
0011				__NullAccIOBRtn_:
0011				__NullAccHeapRtn_:
0011				__NullAccTDListRtn_:
0011  C3				ret		
0012				__DefInitAccessH_:
0012  E9 00 00 00 00			jmp		__NTAddFileHandle_
0017				__DefFiniAccessH_:
0017  E9 00 00 00 00			jmp		__NTRemoveFileHandle_

Routine Size: 28 bytes,    Routine Base: _TEXT + 0000

001C				__NTInit_:
001C  53				push		ebx
001D  51				push		ecx
001E  81 EC 04 01 00 00			sub		esp,0x00000104
0024  89 C3				mov		ebx,eax
0026  89 D0				mov		eax,edx
0028  89 1D 00 00 00 00			mov		dword ptr ___Is_DLL,ebx
002E  E8 00 00 00 00			call		__InitThreadData_
0033  A3 00 00 00 00			mov		dword ptr ___FirstThreadData,eax
0038  85 C0				test		eax,eax
003A  75 0F				jne		L$1
003C  85 DB				test		ebx,ebx
003E  0F 85 9D 00 00 00			jne		L$5
0044  6A 01				push		0x00000001
0046  E8 00 00 00 00			call		_ExitProcess
004B				L$1:
004B  E8 00 00 00 00			call		__NTInitFileHandles_
0050  E8 00 00 00 00			call		_GetEnvironmentStrings
0055  68 04 01 00 00			push		0x00000104
005A  A3 00 00 00 00			mov		dword ptr __Envptr,eax
005F  8D 44 24 04			lea		eax,0x4[esp]
0063  50				push		eax
0064  6A 00				push		0x00000000
0066  E8 00 00 00 00			call		_GetModuleFileNameA
006B  89 E0				mov		eax,esp
006D  E8 00 00 00 00			call		strdup_
0072  A3 00 00 00 00			mov		dword ptr __LpPgmName,eax
0077  E8 00 00 00 00			call		_GetCommandLineA
007C  E8 00 00 00 00			call		strdup_
0081				L$2:
0081  8A 10				mov		dl,byte ptr [eax]
0083  FE C2				inc		dl
0085  81 E2 FF 00 00 00			and		edx,0x000000ff
008B  F6 82 00 00 00 00 02		test		byte ptr __IsTable[edx],0x02
0092  75 08				jne		L$3
0094  80 38 00				cmp		byte ptr [eax],0x00
0097  74 03				je		L$3
0099  40				inc		eax
009A  EB E5				jmp		L$2
009C				L$3:
009C  8A 10				mov		dl,byte ptr [eax]
009E  FE C2				inc		dl
00A0  81 E2 FF 00 00 00			and		edx,0x000000ff
00A6  F6 82 00 00 00 00 02		test		byte ptr __IsTable[edx],0x02
00AD  74 03				je		L$4
00AF  40				inc		eax
00B0  EB EA				jmp		L$3
00B2				L$4:
00B2  A3 00 00 00 00			mov		dword ptr __LpCmdLine,eax
00B7  E8 00 00 00 00			call		_GetVersion
00BC  C1 E8 10				shr		eax,0x10
00BF  25 FF FF 00 00			and		eax,0x0000ffff
00C4  89 C2				mov		edx,eax
00C6  31 C0				xor		eax,eax
00C8  66 89 D0				mov		ax,dx
00CB  C1 F8 08				sar		eax,0x08
00CE  80 E2 0F				and		dl,0x0f
00D1  A2 00 00 00 00			mov		byte ptr __osmajor,al
00D6  88 15 00 00 00 00			mov		byte ptr __osminor,dl
00DC  B8 01 00 00 00			mov		eax,0x00000001
00E1				L$5:
00E1  81 C4 04 01 00 00			add		esp,0x00000104
00E7  59				pop		ecx
00E8  5B				pop		ebx
00E9  C3				ret		

Routine Size: 206 bytes,    Routine Base: _TEXT + 001C

00EA				__NTMainInit_:
00EA  53				push		ebx
00EB  89 C3				mov		ebx,eax
00ED  31 C0				xor		eax,eax
00EF  E8 00 00 00 00			call		__NTInit_
00F4  89 D8				mov		eax,ebx
00F6  E8 00 00 00 00			call		__NewExceptionHandler_
00FB  FF 15 00 00 00 00			call		dword ptr ___sig_init_rtn
0101  FF 15 00 00 00 00			call		dword ptr ___GetThreadPtr
0107  C7 00 00 00 00 00			mov		dword ptr [eax],0x00000000
010D  B8 FF 00 00 00			mov		eax,0x000000ff
0112  E8 00 00 00 00			call		__InitRtns
0117  5B				pop		ebx
0118  C3				ret		

Routine Size: 47 bytes,    Routine Base: _TEXT + 00EA

0119				__exit_:
0119  89 C3				mov		ebx,eax
011B  E8 00 00 00 00			call		__DoneExceptionHandler_
0120  BA FF 00 00 00			mov		edx,0x000000ff
0125  31 C0				xor		eax,eax
0127  E8 00 00 00 00			call		__FiniRtns
012C  FF 15 00 00 00 00			call		dword ptr __ThreadExitRtn
0132  53				push		ebx
0133  E8 00 00 00 00			call		_ExitProcess

Routine Size: 31 bytes,    Routine Base: _TEXT + 0119

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 0000004C bytes
0000				___TlsIndex:
0000  FF FF FF FF                                     ....
0004				___GetThreadPtr:
0004  00 00 00 00                                     DD	offset __SingleThread_
0008				__AccessFileH:
0008  00 00 00 00                                     DD	offset __NullAccessRtn_
000C				__ReleaseFileH:
000C  00 00 00 00                                     DD	offset __NullAccessRtn_
0010				__InitAccessH:
0010  00 00 00 00                                     DD	offset __DefInitAccessH_
0014				__FiniAccessH:
0014  00 00 00 00                                     DD	offset __DefFiniAccessH_
0018				__AccessIOB:
0018  00 00 00 00                                     DD	offset __NullAccIOBRtn_
001C				__ReleaseIOB:
001C  00 00 00 00                                     DD	offset __NullAccIOBRtn_
0020				__AccessNHeap:
0020  00 00 00 00                                     DD	offset __NullAccHeapRtn_
0024				__AccessFHeap:
0024  00 00 00 00                                     DD	offset __NullAccHeapRtn_
0028				__ReleaseNHeap:
0028  00 00 00 00                                     DD	offset __NullAccHeapRtn_
002C				__ReleaseFHeap:
002C  00 00 00 00                                     DD	offset __NullAccHeapRtn_
0030				__AccessTDList:
0030  00 00 00 00                                     DD	offset __NullAccTDListRtn_
0034				__ReleaseTDList:
0034  00 00 00 00                                     DD	offset __NullAccTDListRtn_
0038				__AccessFList:
0038  00 00 00 00                                     DD	offset __NullAccIOBRtn_
003C				__ReleaseFList:
003C  00 00 00 00                                     DD	offset __NullAccIOBRtn_
0040				__ThreadExitRtn:
0040  00 00 00 00                                     DD	offset __NullExitRtn_
0044				___sig_init_rtn:
0044  00 00 00 00                                     DD	offset __SigInit_
0048				___sig_fini_rtn:
0048  00 00 00 00                                     DD	offset __SigFini_

Segment: _BSS DWORD USE32 00000008 bytes
0000				___Is_DLL:
0004				___FirstThreadData:

BSS Size: 8 bytes


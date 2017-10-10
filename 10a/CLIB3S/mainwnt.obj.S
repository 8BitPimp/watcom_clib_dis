Module: mainwnt
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 0000016E bytes
0000				__threadid:
0000  FF 15 00 00 00 00			call		dword ptr __GetThreadPtr
0006  05 DA 00 00 00			add		eax,0x000000da
000B  C3				ret		
000C				__SingleThread:
000C  A1 00 00 00 00			mov		eax,dword ptr __FirstThreadData
0011				__NullAccessRtn:
0011				__NullExitRtn:
0011				__NullAccIOBRtn:
0011				__NullAccHeapRtn:
0011				__NullAccTDListRtn:
0011  C3				ret		
0012				__DefInitAccessH:
0012  8B 54 24 04			mov		edx,dword ptr 0x4[esp]
0016  52				push		edx
0017  E8 00 00 00 00			call		__NTAddFileHandle
001C  83 C4 04				add		esp,0x00000004
001F  C3				ret		
0020				__DefFiniAccessH:
0020  8B 54 24 04			mov		edx,dword ptr 0x4[esp]
0024  52				push		edx
0025  E8 00 00 00 00			call		__NTRemoveFileHandle
002A  83 C4 04				add		esp,0x00000004
002D  C3				ret		

Routine Size: 46 bytes,    Routine Base: _TEXT + 0000

002E				__NTInit:
002E  81 EC 04 01 00 00			sub		esp,0x00000104
0034  8B 94 24 0C 01 00 00		mov		edx,dword ptr 0x10c[esp]
003B  8B 84 24 08 01 00 00		mov		eax,dword ptr 0x108[esp]
0042  52				push		edx
0043  A3 00 00 00 00			mov		dword ptr __Is_DLL,eax
0048  E8 00 00 00 00			call		__InitThreadData
004D  83 C4 04				add		esp,0x00000004
0050  A3 00 00 00 00			mov		dword ptr __FirstThreadData,eax
0055  85 C0				test		eax,eax
0057  75 15				jne		L$1
0059  83 BC 24 08 01 00 00 00		cmp		dword ptr 0x108[esp],0x00000000
0061  0F 85 A5 00 00 00			jne		L$5
0067  6A 01				push		0x00000001
0069  E8 00 00 00 00			call		_ExitProcess
006E				L$1:
006E  E8 00 00 00 00			call		__NTInitFileHandles
0073  E8 00 00 00 00			call		_GetEnvironmentStrings
0078  68 04 01 00 00			push		0x00000104
007D  A3 00 00 00 00			mov		dword ptr _Envptr,eax
0082  8D 44 24 04			lea		eax,0x4[esp]
0086  50				push		eax
0087  6A 00				push		0x00000000
0089  E8 00 00 00 00			call		_GetModuleFileNameA
008E  89 E0				mov		eax,esp
0090  50				push		eax
0091  E8 00 00 00 00			call		strdup
0096  83 C4 04				add		esp,0x00000004
0099  A3 00 00 00 00			mov		dword ptr _LpPgmName,eax
009E  E8 00 00 00 00			call		_GetCommandLineA
00A3  50				push		eax
00A4  E8 00 00 00 00			call		strdup
00A9  83 C4 04				add		esp,0x00000004
00AC				L$2:
00AC  8A 10				mov		dl,byte ptr [eax]
00AE  FE C2				inc		dl
00B0  81 E2 FF 00 00 00			and		edx,0x000000ff
00B6  F6 82 00 00 00 00 02		test		byte ptr _IsTable[edx],0x02
00BD  75 08				jne		L$3
00BF  80 38 00				cmp		byte ptr [eax],0x00
00C2  74 03				je		L$3
00C4  40				inc		eax
00C5  EB E5				jmp		L$2
00C7				L$3:
00C7  8A 10				mov		dl,byte ptr [eax]
00C9  FE C2				inc		dl
00CB  81 E2 FF 00 00 00			and		edx,0x000000ff
00D1  F6 82 00 00 00 00 02		test		byte ptr _IsTable[edx],0x02
00D8  74 03				je		L$4
00DA  40				inc		eax
00DB  EB EA				jmp		L$3
00DD				L$4:
00DD  A3 00 00 00 00			mov		dword ptr _LpCmdLine,eax
00E2  E8 00 00 00 00			call		_GetVersion
00E7  C1 E8 10				shr		eax,0x10
00EA  25 FF FF 00 00			and		eax,0x0000ffff
00EF  89 C2				mov		edx,eax
00F1  31 C0				xor		eax,eax
00F3  66 89 D0				mov		ax,dx
00F6  C1 F8 08				sar		eax,0x08
00F9  80 E2 0F				and		dl,0x0f
00FC  A2 00 00 00 00			mov		byte ptr _osmajor,al
0101  88 15 00 00 00 00			mov		byte ptr _osminor,dl
0107  B8 01 00 00 00			mov		eax,0x00000001
010C				L$5:
010C  81 C4 04 01 00 00			add		esp,0x00000104
0112  C3				ret		

Routine Size: 229 bytes,    Routine Base: _TEXT + 002E

0113				__NTMainInit:
0113  53				push		ebx
0114  8B 54 24 0C			mov		edx,dword ptr 0xc[esp]
0118  52				push		edx
0119  6A 00				push		0x00000000
011B  E8 00 00 00 00			call		__NTInit
0120  83 C4 08				add		esp,0x00000008
0123  8B 5C 24 08			mov		ebx,dword ptr 0x8[esp]
0127  53				push		ebx
0128  E8 00 00 00 00			call		__NewExceptionHandler
012D  83 C4 04				add		esp,0x00000004
0130  FF 15 00 00 00 00			call		dword ptr __sig_init_rtn
0136  FF 15 00 00 00 00			call		dword ptr __GetThreadPtr
013C  C7 00 00 00 00 00			mov		dword ptr [eax],0x00000000
0142  B8 FF 00 00 00			mov		eax,0x000000ff
0147  E8 00 00 00 00			call		__InitRtns
014C  5B				pop		ebx
014D  C3				ret		

Routine Size: 59 bytes,    Routine Base: _TEXT + 0113

014E				__exit:
014E  E8 00 00 00 00			call		__DoneExceptionHandler
0153  BA FF 00 00 00			mov		edx,0x000000ff
0158  31 C0				xor		eax,eax
015A  E8 00 00 00 00			call		__FiniRtns
015F  FF 15 00 00 00 00			call		dword ptr _ThreadExitRtn
0165  8B 14 24				mov		edx,dword ptr [esp]
0168  52				push		edx
0169  E8 00 00 00 00			call		_ExitProcess

Routine Size: 32 bytes,    Routine Base: _TEXT + 014E

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 0000004C bytes
0000				__TlsIndex:
0000  FF FF FF FF                                     ....
0004				__GetThreadPtr:
0004  00 00 00 00                                     DD	offset __SingleThread
0008				_AccessFileH:
0008  00 00 00 00                                     DD	offset __NullAccessRtn
000C				_ReleaseFileH:
000C  00 00 00 00                                     DD	offset __NullAccessRtn
0010				_InitAccessH:
0010  00 00 00 00                                     DD	offset __DefInitAccessH
0014				_FiniAccessH:
0014  00 00 00 00                                     DD	offset __DefFiniAccessH
0018				_AccessIOB:
0018  00 00 00 00                                     DD	offset __NullAccIOBRtn
001C				_ReleaseIOB:
001C  00 00 00 00                                     DD	offset __NullAccIOBRtn
0020				_AccessNHeap:
0020  00 00 00 00                                     DD	offset __NullAccHeapRtn
0024				_AccessFHeap:
0024  00 00 00 00                                     DD	offset __NullAccHeapRtn
0028				_ReleaseNHeap:
0028  00 00 00 00                                     DD	offset __NullAccHeapRtn
002C				_ReleaseFHeap:
002C  00 00 00 00                                     DD	offset __NullAccHeapRtn
0030				_AccessTDList:
0030  00 00 00 00                                     DD	offset __NullAccTDListRtn
0034				_ReleaseTDList:
0034  00 00 00 00                                     DD	offset __NullAccTDListRtn
0038				_AccessFList:
0038  00 00 00 00                                     DD	offset __NullAccIOBRtn
003C				_ReleaseFList:
003C  00 00 00 00                                     DD	offset __NullAccIOBRtn
0040				_ThreadExitRtn:
0040  00 00 00 00                                     DD	offset __NullExitRtn
0044				__sig_init_rtn:
0044  00 00 00 00                                     DD	offset __SigInit
0048				__sig_fini_rtn:
0048  00 00 00 00                                     DD	offset __SigFini

Segment: _BSS DWORD USE32 00000008 bytes
0000				__Is_DLL:
0004				__FirstThreadData:

BSS Size: 8 bytes


Module: mainwnt
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 000001E9 bytes
0000                            __threadid:
0000  FF 15 00 00 00 00                 call            dword ptr __GetThreadPtr
0006  05 DA 00 00 00                    add             eax,0x000000da
000B  C3                                ret
000C                            __SingleThread:
000C  A1 00 00 00 00                    mov             eax,dword ptr __FirstThreadData
0011                            __NullAccessRtn:
0011                            __NullExitRtn:
0011                            __NullAccIOBRtn:
0011                            __NullAccHeapRtn:
0011                            __NullAccTDListRtn:
0011  C3                                ret
0012                            __DefInitAccessH:
0012  8B 54 24 04                       mov             edx,dword ptr 0x4[esp]
0016  52                                push            edx
0017  E8 00 00 00 00                    call            __NTAddFileHandle
001C  83 C4 04                          add             esp,0x00000004
001F  C3                                ret
0020                            __DefFiniAccessH:
0020  8B 54 24 04                       mov             edx,dword ptr 0x4[esp]
0024  52                                push            edx
0025  E8 00 00 00 00                    call            __NTRemoveFileHandle
002A  83 C4 04                          add             esp,0x00000004
002D  C3                                ret

Routine Size: 46 bytes,    Routine Base: _TEXT + 0000

002E                            __NTInit:
002E  53                                push            ebx
002F  56                                push            esi
0030  81 EC 04 01 00 00                 sub             esp,0x00000104
0036  8B 94 24 14 01 00 00              mov             edx,dword ptr 0x114[esp]
003D  8B 84 24 10 01 00 00              mov             eax,dword ptr 0x110[esp]
0044  52                                push            edx
0045  A3 00 00 00 00                    mov             dword ptr __Is_DLL,eax
004A  E8 00 00 00 00                    call            __InitThreadData
004F  83 C4 04                          add             esp,0x00000004
0052  A3 00 00 00 00                    mov             dword ptr __FirstThreadData,eax
0057  85 C0                             test            eax,eax
0059  75 18                             jne             L$2
005B  83 BC 24 10 01 00 00 00           cmp             dword ptr 0x110[esp],0x00000000
0063  74 07                             je              L$1
0065  31 D2                             xor             edx,edx
0067  E9 0B 01 00 00                    jmp             L$9
006C                            L$1:
006C  6A 01                             push            0x00000001
006E  E8 00 00 00 00                    call            _ExitProcess
0073                            L$2:
0073  E8 00 00 00 00                    call            __NTInitFileHandles
0078  E8 00 00 00 00                    call            _GetEnvironmentStrings
007D  68 04 01 00 00                    push            0x00000104
0082  A3 00 00 00 00                    mov             dword ptr _Envptr,eax
0087  8D 44 24 04                       lea             eax,0x4[esp]
008B  50                                push            eax
008C  6A 00                             push            0x00000000
008E  E8 00 00 00 00                    call            _GetModuleFileNameA
0093  89 E0                             mov             eax,esp
0095  50                                push            eax
0096  E8 00 00 00 00                    call            strdup
009B  83 C4 04                          add             esp,0x00000004
009E  A3 00 00 00 00                    mov             dword ptr _LpPgmName,eax
00A3  E8 00 00 00 00                    call            _GetCommandLineA
00A8  50                                push            eax
00A9  31 DB                             xor             ebx,ebx
00AB  E8 00 00 00 00                    call            strdup
00B0  89 C2                             mov             edx,eax
00B2  8A 18                             mov             bl,byte ptr [eax]
00B4  83 C4 04                          add             esp,0x00000004
00B7  83 FB 22                          cmp             ebx,0x00000022
00BA  75 16                             jne             L$6
00BC                            L$3:
00BC  40                                inc             eax
00BD  31 D2                             xor             edx,edx
00BF  8A 10                             mov             dl,byte ptr [eax]
00C1  83 FA 22                          cmp             edx,0x00000022
00C4  74 04                             je              L$4
00C6  84 D2                             test            dl,dl
00C8  75 F2                             jne             L$3
00CA                            L$4:
00CA  80 38 00                          cmp             byte ptr [eax],0x00
00CD  74 26                             je              L$7
00CF                            L$5:
00CF  40                                inc             eax
00D0  EB 23                             jmp             L$7
00D2                            L$6:
00D2  8A 10                             mov             dl,byte ptr [eax]
00D4  FE C2                             inc             dl
00D6  81 E2 FF 00 00 00                 and             edx,0x000000ff
00DC  8A 92 00 00 00 00                 mov             dl,byte ptr _IsTable[edx]
00E2  80 E2 02                          and             dl,0x02
00E5  81 E2 FF 00 00 00                 and             edx,0x000000ff
00EB  75 08                             jne             L$7
00ED  80 38 00                          cmp             byte ptr [eax],0x00
00F0  74 03                             je              L$7
00F2  40                                inc             eax
00F3  EB DD                             jmp             L$6
00F5                            L$7:
00F5  8A 10                             mov             dl,byte ptr [eax]
00F7  FE C2                             inc             dl
00F9  81 E2 FF 00 00 00                 and             edx,0x000000ff
00FF  8A 92 00 00 00 00                 mov             dl,byte ptr _IsTable[edx]
0105  80 E2 02                          and             dl,0x02
0108  81 E2 FF 00 00 00                 and             edx,0x000000ff
010E  75 BF                             jne             L$5
0110  8B 8C 24 10 01 00 00              mov             ecx,dword ptr 0x110[esp]
0117  A3 00 00 00 00                    mov             dword ptr _LpCmdLine,eax
011C  85 C9                             test            ecx,ecx
011E  74 27                             je              L$8
0120  68 04 01 00 00                    push            0x00000104
0125  8D 44 24 04                       lea             eax,0x4[esp]
0129  50                                push            eax
012A  8B B4 24 20 01 00 00              mov             esi,dword ptr 0x120[esp]
0131  56                                push            esi
0132  E8 00 00 00 00                    call            _GetModuleFileNameA
0137  89 E0                             mov             eax,esp
0139  50                                push            eax
013A  E8 00 00 00 00                    call            strdup
013F  83 C4 04                          add             esp,0x00000004
0142  A3 00 00 00 00                    mov             dword ptr _LpDllName,eax
0147                            L$8:
0147  E8 00 00 00 00                    call            _GetVersion
014C  89 C3                             mov             ebx,eax
014E  C1 E8 10                          shr             eax,0x10
0151  31 D2                             xor             edx,edx
0153  25 FF FF 00 00                    and             eax,0x0000ffff
0158  66 89 C2                          mov             dx,ax
015B  66 89 1D 00 00 00 00              mov             word ptr _osbuild,bx
0162  C1 FA 08                          sar             edx,0x08
0165  24 0F                             and             al,0x0f
0167  88 15 00 00 00 00                 mov             byte ptr _osmajor,dl
016D  A2 00 00 00 00                    mov             byte ptr _osminor,al
0172  BA 01 00 00 00                    mov             edx,0x00000001
0177                            L$9:
0177  89 D0                             mov             eax,edx
0179  81 C4 04 01 00 00                 add             esp,0x00000104
017F  5E                                pop             esi
0180  5B                                pop             ebx
0181  C3                                ret

Routine Size: 340 bytes,    Routine Base: _TEXT + 002E

0182                            __NTMainInit:
0182  53                                push            ebx
0183  6A 00                             push            0x00000000
0185  E8 00 00 00 00                    call            _GetModuleHandleA
018A  50                                push            eax
018B  8B 54 24 10                       mov             edx,dword ptr 0x10[esp]
018F  52                                push            edx
0190  6A 00                             push            0x00000000
0192  E8 00 00 00 00                    call            __NTInit
0197  83 C4 0C                          add             esp,0x0000000c
019A  8B 5C 24 08                       mov             ebx,dword ptr 0x8[esp]
019E  53                                push            ebx
019F  E8 00 00 00 00                    call            __NewExceptionHandler
01A4  83 C4 04                          add             esp,0x00000004
01A7  FF 15 00 00 00 00                 call            dword ptr __sig_init_rtn
01AD  64 A1 08 00 00 00                 mov             eax,dword ptr fs:[0x8]
01B3  89 C3                             mov             ebx,eax
01B5  FF 15 00 00 00 00                 call            dword ptr __GetThreadPtr
01BB  89 18                             mov             dword ptr [eax],ebx
01BD  B8 FF 00 00 00                    mov             eax,0x000000ff
01C2  E8 00 00 00 00                    call            __InitRtns
01C7  5B                                pop             ebx
01C8  C3                                ret

Routine Size: 71 bytes,    Routine Base: _TEXT + 0182

01C9                            __exit:
01C9  E8 00 00 00 00                    call            __DoneExceptionHandler
01CE  BA FF 00 00 00                    mov             edx,0x000000ff
01D3  31 C0                             xor             eax,eax
01D5  E8 00 00 00 00                    call            __FiniRtns
01DA  FF 15 00 00 00 00                 call            dword ptr _ThreadExitRtn
01E0  8B 14 24                          mov             edx,dword ptr [esp]
01E3  52                                push            edx
01E4  E8 00 00 00 00                    call            _ExitProcess

Routine Size: 32 bytes,    Routine Base: _TEXT + 01C9

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 0000004C bytes
0000                            __TlsIndex:
0000  FF FF FF FF                                     ....
0004                            __GetThreadPtr:
0004  00 00 00 00                                     DD        offset __SingleThread
0008                            _AccessFileH:
0008  00 00 00 00                                     DD        offset __NullAccessRtn
000C                            _ReleaseFileH:
000C  00 00 00 00                                     DD        offset __NullAccessRtn
0010                            _InitAccessH:
0010  00 00 00 00                                     DD        offset __DefInitAccessH
0014                            _FiniAccessH:
0014  00 00 00 00                                     DD        offset __DefFiniAccessH
0018                            _AccessIOB:
0018  00 00 00 00                                     DD        offset __NullAccIOBRtn
001C                            _ReleaseIOB:
001C  00 00 00 00                                     DD        offset __NullAccIOBRtn
0020                            _AccessNHeap:
0020  00 00 00 00                                     DD        offset __NullAccHeapRtn
0024                            _AccessFHeap:
0024  00 00 00 00                                     DD        offset __NullAccHeapRtn
0028                            _ReleaseNHeap:
0028  00 00 00 00                                     DD        offset __NullAccHeapRtn
002C                            _ReleaseFHeap:
002C  00 00 00 00                                     DD        offset __NullAccHeapRtn
0030                            _AccessTDList:
0030  00 00 00 00                                     DD        offset __NullAccTDListRtn
0034                            _ReleaseTDList:
0034  00 00 00 00                                     DD        offset __NullAccTDListRtn
0038                            _AccessFList:
0038  00 00 00 00                                     DD        offset __NullAccIOBRtn
003C                            _ReleaseFList:
003C  00 00 00 00                                     DD        offset __NullAccIOBRtn
0040                            _ThreadExitRtn:
0040  00 00 00 00                                     DD        offset __NullExitRtn
0044                            __sig_init_rtn:
0044  00 00 00 00                                     DD        offset __SigInit
0048                            __sig_fini_rtn:
0048  00 00 00 00                                     DD        offset __SigFini

Segment: _BSS DWORD USE32 00000008 bytes
0000                            __Is_DLL:
0004                            __FirstThreadData:

BSS Size: 8 bytes


Module: thredwnt
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 000001BE bytes
0000                            _begin_thread_helper:
0000  56                                push            esi
0001  57                                push            edi
0002  55                                push            ebp
0003  89 E5                             mov             ebp,esp
0005  83 EC 0C                          sub             esp,0x0000000c
0008  8B 4D 10                          mov             ecx,dword ptr 0x10[ebp]
000B  8B 01                             mov             eax,dword ptr [ecx]
000D  89 45 FC                          mov             dword ptr -0x4[ebp],eax
0010  A1 00 00 00 00                    mov             eax,dword ptr ___ThreadDataSize
0015  83 C0 03                          add             eax,0x00000003
0018  8B 1D 00 00 00 00                 mov             ebx,dword ptr ___ThreadDataSize
001E  24 FC                             and             al,0xfc
0020  8B 79 04                          mov             edi,dword ptr 0x4[ecx]
0023  29 C4                             sub             esp,eax
0025  89 E6                             mov             esi,esp
0027  31 D2                             xor             edx,edx
0029  89 F0                             mov             eax,esi
002B  E8 00 00 00 00                    call            memset_
0030  83 3D 00 00 00 00 00              cmp             dword ptr ___Is_DLL,0x00000000
0037  75 0B                             jne             L$1
0039  89 F0                             mov             eax,esi
003B  E8 00 00 00 00                    call            __NTAddThread_
0040  85 C0                             test            eax,eax
0042  74 2C                             je              L$2
0044                            L$1:
0044  FF 15 00 00 00 00                 call            dword ptr ___GetThreadPtr
004A  8B 59 0C                          mov             ebx,dword ptr 0xc[ecx]
004D  89 18                             mov             dword ptr [eax],ebx
004F  8B 59 10                          mov             ebx,dword ptr 0x10[ecx]
0052  53                                push            ebx
0053  E8 00 00 00 00                    call            _SetEvent
0058  8D 45 F4                          lea             eax,-0xc[ebp]
005B  E8 00 00 00 00                    call            __NewExceptionHandler_
0060  FF 15 00 00 00 00                 call            dword ptr ___sig_init_rtn
0066  89 F8                             mov             eax,edi
0068  FF 55 FC                          call            dword ptr -0x4[ebp]
006B  E8 00 00 00 00                    call            _endthread_
0070                            L$2:
0070  89 EC                             mov             esp,ebp
0072  5D                                pop             ebp
0073  5F                                pop             edi
0074  5E                                pop             esi
0075  C3                                ret

Routine Size: 118 bytes,    Routine Base: _TEXT + 0000

0076                            __CBeginThread_:
0076  56                                push            esi
0077  57                                push            edi
0078  06                                push            es
0079  55                                push            ebp
007A  81 EC 04 01 00 00                 sub             esp,0x00000104
0080  89 C6                             mov             esi,eax
0082  89 DD                             mov             ebp,ebx
0084  8B 15 00 00 00 00                 mov             edx,dword ptr ___TlsIndex
008A  83 FA FF                          cmp             edx,0xffffffff
008D  75 15                             jne             L$4
008F  E8 00 00 00 00                    call            __NTThreadInit_
0094  85 C0                             test            eax,eax
0096  75 07                             jne             L$3
0098  89 D0                             mov             eax,edx
009A  E9 EF 00 00 00                    jmp             L$6
009F                            L$3:
009F  E8 00 00 00 00                    call            __InitMultipleThread_
00A4                            L$4:
00A4  89 B4 24 EC 00 00 00              mov             dword ptr 0xec[esp],esi
00AB  89 8C 24 F0 00 00 00              mov             dword ptr 0xf0[esp],ecx
00B2  E8 00 00 00 00                    call            _GetCurrentThread
00B7  89 84 24 F4 00 00 00              mov             dword ptr 0xf4[esp],eax
00BE  8C D8                             mov             eax,ds
00C0  8D BC 24 CC 00 00 00              lea             edi,0xcc[esp]
00C7  8E C0                             mov             es,eax
00C9  BE 00 00 00 00                    mov             esi,offset DGROUP:L$8
00CE  BB 10 00 00 00                    mov             ebx,0x00000010
00D3  A5                                movsd
00D4  A5                                movsd
00D5  A4                                movsb
00D6  E8 00 00 00 00                    call            _GetCurrentThreadId
00DB  8D 94 24 D4 00 00 00              lea             edx,0xd4[esp]
00E2  E8 00 00 00 00                    call            itoa_
00E7  8D 84 24 CC 00 00 00              lea             eax,0xcc[esp]
00EE  50                                push            eax
00EF  6A 00                             push            0x00000000
00F1  6A 00                             push            0x00000000
00F3  6A 00                             push            0x00000000
00F5  E8 00 00 00 00                    call            _CreateEventA
00FA  89 84 24 FC 00 00 00              mov             dword ptr 0xfc[esp],eax
0101  8D 84 24 00 01 00 00              lea             eax,0x100[esp]
0108  50                                push            eax
0109  6A 04                             push            0x00000004
010B  8D 84 24 F4 00 00 00              lea             eax,0xf4[esp]
0112  50                                push            eax
0113  81 C5 FF 0F 00 00                 add             ebp,0x00000fff
0119  68 00 00 00 00                    push            offset _begin_thread_helper
011E  81 E5 00 F0 FF FF                 and             ebp,0xfffff000
0124  55                                push            ebp
0125  6A 00                             push            0x00000000
0127  E8 00 00 00 00                    call            _CreateThread
012C  89 C3                             mov             ebx,eax
012E  85 C0                             test            eax,eax
0130  75 07                             jne             L$5
0132  B8 FF FF FF FF                    mov             eax,0xffffffff
0137  EB 55                             jmp             L$6
0139                            L$5:
0139  89 E0                             mov             eax,esp
013B  50                                push            eax
013C  B9 03 00 01 00                    mov             ecx,0x00010003
0141  53                                push            ebx
0142  89 4C 24 08                       mov             dword ptr 0x8[esp],ecx
0146  E8 00 00 00 00                    call            _GetThreadContext
014B  8B 84 24 C4 00 00 00              mov             eax,dword ptr 0xc4[esp]
0152  05 FF 0F 00 00                    add             eax,0x00000fff
0157  80 E4 F0                          and             ah,0xf0
015A  30 C0                             xor             al,al
015C  29 E8                             sub             eax,ebp
015E  53                                push            ebx
015F  89 84 24 FC 00 00 00              mov             dword ptr 0xfc[esp],eax
0166  E8 00 00 00 00                    call            _ResumeThread
016B  6A FF                             push            0xffffffff
016D  8B B4 24 00 01 00 00              mov             esi,dword ptr 0x100[esp]
0174  56                                push            esi
0175  E8 00 00 00 00                    call            _WaitForSingleObject
017A  8B BC 24 FC 00 00 00              mov             edi,dword ptr 0xfc[esp]
0181  57                                push            edi
0182  E8 00 00 00 00                    call            _CloseHandle
0187  8B 84 24 00 01 00 00              mov             eax,dword ptr 0x100[esp]
018E                            L$6:
018E  81 C4 04 01 00 00                 add             esp,0x00000104
0194  5D                                pop             ebp
0195  07                                pop             es
0196  5F                                pop             edi
0197  5E                                pop             esi
0198  C3                                ret

Routine Size: 291 bytes,    Routine Base: _TEXT + 0076

0199                            __CEndThread_:
0199  51                                push            ecx
019A  52                                push            edx
019B  FF 15 00 00 00 00                 call            dword ptr ___sig_fini_rtn
01A1  E8 00 00 00 00                    call            __DoneExceptionHandler_
01A6  83 3D 00 00 00 00 00              cmp             dword ptr ___Is_DLL,0x00000000
01AD  75 05                             jne             L$7
01AF  E8 00 00 00 00                    call            __NTRemoveThread_
01B4                            L$7:
01B4  6A 00                             push            0x00000000
01B6  E8 00 00 00 00                    call            _ExitThread
01BB  5A                                pop             edx
01BC  59                                pop             ecx
01BD  C3                                ret

Routine Size: 37 bytes,    Routine Base: _TEXT + 0199

No disassembly errors

Segment: CONST DWORD USE32 00000009 bytes
0000                            L$8:
0000  5F 5F 62 67 6E 74 68 64 00                      __bgnthd.

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes


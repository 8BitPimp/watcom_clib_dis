Module: mthread
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS,YIB,YI,YIE

Segment: _TEXT BYTE USE32 00000426 bytes
0000                            nullSema4Rtn:
0000  C3                                ret

Routine Size: 1 bytes,    Routine Base: _TEXT + 0000

0001                            __CloseSemaphore:
0001  53                                push            ebx
0002  8B 5C 24 08                       mov             ebx,dword ptr 0x8[esp]
0006  8B 13                             mov             edx,dword ptr [ebx]
0008  85 D2                             test            edx,edx
000A  74 06                             je              L$1
000C  52                                push            edx
000D  E8 00 00 00 00                    call            _CloseHandle
0012                            L$1:
0012  C7 03 00 00 00 00                 mov             dword ptr [ebx],0x00000000
0018  C7 43 04 00 00 00 00              mov             dword ptr 0x4[ebx],0x00000000
001F  C7 43 08 00 00 00 00              mov             dword ptr 0x8[ebx],0x00000000
0026  5B                                pop             ebx
0027  C3                                ret

Routine Size: 39 bytes,    Routine Base: _TEXT + 0001

0028                            __AccessSemaphore:
0028  53                                push            ebx
0029  56                                push            esi
002A  57                                push            edi
002B  55                                push            ebp
002C  8B 5C 24 14                       mov             ebx,dword ptr 0x14[esp]
0030  E8 00 00 00 00                    call            _GetCurrentThreadId
0035  8B 4B 04                          mov             ecx,dword ptr 0x4[ebx]
0038  89 C6                             mov             esi,eax
003A  39 C8                             cmp             eax,ecx
003C  74 3D                             je              L$4
003E  8B 3B                             mov             edi,dword ptr [ebx]
0040  85 FF                             test            edi,edi
0042  75 2A                             jne             L$3
0044  68 00 00 00 00                    push            offset InitSemaphore
0049  E8 00 00 00 00                    call            __AccessSemaphore
004E  8B 2B                             mov             ebp,dword ptr [ebx]
0050  83 C4 04                          add             esp,0x00000004
0053  85 ED                             test            ebp,ebp
0055  75 0A                             jne             L$2
0057  57                                push            edi
0058  57                                push            edi
0059  57                                push            edi
005A  E8 00 00 00 00                    call            _CreateMutexA
005F  89 03                             mov             dword ptr [ebx],eax
0061                            L$2:
0061  68 00 00 00 00                    push            offset InitSemaphore
0066  E8 00 00 00 00                    call            __ReleaseSemaphore
006B  83 C4 04                          add             esp,0x00000004
006E                            L$3:
006E  6A FF                             push            0xffffffff
0070  8B 03                             mov             eax,dword ptr [ebx]
0072  50                                push            eax
0073  E8 00 00 00 00                    call            _WaitForSingleObject
0078  89 73 04                          mov             dword ptr 0x4[ebx],esi
007B                            L$4:
007B  FF 43 08                          inc             dword ptr 0x8[ebx]
007E  5D                                pop             ebp
007F  5F                                pop             edi
0080  5E                                pop             esi
0081  5B                                pop             ebx
0082  C3                                ret

Routine Size: 91 bytes,    Routine Base: _TEXT + 0028

0083                            __ReleaseSemaphore:
0083  53                                push            ebx
0084  56                                push            esi
0085  8B 44 24 0C                       mov             eax,dword ptr 0xc[esp]
0089  8B 50 08                          mov             edx,dword ptr 0x8[eax]
008C  85 D2                             test            edx,edx
008E  76 15                             jbe             L$5
0090  8D 5A FF                          lea             ebx,-0x1[edx]
0093  89 58 08                          mov             dword ptr 0x8[eax],ebx
0096  85 DB                             test            ebx,ebx
0098  75 0B                             jne             L$5
009A  8B 30                             mov             esi,dword ptr [eax]
009C  56                                push            esi
009D  89 58 04                          mov             dword ptr 0x4[eax],ebx
00A0  E8 00 00 00 00                    call            _ReleaseMutex
00A5                            L$5:
00A5  5E                                pop             esi
00A6  5B                                pop             ebx
00A7  C3                                ret

Routine Size: 37 bytes,    Routine Base: _TEXT + 0083

00A8                            __AccessIOB:
00A8  68 00 00 00 00                    push            offset IOBSemaphore
00AD                            L$6:
00AD  E8 00 00 00 00                    call            __AccessSemaphore
00B2  83 C4 04                          add             esp,0x00000004
00B5  C3                                ret

Routine Size: 14 bytes,    Routine Base: _TEXT + 00A8

00B6                            __ReleaseIOB:
00B6  68 00 00 00 00                    push            offset IOBSemaphore
00BB                            L$7:
00BB  E8 00 00 00 00                    call            __ReleaseSemaphore
00C0  83 C4 04                          add             esp,0x00000004
00C3  C3                                ret

Routine Size: 14 bytes,    Routine Base: _TEXT + 00B6

00C4                            __AccessFileH:
00C4  8B 54 24 04                       mov             edx,dword ptr 0x4[esp]
00C8  83 E2 0F                          and             edx,0x0000000f
00CB  89 D0                             mov             eax,edx
00CD  C1 E0 02                          shl             eax,0x02
00D0  29 D0                             sub             eax,edx
00D2  C1 E0 02                          shl             eax,0x02
00D5  05 00 00 00 00                    add             eax,offset FileSemaphores
00DA  50                                push            eax
00DB  EB D0                             jmp             L$6

Routine Size: 25 bytes,    Routine Base: _TEXT + 00C4

00DD                            __ReleaseFileH:
00DD  8B 54 24 04                       mov             edx,dword ptr 0x4[esp]
00E1  83 E2 0F                          and             edx,0x0000000f
00E4  89 D0                             mov             eax,edx
00E6  C1 E0 02                          shl             eax,0x02
00E9  29 D0                             sub             eax,edx
00EB  C1 E0 02                          shl             eax,0x02
00EE  05 00 00 00 00                    add             eax,offset FileSemaphores
00F3  50                                push            eax
00F4  EB C5                             jmp             L$7

Routine Size: 25 bytes,    Routine Base: _TEXT + 00DD

00F6                            __InitAccessH:
00F6  8B 54 24 04                       mov             edx,dword ptr 0x4[esp]
00FA  52                                push            edx
00FB  E8 00 00 00 00                    call            __NTAddFileHandle
0100  83 C4 04                          add             esp,0x00000004
0103  C3                                ret

Routine Size: 14 bytes,    Routine Base: _TEXT + 00F6

0104                            __FiniAccessH:
0104  8B 54 24 04                       mov             edx,dword ptr 0x4[esp]
0108  83 E2 0F                          and             edx,0x0000000f
010B  89 D0                             mov             eax,edx
010D  C1 E0 02                          shl             eax,0x02
0110  29 D0                             sub             eax,edx
0112  C1 E0 02                          shl             eax,0x02
0115  05 00 00 00 00                    add             eax,offset FileSemaphores
011A  50                                push            eax
011B  E8 00 00 00 00                    call            __CloseSemaphore
0120  83 C4 04                          add             esp,0x00000004
0123  8B 54 24 04                       mov             edx,dword ptr 0x4[esp]
0127  52                                push            edx
0128  E8 00 00 00 00                    call            __NTRemoveFileHandle
012D  83 C4 04                          add             esp,0x00000004
0130  C3                                ret

Routine Size: 45 bytes,    Routine Base: _TEXT + 0104

0131                            __AccessNHeap:
0131  68 00 00 00 00                    push            offset NHeapSemaphore
0136  E9 72 FF FF FF                    jmp             L$6

Routine Size: 10 bytes,    Routine Base: _TEXT + 0131

013B                            __ReleaseNHeap:
013B  68 00 00 00 00                    push            offset NHeapSemaphore
0140  E9 76 FF FF FF                    jmp             L$7

Routine Size: 10 bytes,    Routine Base: _TEXT + 013B

0145                            __AccessFHeap:
0145  68 00 00 00 00                    push            offset FHeapSemaphore
014A  E9 5E FF FF FF                    jmp             L$6

Routine Size: 10 bytes,    Routine Base: _TEXT + 0145

014F                            __ReleaseFHeap:
014F  68 00 00 00 00                    push            offset FHeapSemaphore
0154  E9 62 FF FF FF                    jmp             L$7

Routine Size: 10 bytes,    Routine Base: _TEXT + 014F

0159                            __AccessTDList:
0159  68 00 00 00 00                    push            offset TDListSemaphore
015E  E9 4A FF FF FF                    jmp             L$6

Routine Size: 10 bytes,    Routine Base: _TEXT + 0159

0163                            __ReleaseTDList:
0163  68 00 00 00 00                    push            offset TDListSemaphore
0168  E9 4E FF FF FF                    jmp             L$7

Routine Size: 10 bytes,    Routine Base: _TEXT + 0163

016D                            __AccessFList:
016D  68 00 00 00 00                    push            offset FListSemaphore
0172  E9 36 FF FF FF                    jmp             L$6

Routine Size: 10 bytes,    Routine Base: _TEXT + 016D

0177                            __ReleaseFList:
0177  68 00 00 00 00                    push            offset FListSemaphore
017C  E9 3A FF FF FF                    jmp             L$7

Routine Size: 10 bytes,    Routine Base: _TEXT + 0177

0181                            __MultipleThread:
0181  8B 15 00 00 00 00                 mov             edx,dword ptr __TlsIndex
0187  52                                push            edx
0188  E8 00 00 00 00                    call            _TlsGetValue
018D  85 C0                             test            eax,eax
018F  0F 84 00 00 00 00                 je              __GetThreadData
0195  C3                                ret

Routine Size: 21 bytes,    Routine Base: _TEXT + 0181

0196                            __InitThreadData:
0196  53                                push            ebx
0197  8B 5C 24 08                       mov             ebx,dword ptr 0x8[esp]
019B  85 DB                             test            ebx,ebx
019D  75 1B                             jne             L$8
019F  8B 15 00 00 00 00                 mov             edx,dword ptr __ThreadDataSize
01A5  52                                push            edx
01A6  6A 01                             push            0x00000001
01A8  E8 00 00 00 00                    call            calloc
01AD  83 C4 08                          add             esp,0x00000008
01B0  89 C3                             mov             ebx,eax
01B2  85 C0                             test            eax,eax
01B4  74 04                             je              L$8
01B6  C6 40 52 01                       mov             byte ptr 0x52[eax],0x01
01BA                            L$8:
01BA  85 DB                             test            ebx,ebx
01BC  74 12                             je              L$9
01BE  C7 43 0C 01 00 00 00              mov             dword ptr 0xc[ebx],0x00000001
01C5  E8 00 00 00 00                    call            _GetCurrentThreadId
01CA  89 83 DA 00 00 00                 mov             dword ptr 0xda[ebx],eax
01D0                            L$9:
01D0  89 D8                             mov             eax,ebx
01D2  5B                                pop             ebx
01D3  C3                                ret

Routine Size: 62 bytes,    Routine Base: _TEXT + 0196

01D4                            __NTThreadInit:
01D4  E8 00 00 00 00                    call            _TlsAlloc
01D9  A3 00 00 00 00                    mov             dword ptr __TlsIndex,eax
01DE  83 F8 FF                          cmp             eax,0xffffffff
01E1  0F 95 C0                          setne           al
01E4  25 FF 00 00 00                    and             eax,0x000000ff
01E9  C3                                ret

Routine Size: 22 bytes,    Routine Base: _TEXT + 01D4

01EA                            __NTAddThread:
01EA  53                                push            ebx
01EB  56                                push            esi
01EC  83 3D 00 00 00 00 FF              cmp             dword ptr __TlsIndex,0xffffffff
01F3  75 05                             jne             L$11
01F5                            L$10:
01F5  31 C0                             xor             eax,eax
01F7  5E                                pop             esi
01F8  5B                                pop             ebx
01F9  C3                                ret
01FA                            L$11:
01FA  8B 5C 24 0C                       mov             ebx,dword ptr 0xc[esp]
01FE  53                                push            ebx
01FF  E8 00 00 00 00                    call            __InitThreadData
0204  89 C3                             mov             ebx,eax
0206  83 C4 04                          add             esp,0x00000004
0209  85 C0                             test            eax,eax
020B  74 31                             je              L$13
020D  50                                push            eax
020E  8B 88 DA 00 00 00                 mov             ecx,dword ptr 0xda[eax]
0214  51                                push            ecx
0215  E8 00 00 00 00                    call            __AddThreadData
021A  83 C4 08                          add             esp,0x00000008
021D  85 C0                             test            eax,eax
021F  75 0B                             jne             L$12
0221  53                                push            ebx
0222  E8 00 00 00 00                    call            free
0227  83 C4 04                          add             esp,0x00000004
022A  EB C9                             jmp             L$10
022C                            L$12:
022C  53                                push            ebx
022D  8B 35 00 00 00 00                 mov             esi,dword ptr __TlsIndex
0233  56                                push            esi
0234  E8 00 00 00 00                    call            _TlsSetValue
0239  B8 01 00 00 00                    mov             eax,0x00000001
023E                            L$13:
023E  5E                                pop             esi
023F  5B                                pop             ebx
0240  C3                                ret

Routine Size: 87 bytes,    Routine Base: _TEXT + 01EA

0241                            __NTRemoveThread:
0241  56                                push            esi
0242  8B 15 00 00 00 00                 mov             edx,dword ptr __TlsIndex
0248  83 FA FF                          cmp             edx,0xffffffff
024B  74 27                             je              L$14
024D  52                                push            edx
024E  E8 00 00 00 00                    call            _TlsGetValue
0253  85 C0                             test            eax,eax
0255  74 1D                             je              L$14
0257  8B 88 DA 00 00 00                 mov             ecx,dword ptr 0xda[eax]
025D  51                                push            ecx
025E  E8 00 00 00 00                    call            __RemoveThreadData
0263  83 C4 04                          add             esp,0x00000004
0266  6A 00                             push            0x00000000
0268  8B 35 00 00 00 00                 mov             esi,dword ptr __TlsIndex
026E  56                                push            esi
026F  E8 00 00 00 00                    call            _TlsSetValue
0274                            L$14:
0274  5E                                pop             esi
0275  C3                                ret
0276                            __ThreadExit:
0276  E8 00 00 00 00                    call            __NTRemoveThread

Routine Size: 58 bytes,    Routine Base: _TEXT + 0241

027B                            __NTThreadFini:
027B  8B 15 00 00 00 00                 mov             edx,dword ptr __TlsIndex
0281  83 FA FF                          cmp             edx,0xffffffff
0284  74 10                             je              L$15
0286  52                                push            edx
0287  E8 00 00 00 00                    call            _TlsFree
028C  C7 05 00 00 00 00 FF FF FF FF
                                        mov             dword ptr __TlsIndex,0xffffffff
0296                            L$15:
0296  C3                                ret

Routine Size: 28 bytes,    Routine Base: _TEXT + 027B

0297                            __InitMultipleThread:
0297  53                                push            ebx
0298  56                                push            esi
0299  57                                push            edi
029A  55                                push            ebp
029B  BA 00 00 00 00                    mov             edx,offset __AccessFileH
02A0  BB 00 00 00 00                    mov             ebx,offset __ReleaseFileH
02A5  B9 00 00 00 00                    mov             ecx,offset __InitAccessH
02AA  BE 00 00 00 00                    mov             esi,offset __FiniAccessH
02AF  BF 00 00 00 00                    mov             edi,offset __AccessIOB
02B4  6A 00                             push            0x00000000
02B6  BD 00 00 00 00                    mov             ebp,offset __ReleaseIOB
02BB  B8 00 00 00 00                    mov             eax,offset __AccessSemaphore
02C0  6A 00                             push            0x00000000
02C2  89 15 00 00 00 00                 mov             dword ptr _AccessFileH,edx
02C8  89 1D 00 00 00 00                 mov             dword ptr _ReleaseFileH,ebx
02CE  89 0D 00 00 00 00                 mov             dword ptr _InitAccessH,ecx
02D4  89 35 00 00 00 00                 mov             dword ptr _FiniAccessH,esi
02DA  89 3D 00 00 00 00                 mov             dword ptr _AccessIOB,edi
02E0  89 2D 00 00 00 00                 mov             dword ptr _ReleaseIOB,ebp
02E6  A3 00 00 00 00                    mov             dword ptr __AccessSema4,eax
02EB  BA 00 00 00 00                    mov             edx,offset __ReleaseSemaphore
02F0  BB 00 00 00 00                    mov             ebx,offset __CloseSemaphore
02F5  B9 00 00 00 00                    mov             ecx,offset __AccessNHeap
02FA  BE 00 00 00 00                    mov             esi,offset __AccessFHeap
02FF  BF 00 00 00 00                    mov             edi,offset __ReleaseNHeap
0304  BD 00 00 00 00                    mov             ebp,offset __ReleaseFHeap
0309  B8 00 00 00 00                    mov             eax,offset __AccessTDList
030E  6A 00                             push            0x00000000
0310  89 15 00 00 00 00                 mov             dword ptr __ReleaseSema4,edx
0316  89 1D 00 00 00 00                 mov             dword ptr __CloseSema4,ebx
031C  89 0D 00 00 00 00                 mov             dword ptr _AccessNHeap,ecx
0322  89 35 00 00 00 00                 mov             dword ptr _AccessFHeap,esi
0328  89 3D 00 00 00 00                 mov             dword ptr _ReleaseNHeap,edi
032E  89 2D 00 00 00 00                 mov             dword ptr _ReleaseFHeap,ebp
0334  A3 00 00 00 00                    mov             dword ptr _AccessTDList,eax
0339  BA 00 00 00 00                    mov             edx,offset __ReleaseTDList
033E  BB 00 00 00 00                    mov             ebx,offset __AccessFList
0343  BE 00 00 00 00                    mov             esi,offset __ThreadExit
0348  89 15 00 00 00 00                 mov             dword ptr _ReleaseTDList,edx
034E  E8 00 00 00 00                    call            _CreateMutexA
0353  B9 00 00 00 00                    mov             ecx,offset __ReleaseFList
0358  8B 3D 00 00 00 00                 mov             edi,dword ptr __FirstThreadData
035E  A3 00 00 00 00                    mov             dword ptr InitSemaphore,eax
0363  57                                push            edi
0364  8B AF DA 00 00 00                 mov             ebp,dword ptr 0xda[edi]
036A  89 1D 00 00 00 00                 mov             dword ptr _AccessFList,ebx
0370  55                                push            ebp
0371  89 35 00 00 00 00                 mov             dword ptr _ThreadExitRtn,esi
0377  89 0D 00 00 00 00                 mov             dword ptr _ReleaseFList,ecx
037D  E8 00 00 00 00                    call            __AddThreadData
0382  83 C4 08                          add             esp,0x00000008
0385  A1 00 00 00 00                    mov             eax,dword ptr __FirstThreadData
038A  50                                push            eax
038B  8B 15 00 00 00 00                 mov             edx,dword ptr __TlsIndex
0391  52                                push            edx
0392  BB 00 00 00 00                    mov             ebx,offset __MultipleThread
0397  E8 00 00 00 00                    call            _TlsSetValue
039C  89 1D 00 00 00 00                 mov             dword ptr __GetThreadPtr,ebx
03A2  5D                                pop             ebp
03A3  5F                                pop             edi
03A4  5E                                pop             esi
03A5  5B                                pop             ebx
03A6  C3                                ret
03A7                            __FiniSema4s:
03A7  53                                push            ebx
03A8  56                                push            esi
03A9  68 00 00 00 00                    push            offset NHeapSemaphore
03AE  FF 15 00 00 00 00                 call            dword ptr __CloseSema4
03B4  83 C4 04                          add             esp,0x00000004
03B7  68 00 00 00 00                    push            offset FHeapSemaphore
03BC  FF 15 00 00 00 00                 call            dword ptr __CloseSema4
03C2  83 C4 04                          add             esp,0x00000004
03C5  BB 00 00 00 00                    mov             ebx,offset FileSemaphores
03CA  68 00 00 00 00                    push            offset IOBSemaphore
03CF  8D B3 C0 00 00 00                 lea             esi,0xc0[ebx]
03D5  FF 15 00 00 00 00                 call            dword ptr __CloseSema4
03DB  83 C4 04                          add             esp,0x00000004
03DE                            L$16:
03DE  53                                push            ebx
03DF  FF 15 00 00 00 00                 call            dword ptr __CloseSema4
03E5  83 C3 0C                          add             ebx,0x0000000c
03E8  83 C4 04                          add             esp,0x00000004
03EB  39 F3                             cmp             ebx,esi
03ED  75 EF                             jne             L$16
03EF  68 00 00 00 00                    push            offset FListSemaphore
03F4  FF 15 00 00 00 00                 call            dword ptr __CloseSema4
03FA  83 C4 04                          add             esp,0x00000004
03FD  E8 00 00 00 00                    call            __FiniThreadProcessing
0402  68 00 00 00 00                    push            offset TDListSemaphore
0407  FF 15 00 00 00 00                 call            dword ptr __CloseSema4
040D  83 C4 04                          add             esp,0x00000004
0410  68 00 00 00 00                    push            offset InitSemaphore
0415  FF 15 00 00 00 00                 call            dword ptr __CloseSema4
041B  83 C4 04                          add             esp,0x00000004
041E  E8 00 00 00 00                    call            __NTThreadFini
0423  5E                                pop             esi
0424  5B                                pop             ebx
0425  C3                                ret

Routine Size: 399 bytes,    Routine Base: _TEXT + 0297

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 0000000C bytes
0000                            __AccessSema4:
0000  00 00 00 00                                     DD        offset nullSema4Rtn
0004                            __ReleaseSema4:
0004  00 00 00 00                                     DD        offset nullSema4Rtn
0008                            __CloseSema4:
0008  00 00 00 00                                     DD        offset nullSema4Rtn

Segment: _BSS DWORD USE32 00000108 bytes
0000                            FileSemaphores:
00C0                            TDListSemaphore:
00CC                            InitSemaphore:
00D8                            IOBSemaphore:
00E4                            NHeapSemaphore:
00F0                            FHeapSemaphore:
00FC                            FListSemaphore:

BSS Size: 264 bytes

Segment: YIB BYTE USE32 00000000 bytes

Segment: YI BYTE USE32 00000006 bytes
0000                            __AccessSema4Fini:
0000  00 0A                                           ..
0002  00 00 00 00                                     DD        offset __FiniSema4s

Segment: YIE BYTE USE32 00000000 bytes


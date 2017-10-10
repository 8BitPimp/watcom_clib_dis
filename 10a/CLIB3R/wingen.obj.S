Module: wingen
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000523 bytes
0000                            _GetWindowData_:
0000  53                                push            ebx
0001  51                                push            ecx
0002  52                                push            edx
0003  56                                push            esi
0004  57                                push            edi
0005  8B 35 00 00 00 00                 mov             esi,dword ptr __MainWindowData
000B  89 C1                             mov             ecx,eax
000D  31 D2                             xor             edx,edx
000F  31 DB                             xor             ebx,ebx
0011  EB 0F                             jmp             L$2
0013                            L$1:
0013  8B 46 04                          mov             eax,dword ptr 0x4[esi]
0016  8B 04 03                          mov             eax,dword ptr [ebx+eax]
0019  3B 48 3A                          cmp             ecx,dword ptr 0x3a[eax]
001C  74 0F                             je              L$3
001E  83 C3 04                          add             ebx,0x00000004
0021  42                                inc             edx
0022                            L$2:
0022  8B 7E 08                          mov             edi,dword ptr 0x8[esi]
0025  89 F0                             mov             eax,esi
0027  39 FA                             cmp             edx,edi
0029  7C E8                             jl              L$1
002B  31 F0                             xor             eax,esi
002D                            L$3:
002D  89 35 00 00 00 00                 mov             dword ptr __MainWindowData,esi
0033  E9 93 00 00 00                    jmp             L$13

Routine Size: 56 bytes,    Routine Base: _TEXT + 0000

0038                            _GetActiveWindowData_:
0038  53                                push            ebx
0039  51                                push            ecx
003A  52                                push            edx
003B  56                                push            esi
003C  8B 35 00 00 00 00                 mov             esi,dword ptr __MainWindowData
0042  31 DB                             xor             ebx,ebx
0044  31 D2                             xor             edx,edx
0046  EB 10                             jmp             L$5
0048                            L$4:
0048  8B 46 04                          mov             eax,dword ptr 0x4[esi]
004B  8B 04 02                          mov             eax,dword ptr [edx+eax]
004E  F6 40 52 02                       test            byte ptr 0x52[eax],0x02
0052  75 0F                             jne             L$6
0054  83 C2 04                          add             edx,0x00000004
0057  43                                inc             ebx
0058                            L$5:
0058  8B 4E 08                          mov             ecx,dword ptr 0x8[esi]
005B  89 F0                             mov             eax,esi
005D  39 CB                             cmp             ebx,ecx
005F  7C E7                             jl              L$4
0061  31 F0                             xor             eax,esi
0063                            L$6:
0063  89 35 00 00 00 00                 mov             dword ptr __MainWindowData,esi
0069  5E                                pop             esi
006A  5A                                pop             edx
006B  59                                pop             ecx
006C  5B                                pop             ebx
006D  C3                                ret

Routine Size: 54 bytes,    Routine Base: _TEXT + 0038

006E                            _MakeWindowActive_:
006E  53                                push            ebx
006F  51                                push            ecx
0070  52                                push            edx
0071  56                                push            esi
0072  57                                push            edi
0073  55                                push            ebp
0074  8B 2D 00 00 00 00                 mov             ebp,dword ptr __MainWindowData
007A  89 C6                             mov             esi,eax
007C  31 FF                             xor             edi,edi
007E  31 DB                             xor             ebx,ebx
0080  31 D2                             xor             edx,edx
0082  EB 1E                             jmp             L$9
0084                            L$7:
0084  8B 45 04                          mov             eax,dword ptr 0x4[ebp]
0087  8B 04 02                          mov             eax,dword ptr [edx+eax]
008A  8A 48 52                          mov             cl,byte ptr 0x52[eax]
008D  F6 C1 02                          test            cl,0x02
0090  74 0C                             je              L$8
0092  88 CD                             mov             ch,cl
0094  80 E5 FD                          and             ch,0xfd
0097  89 C7                             mov             edi,eax
0099  88 68 52                          mov             byte ptr 0x52[eax],ch
009C  EB 0D                             jmp             L$10
009E                            L$8:
009E  83 C2 04                          add             edx,0x00000004
00A1  43                                inc             ebx
00A2                            L$9:
00A2  8B 4D 08                          mov             ecx,dword ptr 0x8[ebp]
00A5  89 E8                             mov             eax,ebp
00A7  39 CB                             cmp             ebx,ecx
00A9  7C D9                             jl              L$7
00AB                            L$10:
00AB  80 4E 52 02                       or              byte ptr 0x52[esi],0x02
00AF  39 F7                             cmp             edi,esi
00B1  75 02                             jne             L$11
00B3  31 F7                             xor             edi,esi
00B5                            L$11:
00B5  89 F0                             mov             eax,esi
00B7  89 FA                             mov             edx,edi
00B9  89 2D 00 00 00 00                 mov             dword ptr __MainWindowData,ebp
00BF  E8 00 00 00 00                    call            _ShowWindowActive_
00C4  8B 2D 00 00 00 00                 mov             ebp,dword ptr __MainWindowData
00CA                            L$12:
00CA  5D                                pop             ebp
00CB                            L$13:
00CB  5F                                pop             edi
00CC  5E                                pop             esi
00CD  5A                                pop             edx
00CE  59                                pop             ecx
00CF  5B                                pop             ebx
00D0  C3                                ret

Routine Size: 99 bytes,    Routine Base: _TEXT + 006E

00D1                            _IsWindowedHandle_:
00D1  53                                push            ebx
00D2  51                                push            ecx
00D3  52                                push            edx
00D4  56                                push            esi
00D5  57                                push            edi
00D6  55                                push            ebp
00D7  89 C6                             mov             esi,eax
00D9  31 FF                             xor             edi,edi
00DB  31 ED                             xor             ebp,ebp
00DD  EB 20                             jmp             L$17
00DF                            L$14:
00DF  8B 40 04                          mov             eax,dword ptr 0x4[eax]
00E2  31 D2                             xor             edx,edx
00E4  31 DB                             xor             ebx,ebx
00E6  8B 04 28                          mov             eax,dword ptr [eax+ebp]
00E9  EB 0B                             jmp             L$16
00EB                            L$15:
00EB  8B 08                             mov             ecx,dword ptr [eax]
00ED  3B 34 19                          cmp             esi,dword ptr [ecx+ebx]
00F0  74 D8                             je              L$12
00F2  83 C3 04                          add             ebx,0x00000004
00F5  42                                inc             edx
00F6                            L$16:
00F6  3B 50 04                          cmp             edx,dword ptr 0x4[eax]
00F9  7C F0                             jl              L$15
00FB  83 C5 04                          add             ebp,0x00000004
00FE  47                                inc             edi
00FF                            L$17:
00FF  A1 00 00 00 00                    mov             eax,dword ptr __MainWindowData
0104  3B 78 08                          cmp             edi,dword ptr 0x8[eax]
0107  7C D6                             jl              L$14
0109  31 C0                             xor             eax,eax
010B  EB BD                             jmp             L$12

Routine Size: 60 bytes,    Routine Base: _TEXT + 00D1

010D                            _RemoveWindowedHandle_:
010D  53                                push            ebx
010E  51                                push            ecx
010F  52                                push            edx
0110  56                                push            esi
0111  57                                push            edi
0112  55                                push            ebp
0113  83 EC 08                          sub             esp,0x00000008
0116  50                                push            eax
0117  31 D2                             xor             edx,edx
0119  89 54 24 04                       mov             dword ptr 0x4[esp],edx
011D  89 54 24 08                       mov             dword ptr 0x8[esp],edx
0121  EB 5A                             jmp             L$24
0123                            L$18:
0123  8B 74 24 08                       mov             esi,dword ptr 0x8[esp]
0127  8B 50 04                          mov             edx,dword ptr 0x4[eax]
012A  01 F2                             add             edx,esi
012C  31 FF                             xor             edi,edi
012E  31 ED                             xor             ebp,ebp
0130  8B 12                             mov             edx,dword ptr [edx]
0132  EB 30                             jmp             L$23
0134                            L$19:
0134  8B 02                             mov             eax,dword ptr [edx]
0136  8B 1C 24                          mov             ebx,dword ptr [esp]
0139  3B 1C 28                          cmp             ebx,dword ptr [eax+ebp]
013C  75 22                             jne             L$22
013E  89 F9                             mov             ecx,edi
0140  8B 72 04                          mov             esi,dword ptr 0x4[edx]
0143  89 FB                             mov             ebx,edi
0145  4E                                dec             esi
0146  C1 E3 02                          shl             ebx,0x02
0149  89 72 04                          mov             dword ptr 0x4[edx],esi
014C  EB 0D                             jmp             L$21
014E                            L$20:
014E  8B 02                             mov             eax,dword ptr [edx]
0150  8B 74 03 04                       mov             esi,dword ptr 0x4[ebx+eax]
0154  41                                inc             ecx
0155  89 34 03                          mov             dword ptr [ebx+eax],esi
0158  83 C3 04                          add             ebx,0x00000004
015B                            L$21:
015B  3B 4A 04                          cmp             ecx,dword ptr 0x4[edx]
015E  7C EE                             jl              L$20
0160                            L$22:
0160  83 C5 04                          add             ebp,0x00000004
0163  47                                inc             edi
0164                            L$23:
0164  3B 7A 04                          cmp             edi,dword ptr 0x4[edx]
0167  7C CB                             jl              L$19
0169  8B 54 24 08                       mov             edx,dword ptr 0x8[esp]
016D  8B 5C 24 04                       mov             ebx,dword ptr 0x4[esp]
0171  83 C2 04                          add             edx,0x00000004
0174  43                                inc             ebx
0175  89 54 24 08                       mov             dword ptr 0x8[esp],edx
0179  89 5C 24 04                       mov             dword ptr 0x4[esp],ebx
017D                            L$24:
017D  A1 00 00 00 00                    mov             eax,dword ptr __MainWindowData
0182  8B 54 24 04                       mov             edx,dword ptr 0x4[esp]
0186  3B 50 08                          cmp             edx,dword ptr 0x8[eax]
0189  7C 98                             jl              L$18
018B  83 C4 0C                          add             esp,0x0000000c
018E  E9 37 FF FF FF                    jmp             L$12

Routine Size: 134 bytes,    Routine Base: _TEXT + 010D

0193                            _WindowsExit_:
0193  E8 00 00 00 00                    call            _ExecutionComplete_
0198                            L$25:
0198  31 C0                             xor             eax,eax
019A  E8 00 00 00 00                    call            _MessageLoop_
019F  85 C0                             test            eax,eax
01A1  75 F5                             jne             L$25
01A3  A3 00 00 00 00                    mov             dword ptr __WindowExitRtn,eax
01A8  C3                                ret

Routine Size: 22 bytes,    Routine Base: _TEXT + 0193

01A9                            _DestroyOnClose_:
01A9  80 48 52 20                       or              byte ptr 0x52[eax],0x20
01AD                            L$26:
01AD  B8 01 00 00 00                    mov             eax,0x00000001
01B2  C3                                ret

Routine Size: 10 bytes,    Routine Base: _TEXT + 01A9

01B3                            _YieldControl_:
01B3  B8 01 00 00 00                    mov             eax,0x00000001
01B8  E8 00 00 00 00                    call            _MessageLoop_
01BD  EB EE                             jmp             L$26

Routine Size: 12 bytes,    Routine Base: _TEXT + 01B3

01BF                            _InitFunctionPointers_:
01BF  53                                push            ebx
01C0  51                                push            ecx
01C1  52                                push            edx
01C2  56                                push            esi
01C3  57                                push            edi
01C4  55                                push            ebp
01C5  BA 00 00 00 00                    mov             edx,offset _DoStdin_
01CA  BB 00 00 00 00                    mov             ebx,offset _DoStdout_
01CF  B9 00 00 00 00                    mov             ecx,offset _DoKbhit_
01D4  BE 00 00 00 00                    mov             esi,offset _DoGetch_
01D9  BF 00 00 00 00                    mov             edi,offset _DoGetche_
01DE  BD 00 00 00 00                    mov             ebp,offset _DoPutch_
01E3  B8 00 00 00 00                    mov             eax,offset _WindowsExit_
01E8  89 15 00 00 00 00                 mov             dword ptr __WindowsStdin,edx
01EE  89 1D 00 00 00 00                 mov             dword ptr __WindowsStdout,ebx
01F4  89 0D 00 00 00 00                 mov             dword ptr __WindowsKbhit,ecx
01FA  89 35 00 00 00 00                 mov             dword ptr __WindowsGetch,esi
0200  89 3D 00 00 00 00                 mov             dword ptr __WindowsGetche,edi
0206  89 2D 00 00 00 00                 mov             dword ptr __WindowsPutch,ebp
020C  A3 00 00 00 00                    mov             dword ptr __WindowExitRtn,eax
0211  BA 00 00 00 00                    mov             edx,offset _IsWindowedHandle_
0216  BB 00 00 00 00                    mov             ebx,offset _RemoveWindowedHandle_
021B  B9 00 00 00 00                    mov             ecx,offset _NewWindow_
0220  BE 00 00 00 00                    mov             esi,offset _CloseWindow_
0225  BF 00 00 00 00                    mov             edi,offset _SetAboutDlg_
022A  BD 00 00 00 00                    mov             ebp,offset _SetAppTitle_
022F  B8 00 00 00 00                    mov             eax,offset _SetConTitle_
0234  89 15 00 00 00 00                 mov             dword ptr __WindowsIsWindowedHandle,edx
023A  89 1D 00 00 00 00                 mov             dword ptr __WindowsRemoveWindowedHandle,ebx
0240  89 0D 00 00 00 00                 mov             dword ptr __WindowsNewWindow,ecx
0246  89 35 00 00 00 00                 mov             dword ptr __WindowsCloseWindow,esi
024C  89 3D 00 00 00 00                 mov             dword ptr __WindowsSetAbout,edi
0252  89 2D 00 00 00 00                 mov             dword ptr __WindowsSetAppTitle,ebp
0258  A3 00 00 00 00                    mov             dword ptr __WindowsSetConTitle,eax
025D  BA 00 00 00 00                    mov             edx,offset _DestroyOnClose_
0262  BB 00 00 00 00                    mov             ebx,offset _YieldControl_
0267  B9 00 00 00 00                    mov             ecx,offset _ShutDown_
026C  89 15 00 00 00 00                 mov             dword ptr __WindowsDestroyOnClose,edx
0272  89 1D 00 00 00 00                 mov             dword ptr __WindowsYieldControl,ebx
0278  89 0D 00 00 00 00                 mov             dword ptr __WindowsShutDown,ecx
027E  E9 47 FE FF FF                    jmp             L$12

Routine Size: 196 bytes,    Routine Base: _TEXT + 01BF

0283                            _MemAlloc_:
0283  53                                push            ebx
0284  51                                push            ecx
0285  52                                push            edx
0286  89 C3                             mov             ebx,eax
0288  E8 00 00 00 00                    call            malloc_
028D  89 C1                             mov             ecx,eax
028F  85 C0                             test            eax,eax
0291  75 1A                             jne             L$28
0293  E8 00 00 00 00                    call            _OutOfMemory_
0298                            L$27:
0298  31 C0                             xor             eax,eax
029A  E8 00 00 00 00                    call            _MessageLoop_
029F  85 C0                             test            eax,eax
02A1  75 F5                             jne             L$27
02A3  A3 00 00 00 00                    mov             dword ptr __WindowExitRtn,eax
02A8  E8 00 00 00 00                    call            exit_
02AD                            L$28:
02AD  89 C8                             mov             eax,ecx
02AF  31 D2                             xor             edx,edx
02B1  E8 00 00 00 00                    call            memset_
02B6  89 C8                             mov             eax,ecx
02B8  5A                                pop             edx
02B9  59                                pop             ecx
02BA  5B                                pop             ebx
02BB  C3                                ret

Routine Size: 57 bytes,    Routine Base: _TEXT + 0283

02BC                            _MemReAlloc_:
02BC  E8 00 00 00 00                    call            realloc_
02C1  89 C2                             mov             edx,eax
02C3  85 C0                             test            eax,eax
02C5  75 1A                             jne             L$30
02C7  E8 00 00 00 00                    call            _OutOfMemory_
02CC                            L$29:
02CC  31 C0                             xor             eax,eax
02CE  E8 00 00 00 00                    call            _MessageLoop_
02D3  85 C0                             test            eax,eax
02D5  75 F5                             jne             L$29
02D7  A3 00 00 00 00                    mov             dword ptr __WindowExitRtn,eax
02DC  E8 00 00 00 00                    call            exit_
02E1                            L$30:
02E1  89 D0                             mov             eax,edx
02E3  C3                                ret

Routine Size: 40 bytes,    Routine Base: _TEXT + 02BC

02E4                            _MemFree_:
02E4  E9 00 00 00 00                    jmp             free_

Routine Size: 5 bytes,    Routine Base: _TEXT + 02E4

02E9                            _GetWindowNameAndCoords_:
02E9  56                                push            esi
02EA  57                                push            edi
02EB  55                                push            ebp
02EC  85 C0                             test            eax,eax
02EE  75 1E                             jne             L$31
02F0  8B 35 00 00 00 00                 mov             esi,dword ptr DGROUP:L$46
02F6  46                                inc             esi
02F7  56                                push            esi
02F8  68 00 00 00 00                    push            offset DGROUP:L$45
02FD  52                                push            edx
02FE  89 35 00 00 00 00                 mov             dword ptr DGROUP:L$46,esi
0304  E8 00 00 00 00                    call            sprintf_
0309  83 C4 0C                          add             esp,0x0000000c
030C  EB 22                             jmp             L$34
030E                            L$31:
030E  89 D7                             mov             edi,edx
0310  89 C6                             mov             esi,eax
0312  57                                push            edi
0313                            L$32:
0313  8A 06                             mov             al,byte ptr [esi]
0315  88 07                             mov             byte ptr [edi],al
0317  3C 00                             cmp             al,0x00
0319  0F 84 10 00 00 00                 je              L$33
031F  8A 46 01                          mov             al,byte ptr 0x1[esi]
0322  83 C6 02                          add             esi,0x00000002
0325  88 47 01                          mov             byte ptr 0x1[edi],al
0328  83 C7 02                          add             edi,0x00000002
032B  3C 00                             cmp             al,0x00
032D  75 E4                             jne             L$32
032F                            L$33:
032F  5F                                pop             edi
0330                            L$34:
0330  8B 54 24 10                       mov             edx,dword ptr 0x10[esp]
0334  8B 2D 04 00 00 00                 mov             ebp,dword ptr DGROUP:L$47
033A  A1 04 00 00 00                    mov             eax,dword ptr DGROUP:L$47
033F  83 C5 02                          add             ebp,0x00000002
0342  89 03                             mov             dword ptr [ebx],eax
0344  A1 08 00 00 00                    mov             eax,dword ptr DGROUP:L$48
0349  8B 1D 10 00 00 00                 mov             ebx,dword ptr DGROUP:L$50
034F  89 2D 04 00 00 00                 mov             dword ptr DGROUP:L$47,ebp
0355  89 01                             mov             dword ptr [ecx],eax
0357  A1 0C 00 00 00                    mov             eax,dword ptr DGROUP:L$49
035C  83 EB 02                          sub             ebx,0x00000002
035F  89 02                             mov             dword ptr [edx],eax
0361  8B 54 24 14                       mov             edx,dword ptr 0x14[esp]
0365  A1 10 00 00 00                    mov             eax,dword ptr DGROUP:L$50
036A  89 1D 10 00 00 00                 mov             dword ptr DGROUP:L$50,ebx
0370  89 02                             mov             dword ptr [edx],eax
0372  A1 0C 00 00 00                    mov             eax,dword ptr DGROUP:L$49
0377  8B 15 08 00 00 00                 mov             edx,dword ptr DGROUP:L$48
037D  83 C0 02                          add             eax,0x00000002
0380  83 EA 02                          sub             edx,0x00000002
0383  A3 0C 00 00 00                    mov             dword ptr DGROUP:L$49,eax
0388  89 15 08 00 00 00                 mov             dword ptr DGROUP:L$48,edx
038E  83 FD 17                          cmp             ebp,0x00000017
0391  7E 13                             jle             L$35
0393  31 F6                             xor             esi,esi
0395  BF 46 00 00 00                    mov             edi,0x00000046
039A  89 35 04 00 00 00                 mov             dword ptr DGROUP:L$47,esi
03A0  89 3D 08 00 00 00                 mov             dword ptr DGROUP:L$48,edi
03A6                            L$35:
03A6  83 3D 0C 00 00 00 09              cmp             dword ptr DGROUP:L$49,0x00000009
03AD  7E 12                             jle             L$36
03AF  31 C0                             xor             eax,eax
03B1  BA 1B 00 00 00                    mov             edx,0x0000001b
03B6  A3 0C 00 00 00                    mov             dword ptr DGROUP:L$49,eax
03BB  89 15 10 00 00 00                 mov             dword ptr DGROUP:L$50,edx
03C1                            L$36:
03C1  5D                                pop             ebp
03C2  5F                                pop             edi
03C3  5E                                pop             esi
03C4  C2 08 00                          ret             0x0008

Routine Size: 222 bytes,    Routine Base: _TEXT + 02E9

03C7                            _InitMainWindowData_:
03C7  53                                push            ebx
03C8  51                                push            ecx
03C9  52                                push            edx
03CA  89 C1                             mov             ecx,eax
03CC  B8 70 00 00 00                    mov             eax,0x00000070
03D1  E8 00 00 00 00                    call            _MemAlloc_
03D6  89 C2                             mov             edx,eax
03D8  BB 70 00 00 00                    mov             ebx,0x00000070
03DD  31 C2                             xor             edx,eax
03DF  A3 00 00 00 00                    mov             dword ptr __MainWindowData,eax
03E4  E8 00 00 00 00                    call            memset_
03E9  A1 00 00 00 00                    mov             eax,dword ptr __MainWindowData
03EE  C7 40 08 00 00 00 00              mov             dword ptr 0x8[eax],0x00000000
03F5  C7 40 04 00 00 00 00              mov             dword ptr 0x4[eax],0x00000000
03FC  89 08                             mov             dword ptr [eax],ecx
03FE  5A                                pop             edx
03FF  59                                pop             ecx
0400  5B                                pop             ebx
0401  C3                                ret

Routine Size: 59 bytes,    Routine Base: _TEXT + 03C7

0402                            _AnotherWindowData_:
0402  53                                push            ebx
0403  51                                push            ecx
0404  56                                push            esi
0405  57                                push            edi
0406  55                                push            ebp
0407  83 EC 04                          sub             esp,0x00000004
040A  89 C7                             mov             edi,eax
040C  89 D1                             mov             ecx,edx
040E  B8 70 00 00 00                    mov             eax,0x00000070
0413  BB 70 00 00 00                    mov             ebx,0x00000070
0418  E8 00 00 00 00                    call            _MemAlloc_
041D  31 D2                             xor             edx,edx
041F  89 C6                             mov             esi,eax
0421  89 C5                             mov             ebp,eax
0423  E8 00 00 00 00                    call            memset_
0428  A1 00 00 00 00                    mov             eax,dword ptr __MainWindowData
042D  8B 50 08                          mov             edx,dword ptr 0x8[eax]
0430  42                                inc             edx
0431  8B 40 04                          mov             eax,dword ptr 0x4[eax]
0434  C1 E2 02                          shl             edx,0x02
0437  E8 00 00 00 00                    call            _MemReAlloc_
043C  89 C2                             mov             edx,eax
043E  A1 00 00 00 00                    mov             eax,dword ptr __MainWindowData
0443  8B 58 08                          mov             ebx,dword ptr 0x8[eax]
0446  89 50 04                          mov             dword ptr 0x4[eax],edx
0449  89 34 9A                          mov             dword ptr [edx+ebx*4],esi
044C  FF 40 08                          inc             dword ptr 0x8[eax]
044F  C7 46 4A 01 00 00 00              mov             dword ptr 0x4a[esi],0x00000001
0456  C7 46 4E 01 00 00 00              mov             dword ptr 0x4e[esi],0x00000001
045D  B8 8B 00 00 00                    mov             eax,0x0000008b
0462  C7 46 46 01 00 00 00              mov             dword ptr 0x46[esi],0x00000001
0469  E8 00 00 00 00                    call            _MemAlloc_
046E  C6 46 6F 02                       mov             byte ptr 0x6f[esi],0x02
0472  89 46 53                          mov             dword ptr 0x53[esi],eax
0475  BB 04 00 00 00                    mov             ebx,0x00000004
047A  89 7E 3A                          mov             dword ptr 0x3a[esi],edi
047D  31 F6                             xor             esi,esi
047F  31 C0                             xor             eax,eax
0481                            L$37:
0481  8B 39                             mov             edi,dword ptr [ecx]
0483  83 C7 04                          add             edi,0x00000004
0486  89 39                             mov             dword ptr [ecx],edi
0488  8B 7F FC                          mov             edi,dword ptr -0x4[edi]
048B  83 FF FF                          cmp             edi,0xffffffff
048E  74 1C                             je              L$38
0490  89 F2                             mov             edx,esi
0492  C1 E2 02                          shl             edx,0x02
0495  89 14 24                          mov             dword ptr [esp],edx
0498  89 DA                             mov             edx,ebx
049A  E8 00 00 00 00                    call            realloc_
049F  89 C2                             mov             edx,eax
04A1  03 14 24                          add             edx,dword ptr [esp]
04A4  46                                inc             esi
04A5  83 C3 04                          add             ebx,0x00000004
04A8  89 3A                             mov             dword ptr [edx],edi
04AA  EB D5                             jmp             L$37
04AC                            L$38:
04AC  89 45 00                          mov             dword ptr [ebp],eax
04AF  89 75 04                          mov             dword ptr 0x4[ebp],esi
04B2  89 E8                             mov             eax,ebp
04B4  83 C4 04                          add             esp,0x00000004
04B7  5D                                pop             ebp
04B8  5F                                pop             edi
04B9  5E                                pop             esi
04BA  59                                pop             ecx
04BB  5B                                pop             ebx
04BC  C3                                ret

Routine Size: 187 bytes,    Routine Base: _TEXT + 0402

04BD                            _DestroyAWindow_:
04BD  53                                push            ebx
04BE  51                                push            ecx
04BF  52                                push            edx
04C0  56                                push            esi
04C1  55                                push            ebp
04C2  89 C6                             mov             esi,eax
04C4  A1 00 00 00 00                    mov             eax,dword ptr __MainWindowData
04C9  31 D2                             xor             edx,edx
04CB  31 DB                             xor             ebx,ebx
04CD  EB 49                             jmp             L$43
04CF                            L$39:
04CF  8B 48 04                          mov             ecx,dword ptr 0x4[eax]
04D2  3B 34 19                          cmp             esi,dword ptr [ecx+ebx]
04D5  75 3D                             jne             L$42
04D7  8B 68 08                          mov             ebp,dword ptr 0x8[eax]
04DA  89 D3                             mov             ebx,edx
04DC  4D                                dec             ebp
04DD  C1 E2 02                          shl             edx,0x02
04E0  89 68 08                          mov             dword ptr 0x8[eax],ebp
04E3  EB 0E                             jmp             L$41
04E5                            L$40:
04E5  8B 40 04                          mov             eax,dword ptr 0x4[eax]
04E8  8B 4C 02 04                       mov             ecx,dword ptr 0x4[edx+eax]
04EC  43                                inc             ebx
04ED  89 0C 02                          mov             dword ptr [edx+eax],ecx
04F0  83 C2 04                          add             edx,0x00000004
04F3                            L$41:
04F3  A1 00 00 00 00                    mov             eax,dword ptr __MainWindowData
04F8  3B 58 08                          cmp             ebx,dword ptr 0x8[eax]
04FB  7C E8                             jl              L$40
04FD  89 F0                             mov             eax,esi
04FF  E8 00 00 00 00                    call            _ReleaseWindowResources_
0504  8B 06                             mov             eax,dword ptr [esi]
0506  E8 00 00 00 00                    call            free_
050B  89 F0                             mov             eax,esi
050D  E8 00 00 00 00                    call            free_
0512  EB 09                             jmp             L$44
0514                            L$42:
0514  83 C3 04                          add             ebx,0x00000004
0517  42                                inc             edx
0518                            L$43:
0518  3B 50 08                          cmp             edx,dword ptr 0x8[eax]
051B  7C B2                             jl              L$39
051D                            L$44:
051D  5D                                pop             ebp
051E  5E                                pop             esi
051F  5A                                pop             edx
0520  59                                pop             ecx
0521  5B                                pop             ebx
0522  C3                                ret

Routine Size: 102 bytes,    Routine Base: _TEXT + 04BD

No disassembly errors

Segment: CONST DWORD USE32 0000000B bytes
0000                            L$45:
0000  43 6F 6E 73 6F 6C 65 20 25 64 00                Console %d.

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000014 bytes
0000                            L$46:
0000  00 00 00 00                                     ....
0004                            L$47:
0004  00 00 00 00                                     ....
0008                            L$48:
0008  46 00 00 00                                     F...
000C                            L$49:
000C  00 00 00 00                                     ....
0010                            L$50:
0010  1B 00 00 00                                     ....

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes


Module: cwaitwnt
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000069 bytes
0000                            cwait:
0000  53                                push            ebx
0001  83 EC 04                          sub             esp,0x00000004
0004  8B 54 24 14                       mov             edx,dword ptr 0x14[esp]
0008  85 D2                             test            edx,edx
000A  74 14                             je              L$3
000C                            L$1:
000C  6A 09                             push            0x00000009
000E                            L$2:
000E  E8 00 00 00 00                    call            __set_errno
0013  B8 FF FF FF FF                    mov             eax,0xffffffff
0018  83 C4 04                          add             esp,0x00000004
001B  83 C4 04                          add             esp,0x00000004
001E  5B                                pop             ebx
001F  C3                                ret
0020                            L$3:
0020  8B 5C 24 10                       mov             ebx,dword ptr 0x10[esp]
0024  53                                push            ebx
0025  52                                push            edx
0026  68 00 04 10 00                    push            0x00100400
002B  E8 00 00 00 00                    call            _OpenProcess
0030  89 C3                             mov             ebx,eax
0032  85 C0                             test            eax,eax
0034  75 04                             jne             L$4
0036  6A 11                             push            0x00000011
0038  EB D4                             jmp             L$2
003A                            L$4:
003A  6A FF                             push            0xffffffff
003C  50                                push            eax
003D  E8 00 00 00 00                    call            _WaitForSingleObject
0042  85 C0                             test            eax,eax
0044  75 C6                             jne             L$1
0046  89 E0                             mov             eax,esp
0048  50                                push            eax
0049  53                                push            ebx
004A  E8 00 00 00 00                    call            _GetExitCodeProcess
004F  8B 04 24                          mov             eax,dword ptr [esp]
0052  C1 E0 08                          shl             eax,0x08
0055  8B 5C 24 0C                       mov             ebx,dword ptr 0xc[esp]
0059  25 00 FF 00 00                    and             eax,0x0000ff00
005E  89 03                             mov             dword ptr [ebx],eax
0060  8B 44 24 10                       mov             eax,dword ptr 0x10[esp]
0064  83 C4 04                          add             esp,0x00000004
0067  5B                                pop             ebx
0068  C3                                ret

Routine Size: 105 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes


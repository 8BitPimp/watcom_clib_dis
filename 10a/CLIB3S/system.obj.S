Module: system
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000071 bytes
0000                            system:
0000  53                                push            ebx
0001  55                                push            ebp
0002  89 E5                             mov             ebp,esp
0004  83 EC 08                          sub             esp,0x00000008
0007  68 00 00 00 00                    push            offset DGROUP:L$5
000C  E8 00 00 00 00                    call            getenv
0011  8B 55 0C                          mov             edx,dword ptr 0xc[ebp]
0014  83 C4 04                          add             esp,0x00000004
0017  89 C3                             mov             ebx,eax
0019  85 D2                             test            edx,edx
001B  75 0A                             jne             L$1
001D  B8 01 00 00 00                    mov             eax,0x00000001
0022  89 EC                             mov             esp,ebp
0024  5D                                pop             ebp
0025  5B                                pop             ebx
0026  C3                                ret
0027                            L$1:
0027  C6 45 FC 01                       mov             byte ptr -0x4[ebp],0x01
002B  85 C0                             test            eax,eax
002D  75 05                             jne             L$2
002F  BB 08 00 00 00                    mov             ebx,offset DGROUP:L$6
0034                            L$2:
0034  6A 00                             push            0x00000000
0036  8B 4D 0C                          mov             ecx,dword ptr 0xc[ebp]
0039  31 C0                             xor             eax,eax
003B  51                                push            ecx
003C  8A 45 FC                          mov             al,byte ptr -0x4[ebp]
003F  50                                push            eax
0040  8D 45 F8                          lea             eax,-0x8[ebp]
0043  50                                push            eax
0044  E8 00 00 00 00                    call            __Slash_C
0049  83 C4 08                          add             esp,0x00000008
004C  8A 75 FC                          mov             dh,byte ptr -0x4[ebp]
004F  50                                push            eax
0050  84 F6                             test            dh,dh
0052  74 07                             je              L$3
0054  B8 1C 00 00 00                    mov             eax,offset DGROUP:L$7
0059  EB 05                             jmp             L$4
005B                            L$3:
005B  B8 20 00 00 00                    mov             eax,offset DGROUP:L$8
0060                            L$4:
0060  50                                push            eax
0061  53                                push            ebx
0062  6A 00                             push            0x00000000
0064  E8 00 00 00 00                    call            spawnlp
0069  83 C4 18                          add             esp,0x00000018
006C  89 EC                             mov             esp,ebp
006E  5D                                pop             ebp
006F  5B                                pop             ebx
0070  C3                                ret

Routine Size: 113 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000028 bytes
0000                            L$5:
0000  43 6F 6D 53 70 65 63 00                         ComSpec.
0008                            L$6:
0008  43 4D 44 2E 45 58 45 00 43 4F 4D 4D 41 4E 44 2E CMD.EXE.COMMAND.
0018  43 4F 4D 00                                     COM.
001C                            L$7:
001C  43 4D 44 00                                     CMD.
0020                            L$8:
0020  43 4F 4D 4D 41 4E 44 00                         COMMAND.

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes


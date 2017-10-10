Module: ioalloc
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000080 bytes
0000                            __ioalloc:
0000  53                                push            ebx
0001  8B 5C 24 08                       mov             ebx,dword ptr 0x8[esp]
0005  53                                push            ebx
0006  E8 00 00 00 00                    call            __chktty
000B  8B 53 14                          mov             edx,dword ptr 0x14[ebx]
000E  83 C4 04                          add             esp,0x00000004
0011  85 D2                             test            edx,edx
0013  75 26                             jne             L$3
0015  8A 63 0D                          mov             ah,byte ptr 0xd[ebx]
0018  F6 C4 02                          test            ah,0x02
001B  74 09                             je              L$1
001D  C7 43 14 86 00 00 00              mov             dword ptr 0x14[ebx],0x00000086
0024  EB 15                             jmp             L$3
0026                            L$1:
0026  F6 C4 04                          test            ah,0x04
0029  74 09                             je              L$2
002B  C7 43 14 01 00 00 00              mov             dword ptr 0x14[ebx],0x00000001
0032  EB 07                             jmp             L$3
0034                            L$2:
0034  C7 43 14 00 10 00 00              mov             dword ptr 0x14[ebx],0x00001000
003B                            L$3:
003B  8B 4B 14                          mov             ecx,dword ptr 0x14[ebx]
003E  51                                push            ecx
003F  E8 00 00 00 00                    call            malloc
0044  83 C4 04                          add             esp,0x00000004
0047  89 43 08                          mov             dword ptr 0x8[ebx],eax
004A  85 C0                             test            eax,eax
004C  75 20                             jne             L$4
004E  8A 4B 0D                          mov             cl,byte ptr 0xd[ebx]
0051  C7 43 14 01 00 00 00              mov             dword ptr 0x14[ebx],0x00000001
0058  80 E1 F8                          and             cl,0xf8
005B  8D 43 18                          lea             eax,0x18[ebx]
005E  88 4B 0D                          mov             byte ptr 0xd[ebx],cl
0061  88 CD                             mov             ch,cl
0063  89 43 08                          mov             dword ptr 0x8[ebx],eax
0066  80 CD 04                          or              ch,0x04
0069  88 6B 0D                          mov             byte ptr 0xd[ebx],ch
006C  EB 04                             jmp             L$5
006E                            L$4:
006E  80 4B 0C 08                       or              byte ptr 0xc[ebx],0x08
0072                            L$5:
0072  8B 43 08                          mov             eax,dword ptr 0x8[ebx]
0075  C7 43 04 00 00 00 00              mov             dword ptr 0x4[ebx],0x00000000
007C  89 03                             mov             dword ptr [ebx],eax
007E  5B                                pop             ebx
007F  C3                                ret

Routine Size: 128 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes


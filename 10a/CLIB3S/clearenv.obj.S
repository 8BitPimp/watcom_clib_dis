Module: clearenv
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 0000009B bytes
0000                            clearenv:
0000  53                                push            ebx
0001  56                                push            esi
0002  57                                push            edi
0003  8B 15 00 00 00 00                 mov             edx,dword ptr environ
0009  85 D2                             test            edx,edx
000B  0F 84 84 00 00 00                 je              L$8
0011  89 D3                             mov             ebx,edx
0013  EB 31                             jmp             L$4
0015                            L$1:
0015  8B 35 00 00 00 00                 mov             esi,dword ptr __env_mask
001B  85 F6                             test            esi,esi
001D  74 24                             je              L$3
001F  8B 3D 00 00 00 00                 mov             edi,dword ptr environ
0025  89 D9                             mov             ecx,ebx
0027  29 F9                             sub             ecx,edi
0029  89 F2                             mov             edx,esi
002B  C1 F9 02                          sar             ecx,0x02
002E  80 3C 11 00                       cmp             byte ptr [ecx+edx],0x00
0032  74 09                             je              L$2
0034  50                                push            eax
0035  E8 00 00 00 00                    call            free
003A  83 C4 04                          add             esp,0x00000004
003D                            L$2:
003D  C7 03 00 00 00 00                 mov             dword ptr [ebx],0x00000000
0043                            L$3:
0043  83 C3 04                          add             ebx,0x00000004
0046                            L$4:
0046  8B 03                             mov             eax,dword ptr [ebx]
0048  85 C0                             test            eax,eax
004A  75 C9                             jne             L$1
004C  83 3D 00 00 00 00 00              cmp             dword ptr __env_mask,0x00000000
0053  75 0C                             jne             L$5
0055  6A 05                             push            0x00000005
0057  E8 00 00 00 00                    call            malloc
005C  83 C4 04                          add             esp,0x00000004
005F  EB 11                             jmp             L$6
0061                            L$5:
0061  6A 05                             push            0x00000005
0063  8B 0D 00 00 00 00                 mov             ecx,dword ptr environ
0069  51                                push            ecx
006A  E8 00 00 00 00                    call            realloc
006F  83 C4 08                          add             esp,0x00000008
0072                            L$6:
0072  85 C0                             test            eax,eax
0074  75 09                             jne             L$7
0076  B8 FF FF FF FF                    mov             eax,0xffffffff
007B  5F                                pop             edi
007C  5E                                pop             esi
007D  5B                                pop             ebx
007E  C3                                ret
007F                            L$7:
007F  A3 00 00 00 00                    mov             dword ptr environ,eax
0084  C7 00 00 00 00 00                 mov             dword ptr [eax],0x00000000
008A  83 C0 04                          add             eax,0x00000004
008D  A3 00 00 00 00                    mov             dword ptr __env_mask,eax
0092  C6 00 00                          mov             byte ptr [eax],0x00
0095                            L$8:
0095  31 C0                             xor             eax,eax
0097  5F                                pop             edi
0098  5E                                pop             esi
0099  5B                                pop             ebx
009A  C3                                ret

Routine Size: 155 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes


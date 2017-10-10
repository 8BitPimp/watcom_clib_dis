Module: fstrcspn
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000067 bytes
0000                            _fstrcspn:
0000  53                                push            ebx
0001  06                                push            es
0002  83 EC 20                          sub             esp,0x00000020
0005  8B 5C 24 2C                       mov             ebx,dword ptr 0x2c[esp]
0009  31 C0                             xor             eax,eax
000B  66 8B 44 24 38                    mov             ax,word ptr 0x38[esp]
0010  50                                push            eax
0011  8B 54 24 38                       mov             edx,dword ptr 0x38[esp]
0015  8D 44 24 04                       lea             eax,0x4[esp]
0019  52                                push            edx
001A  8C DA                             mov             edx,ds
001C  81 E2 FF FF 00 00                 and             edx,0x0000ffff
0022  52                                push            edx
0023  50                                push            eax
0024  E8 00 00 00 00                    call            __fsetbits
0029  83 C4 10                          add             esp,0x00000010
002C  31 C9                             xor             ecx,ecx
002E  8E 44 24 30                       mov             es,dword ptr 0x30[esp]
0032  EB 22                             jmp             L$2
0034                            L$1:
0034  89 C2                             mov             edx,eax
0036  C1 EA 03                          shr             edx,0x03
0039  8A 14 14                          mov             dl,byte ptr [esp+edx]
003C  83 E0 07                          and             eax,0x00000007
003F  81 E2 FF 00 00 00                 and             edx,0x000000ff
0045  8A 80 00 00 00 00                 mov             al,byte ptr _Bits[eax]
004B  25 FF 00 00 00                    and             eax,0x000000ff
0050  85 C2                             test            edx,eax
0052  75 0B                             jne             L$3
0054  41                                inc             ecx
0055  43                                inc             ebx
0056                            L$2:
0056  31 C0                             xor             eax,eax
0058  26 8A 03                          mov             al,byte ptr es:[ebx]
005B  85 C0                             test            eax,eax
005D  75 D5                             jne             L$1
005F                            L$3:
005F  89 C8                             mov             eax,ecx
0061  83 C4 20                          add             esp,0x00000020
0064  07                                pop             es
0065  5B                                pop             ebx
0066  C3                                ret

Routine Size: 103 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes


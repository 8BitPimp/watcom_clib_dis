Module: ustrlwr
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000035 bytes
0000                            _ustrlwr:
0000  53                                push            ebx
0001  55                                push            ebp
0002  89 E5                             mov             ebp,esp
0004  8B 45 0C                          mov             eax,dword ptr 0xc[ebp]
0007                            L$1:
0007  66 8B 10                          mov             dx,word ptr [eax]
000A  66 85 D2                          test            dx,dx
000D  74 20                             je              L$3
000F  89 D3                             mov             ebx,edx
0011  30 D3                             xor             bl,dl
0013  0F B7 DB                          movzx           ebx,bx
0016  85 DB                             test            ebx,ebx
0018  75 11                             jne             L$2
001A  83 EA 41                          sub             edx,0x00000041
001D  0F B7 DA                          movzx           ebx,dx
0020  83 FB 19                          cmp             ebx,0x00000019
0023  7F 06                             jg              L$2
0025  83 C2 61                          add             edx,0x00000061
0028  66 89 10                          mov             word ptr [eax],dx
002B                            L$2:
002B  40                                inc             eax
002C  40                                inc             eax
002D  EB D8                             jmp             L$1
002F                            L$3:
002F  8B 45 0C                          mov             eax,dword ptr 0xc[ebp]
0032  5D                                pop             ebp
0033  5B                                pop             ebx
0034  C3                                ret

Routine Size: 53 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes


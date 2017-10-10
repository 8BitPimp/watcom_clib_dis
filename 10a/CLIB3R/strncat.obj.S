Module: strncat
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 0000003D bytes
0000                            strncat_:
0000  51                                push            ecx
0001  56                                push            esi
0002  57                                push            edi
0003  55                                push            ebp
0004  89 C5                             mov             ebp,eax
0006  89 D6                             mov             esi,edx
0008  B9 FF FF FF FF                    mov             ecx,0xffffffff
000D  89 C7                             mov             edi,eax
000F  30 C0                             xor             al,al
0011  06                                push            es
0012  E3 0B                             jecxz           L$1
0014  8C DA                             mov             edx,ds
0016  8E C2                             mov             es,edx
0018  F2 AE                             repne scasb
001A  75 03                             jne             L$1
001C  4F                                dec             edi
001D  66 A9                                           f.
001F                            L$1:
001F  89 CF                             mov             edi,ecx
0021  07                                pop             es
0022                            L$2:
0022  85 DB                             test            ebx,ebx
0024  74 0D                             je              L$3
0026  8A 06                             mov             al,byte ptr [esi]
0028  88 07                             mov             byte ptr [edi],al
002A  84 C0                             test            al,al
002C  74 05                             je              L$3
002E  47                                inc             edi
002F  46                                inc             esi
0030  4B                                dec             ebx
0031  EB EF                             jmp             L$2
0033                            L$3:
0033  89 E8                             mov             eax,ebp
0035  C6 07 00                          mov             byte ptr [edi],0x00
0038  5D                                pop             ebp
0039  5F                                pop             edi
003A  5E                                pop             esi
003B  59                                pop             ecx
003C  C3                                ret

Routine Size: 61 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes


Module: strrev
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000035 bytes
0000                            _strrev_:
0000                            strrev_:
0000  53                                push            ebx
0001  51                                push            ecx
0002  52                                push            edx
0003  57                                push            edi
0004  89 C3                             mov             ebx,eax
0006  89 C7                             mov             edi,eax
0008  89 C2                             mov             edx,eax
000A  06                                push            es
000B  8C D8                             mov             eax,ds
000D  8E C0                             mov             es,eax
000F  29 C9                             sub             ecx,ecx
0011  49                                dec             ecx
0012  31 C0                             xor             eax,eax
0014  F2 AE                             repne scasb
0016  F7 D1                             not             ecx
0018  49                                dec             ecx
0019  07                                pop             es
001A  8D 44 0B FF                       lea             eax,-0x1[ebx+ecx]
001E                            L$1:
001E  39 C2                             cmp             edx,eax
0020  73 0C                             jae             L$2
0022  8A 08                             mov             cl,byte ptr [eax]
0024  8A 2A                             mov             ch,byte ptr [edx]
0026  88 0A                             mov             byte ptr [edx],cl
0028  42                                inc             edx
0029  88 28                             mov             byte ptr [eax],ch
002B  48                                dec             eax
002C  EB F0                             jmp             L$1
002E                            L$2:
002E  89 D8                             mov             eax,ebx
0030  5F                                pop             edi
0031  5A                                pop             edx
0032  59                                pop             ecx
0033  5B                                pop             ebx
0034  C3                                ret

Routine Size: 53 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes


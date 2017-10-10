Module: strupr
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 0000001F bytes
0000                            _strupr_:
0000                            strupr_:
0000  53                                push            ebx
0001  52                                push            edx
0002  89 C3                             mov             ebx,eax
0004                            L$1:
0004  8A 10                             mov             dl,byte ptr [eax]
0006  84 D2                             test            dl,dl
0008  74 10                             je              L$3
000A  80 EA 61                          sub             dl,0x61
000D  80 FA 19                          cmp             dl,0x19
0010  77 05                             ja              L$2
0012  80 C2 41                          add             dl,0x41
0015  88 10                             mov             byte ptr [eax],dl
0017                            L$2:
0017  40                                inc             eax
0018  EB EA                             jmp             L$1
001A                            L$3:
001A  89 D8                             mov             eax,ebx
001C  5A                                pop             edx
001D  5B                                pop             ebx
001E  C3                                ret

Routine Size: 31 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes


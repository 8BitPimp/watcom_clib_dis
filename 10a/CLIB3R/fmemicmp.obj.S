Module: fmemicmp
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 0000005B bytes
0000                            _fmemicmp_:
0000  06                                push            es
0001  0F A0                             push            fs
0003  83 EC 04                          sub             esp,0x00000004
0006  8E C2                             mov             es,edx
0008  8E E1                             mov             fs,ecx
000A  8B 54 24 10                       mov             edx,dword ptr 0x10[esp]
000E  EB 3C                             jmp             L$5
0010                            L$1:
0010  26 8A 08                          mov             cl,byte ptr es:[eax]
0013  80 F9 41                          cmp             cl,0x41
0016  72 08                             jb              L$2
0018  80 F9 5A                          cmp             cl,0x5a
001B  77 03                             ja              L$2
001D  80 C1 20                          add             cl,0x20
0020                            L$2:
0020  64 8A 2B                          mov             ch,byte ptr fs:[ebx]
0023  88 2C 24                          mov             byte ptr [esp],ch
0026  80 FD 41                          cmp             ch,0x41
0029  72 0B                             jb              L$3
002B  80 FD 5A                          cmp             ch,0x5a
002E  77 06                             ja              L$3
0030  80 C5 20                          add             ch,0x20
0033  88 2C 24                          mov             byte ptr [esp],ch
0036                            L$3:
0036  8A 2C 24                          mov             ch,byte ptr [esp]
0039  38 E9                             cmp             cl,ch
003B  74 0C                             je              L$4
003D  31 C0                             xor             eax,eax
003F  31 D2                             xor             edx,edx
0041  88 C8                             mov             al,cl
0043  88 EA                             mov             dl,ch
0045  29 D0                             sub             eax,edx
0047  EB 09                             jmp             L$6
0049                            L$4:
0049  40                                inc             eax
004A  43                                inc             ebx
004B  4A                                dec             edx
004C                            L$5:
004C  85 D2                             test            edx,edx
004E  75 C0                             jne             L$1
0050  31 C0                             xor             eax,eax
0052                            L$6:
0052  83 C4 04                          add             esp,0x00000004
0055  0F A1                             pop             fs
0057  07                                pop             es
0058  C2 04 00                          ret             0x0004

Routine Size: 91 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes


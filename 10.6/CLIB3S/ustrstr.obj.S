Module: ustrstr
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000090 bytes
0000                            _ustrstr:
0000  53                                push            ebx
0001  56                                push            esi
0002  57                                push            edi
0003  C8 04 00 00                       enter           0x0004,0x00
0007  8B 5D 18                          mov             ebx,dword ptr 0x18[ebp]
000A  66 83 3B 00                       cmp             word ptr [ebx],0x0000
000E  75 08                             jne             L$1
0010  8B 75 14                          mov             esi,dword ptr 0x14[ebp]
0013  E9 71 00 00 00                    jmp             L$5
0018                            L$1:
0018  66 83 7B 02 00                    cmp             word ptr 0x2[ebx],0x0000
001D  75 13                             jne             L$2
001F  0F B7 03                          movzx           eax,word ptr [ebx]
0022  50                                push            eax
0023  FF 75 14                          push            dword ptr 0x14[ebp]
0026  E8 00 00 00 00                    call            _ustrchr
002B  83 C4 08                          add             esp,0x00000008
002E  89 C6                             mov             esi,eax
0030  EB 57                             jmp             L$5
0032                            L$2:
0032  6A FF                             push            0xffffffff
0034  6A 00                             push            0x00000000
0036  FF 75 14                          push            dword ptr 0x14[ebp]
0039  E8 00 00 00 00                    call            __umemchr
003E  83 C4 0C                          add             esp,0x0000000c
0041  53                                push            ebx
0042  89 45 FC                          mov             dword ptr -0x4[ebp],eax
0045  E8 00 00 00 00                    call            _ustrlen
004A  83 C4 04                          add             esp,0x00000004
004D  89 C7                             mov             edi,eax
004F                            L$3:
004F  8B 75 FC                          mov             esi,dword ptr -0x4[ebp]
0052  2B 75 14                          sub             esi,dword ptr 0x14[ebp]
0055  D1 FE                             sar             esi,0x01
0057  39 FE                             cmp             esi,edi
0059  72 2C                             jb              L$4
005B  56                                push            esi
005C  0F B7 03                          movzx           eax,word ptr [ebx]
005F  50                                push            eax
0060  FF 75 14                          push            dword ptr 0x14[ebp]
0063  E8 00 00 00 00                    call            __umemchr
0068  89 C6                             mov             esi,eax
006A  83 C4 0C                          add             esp,0x0000000c
006D  85 C0                             test            eax,eax
006F  74 16                             je              L$4
0071  57                                push            edi
0072  53                                push            ebx
0073  50                                push            eax
0074  E8 00 00 00 00                    call            __umemcmp
0079  83 C4 0C                          add             esp,0x0000000c
007C  85 C0                             test            eax,eax
007E  74 09                             je              L$5
0080  46                                inc             esi
0081  46                                inc             esi
0082  89 75 14                          mov             dword ptr 0x14[ebp],esi
0085  EB C8                             jmp             L$3
0087                            L$4:
0087  31 F6                             xor             esi,esi
0089                            L$5:
0089  89 F0                             mov             eax,esi
008B  C9                                leave
008C  5F                                pop             edi
008D  5E                                pop             esi
008E  5B                                pop             ebx
008F  C3                                ret

Routine Size: 144 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes


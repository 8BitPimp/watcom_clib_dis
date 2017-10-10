Module: nmalloc
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 000000FA bytes
0000                            malloc_:
0000                            _nmalloc_:
0000  53                                push            ebx
0001  51                                push            ecx
0002  52                                push            edx
0003  56                                push            esi
0004  57                                push            edi
0005  06                                push            es
0006  0F A0                             push            fs
0008  0F A8                             push            gs
000A  55                                push            ebp
000B  83 EC 04                          sub             esp,0x00000004
000E  89 C6                             mov             esi,eax
0010  85 C0                             test            eax,eax
0012  74 05                             je              L$1
0014  83 F8 D4                          cmp             eax,0xffffffd4
0017  76 07                             jbe             L$2
0019                            L$1:
0019  31 C0                             xor             eax,eax
001B  E9 CB 00 00 00                    jmp             L$12
0020                            L$2:
0020  BD 00 00 00 00                    mov             ebp,offset ___nheapbeg
0025  8D 7E 03                          lea             edi,0x3[esi]
0028  30 E4                             xor             ah,ah
002A  31 DB                             xor             ebx,ebx
002C  88 24 24                          mov             byte ptr [esp],ah
002F  66 83 E7 FC                       and             di,0xfffc
0033  FF 15 00 00 00 00                 call            dword ptr __AccessNHeap
0039                            L$3:
0039  89 FA                             mov             edx,edi
003B  83 FF 0C                          cmp             edi,0x0000000c
003E  73 05                             jae             L$4
0040  BA 0C 00 00 00                    mov             edx,0x0000000c
0045                            L$4:
0045  3B 15 00 00 00 00                 cmp             edx,dword ptr ___LargestSizeB4MiniHeapRover
004B  76 18                             jbe             L$5
004D  8B 0D 00 00 00 00                 mov             ecx,dword ptr ___MiniHeapRover
0053  85 C9                             test            ecx,ecx
0055  75 51                             jne             L$8
0057  89 0D 00 00 00 00                 mov             dword ptr ___LargestSizeB4MiniHeapRover,ecx
005D  8B 0D 00 00 00 00                 mov             ecx,dword ptr ___nheapbeg
0063  EB 43                             jmp             L$8
0065                            L$5:
0065  31 C0                             xor             eax,eax
0067  8B 0D 00 00 00 00                 mov             ecx,dword ptr ___nheapbeg
006D  A3 00 00 00 00                    mov             dword ptr ___LargestSizeB4MiniHeapRover,eax
0072  EB 34                             jmp             L$8
0074                            L$6:
0074  8C DA                             mov             edx,ds
0076  89 E8                             mov             eax,ebp
0078  89 0D 00 00 00 00                 mov             dword ptr ___MiniHeapRover,ecx
007E  81 E2 FF FF 00 00                 and             edx,0x0000ffff
0084  89 F0                             mov             eax,esi
0086  89 CB                             mov             ebx,ecx
0088  E8 00 00 00 00                    call            __MemAllocator
008D  89 C3                             mov             ebx,eax
008F  85 C0                             test            eax,eax
0091  75 48                             jne             L$11
0093  A1 00 00 00 00                    mov             eax,dword ptr ___LargestSizeB4MiniHeapRover
0098  8B 51 14                          mov             edx,dword ptr 0x14[ecx]
009B  39 C2                             cmp             edx,eax
009D  76 06                             jbe             L$7
009F  89 15 00 00 00 00                 mov             dword ptr ___LargestSizeB4MiniHeapRover,edx
00A5                            L$7:
00A5  8B 49 08                          mov             ecx,dword ptr 0x8[ecx]
00A8                            L$8:
00A8  85 C9                             test            ecx,ecx
00AA  75 C8                             jne             L$6
00AC  80 3C 24 00                       cmp             byte ptr [esp],0x00
00B0  75 0B                             jne             L$9
00B2  89 F0                             mov             eax,esi
00B4  E8 00 00 00 00                    call            __ExpandDGROUP_
00B9  85 C0                             test            eax,eax
00BB  75 15                             jne             L$10
00BD                            L$9:
00BD  89 F0                             mov             eax,esi
00BF  E8 00 00 00 00                    call            __nmemneed_
00C4  85 C0                             test            eax,eax
00C6  74 13                             je              L$11
00C8  30 C9                             xor             cl,cl
00CA  88 0C 24                          mov             byte ptr [esp],cl
00CD  E9 67 FF FF FF                    jmp             L$3
00D2                            L$10:
00D2  C6 04 24 01                       mov             byte ptr [esp],0x01
00D6  E9 5E FF FF FF                    jmp             L$3
00DB                            L$11:
00DB  30 ED                             xor             ch,ch
00DD  88 2D 00 00 00 00                 mov             byte ptr ___nheap_clean,ch
00E3  FF 15 00 00 00 00                 call            dword ptr __ReleaseNHeap
00E9  89 D8                             mov             eax,ebx
00EB                            L$12:
00EB  83 C4 04                          add             esp,0x00000004
00EE  5D                                pop             ebp
00EF  0F A9                             pop             gs
00F1  0F A1                             pop             fs
00F3  07                                pop             es
00F4  5F                                pop             edi
00F5  5E                                pop             esi
00F6  5A                                pop             edx
00F7  59                                pop             ecx
00F8  5B                                pop             ebx
00F9  C3                                ret

Routine Size: 250 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 0000000C bytes
0000                            ___nheapbeg:
0000  00 00 00 00                                     ....
0004                            ___MiniHeapRover:
0004  00 00 00 00                                     ....
0008                            ___LargestSizeB4MiniHeapRover:
0008  00 00 00 00                                     ....

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes


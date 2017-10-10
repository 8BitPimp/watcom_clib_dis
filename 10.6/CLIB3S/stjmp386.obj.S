Module: stjmp386
GROUP: 'DGROUP' _DATA

Segment: _TEXT WORD USE32 000000C6 bytes
0000                            _setjmp:
0000  89 18                             mov             dword ptr [eax],ebx
0002  89 48 04                          mov             dword ptr 0x4[eax],ecx
0005  89 50 08                          mov             dword ptr 0x8[eax],edx
0008  89 70 0C                          mov             dword ptr 0xc[eax],esi
000B  89 78 10                          mov             dword ptr 0x10[eax],edi
000E  89 68 14                          mov             dword ptr 0x14[eax],ebp
0011  8F 40 18                          pop             dword ptr 0x18[eax]
0014  89 60 1C                          mov             dword ptr 0x1c[eax],esp
0017  FF 70 18                          push            dword ptr 0x18[eax]
001A  66 8C 40 20                       mov             word ptr 0x20[eax],es
001E  66 8C 58 22                       mov             word ptr 0x22[eax],ds
0022  66 8C 48 24                       mov             word ptr 0x24[eax],cs
0026  66 8C 60 26                       mov             word ptr 0x26[eax],fs
002A  66 8C 68 28                       mov             word ptr 0x28[eax],gs
002E  66 8C 50 2A                       mov             word ptr 0x2a[eax],ss
0032  64 FF 35 00 00 00 00              push            dword ptr fs:[0x0]
0039  8F 40 2C                          pop             dword ptr 0x2c[eax]
003C  29 C0                             sub             eax,eax
003E  C3                                ret

Routine Size: 63 bytes,    Routine Base: _TEXT + 0000

003F                            longjmp:
003F  58                                pop             eax
0040  5A                                pop             edx
0041  52                                push            edx
0042  50                                push            eax
0043  89 E5                             mov             ebp,esp
0045  50                                push            eax
0046  8B 40 2C                          mov             eax,dword ptr 0x2c[eax]
0049  64 3B 05 00 00 00 00              cmp             eax,dword ptr fs:[0x0]
0050  75 02                             jne             L$1
0052  EB 0D                             jmp             L$2
0054                            L$1:
0054  6A 00                             push            0x00000000
0056  68 61 00 00 00                    push            offset L$2
005B  50                                push            eax
005C  E8 00 00 00 00                    call            _RtlUnwind
0061                            L$2:
0061  89 EC                             mov             esp,ebp
0063  8B 45 00                          mov             eax,dword ptr [ebp]
0066  8B 55 04                          mov             edx,dword ptr 0x4[ebp]
0069  50                                push            eax
006A  52                                push            edx
006B  66 8B 50 2A                       mov             dx,word ptr 0x2a[eax]
006F  8B 40 1C                          mov             eax,dword ptr 0x1c[eax]
0072  FF 15 00 00 00 00                 call            dword ptr __longjmp_handler
0078  5A                                pop             edx
0079  58                                pop             eax
007A  8E 50 2A                          mov             ss,dword ptr 0x2a[eax]
007D  8B 60 1C                          mov             esp,dword ptr 0x1c[eax]
0080  FF 70 18                          push            dword ptr 0x18[eax]
0083  09 D2                             or              edx,edx
0085  75 01                             jne             L$3
0087  42                                inc             edx
0088                            L$3:
0088  52                                push            edx
0089  8B 18                             mov             ebx,dword ptr [eax]
008B  8B 48 04                          mov             ecx,dword ptr 0x4[eax]
008E  8B 70 0C                          mov             esi,dword ptr 0xc[eax]
0091  8B 78 10                          mov             edi,dword ptr 0x10[eax]
0094  8B 68 14                          mov             ebp,dword ptr 0x14[eax]
0097  66 8B 50 20                       mov             dx,word ptr 0x20[eax]
009B  0F 00 E2                          verr            dx
009E  74 02                             je              L$4
00A0  29 D2                             sub             edx,edx
00A2                            L$4:
00A2  8E C2                             mov             es,edx
00A4  66 8B 50 26                       mov             dx,word ptr 0x26[eax]
00A8  0F 00 E2                          verr            dx
00AB  74 02                             je              L$5
00AD  29 D2                             sub             edx,edx
00AF                            L$5:
00AF  8E E2                             mov             fs,edx
00B1  66 8B 50 28                       mov             dx,word ptr 0x28[eax]
00B5  0F 00 E2                          verr            dx
00B8  74 02                             je              L$6
00BA  29 D2                             sub             edx,edx
00BC                            L$6:
00BC  8E EA                             mov             gs,edx
00BE  8B 50 08                          mov             edx,dword ptr 0x8[eax]
00C1  8E 58 22                          mov             ds,dword ptr 0x22[eax]
00C4  58                                pop             eax
00C5  C3                                ret

Routine Size: 135 bytes,    Routine Base: _TEXT + 003F

No disassembly errors

Segment: _DATA WORD USE32 00000000 bytes


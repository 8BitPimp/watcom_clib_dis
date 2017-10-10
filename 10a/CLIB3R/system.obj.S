Module: system
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000068 bytes
0000				system_:
0000  53				push		ebx
0001  51				push		ecx
0002  52				push		edx
0003  55				push		ebp
0004  89 E5				mov		ebp,esp
0006  83 EC 08				sub		esp,0x00000008
0009  89 C2				mov		edx,eax
000B  B8 00 00 00 00			mov		eax,offset DGROUP:L$6
0010  E8 00 00 00 00			call		getenv_
0015  89 C1				mov		ecx,eax
0017  89 C3				mov		ebx,eax
0019  85 D2				test		edx,edx
001B  75 07				jne		L$1
001D  B8 01 00 00 00			mov		eax,0x00000001
0022  EB 3D				jmp		L$5
0024				L$1:
0024  C6 45 FC 01			mov		byte ptr -0x4[ebp],0x01
0028  85 C9				test		ecx,ecx
002A  75 05				jne		L$2
002C  BB 08 00 00 00			mov		ebx,offset DGROUP:L$7
0031				L$2:
0031  6A 00				push		0x00000000
0033  52				push		edx
0034  31 D2				xor		edx,edx
0036  8D 45 F8				lea		eax,-0x8[ebp]
0039  8A 55 FC				mov		dl,byte ptr -0x4[ebp]
003C  E8 00 00 00 00			call		__Slash_C_
0041  8A 55 FC				mov		dl,byte ptr -0x4[ebp]
0044  50				push		eax
0045  84 D2				test		dl,dl
0047  74 07				je		L$3
0049  B8 1C 00 00 00			mov		eax,offset DGROUP:L$8
004E  EB 05				jmp		L$4
0050				L$3:
0050  B8 20 00 00 00			mov		eax,offset DGROUP:L$9
0055				L$4:
0055  50				push		eax
0056  53				push		ebx
0057  6A 00				push		0x00000000
0059  E8 00 00 00 00			call		spawnlp_
005E  83 C4 18				add		esp,0x00000018
0061				L$5:
0061  89 EC				mov		esp,ebp
0063  5D				pop		ebp
0064  5A				pop		edx
0065  59				pop		ecx
0066  5B				pop		ebx
0067  C3				ret		

Routine Size: 104 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000028 bytes
0000				L$6:
0000  43 6F 6D 53 70 65 63 00                         ComSpec.
0008				L$7:
0008  43 4D 44 2E 45 58 45 00 43 4F 4D 4D 41 4E 44 2E CMD.EXE.COMMAND.
0018  43 4F 4D 00                                     COM.
001C				L$8:
001C  43 4D 44 00                                     CMD.
0020				L$9:
0020  43 4F 4D 4D 41 4E 44 00                         COMMAND.

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes


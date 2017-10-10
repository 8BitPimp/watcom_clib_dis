Module: ustrtok
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000096 bytes
0000				_ustrtok:
0000  53				push		ebx
0001  56				push		esi
0002  55				push		ebp
0003  89 E5				mov		ebp,esp
0005  8B 75 10				mov		esi,dword ptr 0x10[ebp]
0008  85 F6				test		esi,esi
000A  75 2D				jne		L$5
000C  FF 15 00 00 00 00			call		dword ptr __GetThreadPtr
0012  8B 70 10				mov		esi,dword ptr 0x10[eax]
0015  85 F6				test		esi,esi
0017  75 20				jne		L$5
0019  E9 72 00 00 00			jmp		L$14
001E				L$1:
001E  8B 5D 14				mov		ebx,dword ptr 0x14[ebp]
0021  EB 07				jmp		L$3
0023				L$2:
0023  66 39 D0				cmp		ax,dx
0026  74 0A				je		L$4
0028  43				inc		ebx
0029  43				inc		ebx
002A				L$3:
002A  66 8B 13				mov		dx,word ptr [ebx]
002D  66 85 D2				test		dx,dx
0030  75 F1				jne		L$2
0032				L$4:
0032  66 85 D2				test		dx,dx
0035  74 0A				je		L$6
0037  46				inc		esi
0038  46				inc		esi
0039				L$5:
0039  66 8B 06				mov		ax,word ptr [esi]
003C  66 85 C0				test		ax,ax
003F  75 DD				jne		L$1
0041				L$6:
0041  66 85 C0				test		ax,ax
0044  75 04				jne		L$7
0046  31 F6				xor		esi,esi
0048  EB 46				jmp		L$14
004A				L$7:
004A  89 F3				mov		ebx,esi
004C  EB 2D				jmp		L$13
004E				L$8:
004E  8B 45 14				mov		eax,dword ptr 0x14[ebp]
0051  EB 07				jmp		L$10
0053				L$9:
0053  66 39 D1				cmp		cx,dx
0056  74 0A				je		L$11
0058  40				inc		eax
0059  40				inc		eax
005A				L$10:
005A  66 8B 10				mov		dx,word ptr [eax]
005D  66 85 D2				test		dx,dx
0060  75 F1				jne		L$9
0062				L$11:
0062  66 85 D2				test		dx,dx
0065  74 12				je		L$12
0067  66 C7 03 00 00			mov		word ptr [ebx],0x0000
006C  43				inc		ebx
006D  43				inc		ebx
006E  FF 15 00 00 00 00			call		dword ptr __GetThreadPtr
0074  89 58 10				mov		dword ptr 0x10[eax],ebx
0077  EB 17				jmp		L$14
0079				L$12:
0079  43				inc		ebx
007A  43				inc		ebx
007B				L$13:
007B  66 8B 0B				mov		cx,word ptr [ebx]
007E  66 85 C9				test		cx,cx
0081  75 CB				jne		L$8
0083  FF 15 00 00 00 00			call		dword ptr __GetThreadPtr
0089  C7 40 10 00 00 00 00		mov		dword ptr 0x10[eax],0x00000000
0090				L$14:
0090  89 F0				mov		eax,esi
0092  5D				pop		ebp
0093  5E				pop		esi
0094  5B				pop		ebx
0095  C3				ret		

Routine Size: 150 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes


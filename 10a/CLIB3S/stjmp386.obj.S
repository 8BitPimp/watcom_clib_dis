Module: stjmp386
GROUP: 'DGROUP' _DATA

Segment: _TEXT WORD USE32 000000BD bytes
0000				_setjmp:
0000  89 18				mov		dword ptr [eax],ebx
0002  89 48 04				mov		dword ptr 0x4[eax],ecx
0005  89 50 08				mov		dword ptr 0x8[eax],edx
0008  89 70 0C				mov		dword ptr 0xc[eax],esi
000B  89 78 10				mov		dword ptr 0x10[eax],edi
000E  89 68 14				mov		dword ptr 0x14[eax],ebp
0011  8F 40 18				pop		dword ptr 0x18[eax]
0014  89 60 1C				mov		dword ptr 0x1c[eax],esp
0017  FF 70 18				push		dword ptr 0x18[eax]
001A  66 8C 40 20			mov		word ptr 0x20[eax],es
001E  66 8C 58 22			mov		word ptr 0x22[eax],ds
0022  66 8C 48 24			mov		word ptr 0x24[eax],cs
0026  66 8C 60 26			mov		word ptr 0x26[eax],fs
002A  66 8C 68 28			mov		word ptr 0x28[eax],gs
002E  66 8C 50 2A			mov		word ptr 0x2a[eax],ss
0032  64 FF 35 00 00 00 00		push		dword ptr fs:[0x0]
0039  8F 40 2C				pop		dword ptr 0x2c[eax]
003C  29 C0				sub		eax,eax
003E  C3				ret		

Routine Size: 63 bytes,    Routine Base: _TEXT + 0000

003F				longjmp:
003F  58				pop		eax
0040  5A				pop		edx
0041  50				push		eax
0042  8B 40 2C				mov		eax,dword ptr 0x2c[eax]
0045  64 3B 05 00 00 00 00		cmp		eax,dword ptr fs:[0x0]
004C  75 02				jne		L$1
004E  EB 0F				jmp		L$2
0050				L$1:
0050  6A 00				push		0x00000000
0052  68 5F 00 00 00			push		offset L$2
0057  8B 00				mov		eax,dword ptr [eax]
0059  50				push		eax
005A  E8 00 00 00 00			call		_RtlUnwind
005F				L$2:
005F  58				pop		eax
0060  50				push		eax
0061  52				push		edx
0062  66 8B 50 2A			mov		dx,word ptr 0x2a[eax]
0066  8B 40 1C				mov		eax,dword ptr 0x1c[eax]
0069  FF 15 00 00 00 00			call		dword ptr __longjmp_handler
006F  5A				pop		edx
0070  58				pop		eax
0071  8E 50 2A				mov		ss,dword ptr 0x2a[eax]
0074  8B 60 1C				mov		esp,dword ptr 0x1c[eax]
0077  FF 70 18				push		dword ptr 0x18[eax]
007A  09 D2				or		edx,edx
007C  75 01				jne		L$3
007E  42				inc		edx
007F				L$3:
007F  52				push		edx
0080  8B 18				mov		ebx,dword ptr [eax]
0082  8B 48 04				mov		ecx,dword ptr 0x4[eax]
0085  8B 70 0C				mov		esi,dword ptr 0xc[eax]
0088  8B 78 10				mov		edi,dword ptr 0x10[eax]
008B  8B 68 14				mov		ebp,dword ptr 0x14[eax]
008E  66 8B 50 20			mov		dx,word ptr 0x20[eax]
0092  0F 00 E2				verr		dx
0095  74 02				je		L$4
0097  29 D2				sub		edx,edx
0099				L$4:
0099  8E C2				mov		es,edx
009B  66 8B 50 26			mov		dx,word ptr 0x26[eax]
009F  0F 00 E2				verr		dx
00A2  74 02				je		L$5
00A4  29 D2				sub		edx,edx
00A6				L$5:
00A6  8E E2				mov		fs,edx
00A8  66 8B 50 28			mov		dx,word ptr 0x28[eax]
00AC  0F 00 E2				verr		dx
00AF  74 02				je		L$6
00B1  29 D2				sub		edx,edx
00B3				L$6:
00B3  8E EA				mov		gs,edx
00B5  8B 50 08				mov		edx,dword ptr 0x8[eax]
00B8  8E 58 22				mov		ds,dword ptr 0x22[eax]
00BB  58				pop		eax
00BC  C3				ret		

Routine Size: 126 bytes,    Routine Base: _TEXT + 003F

No disassembly errors

Segment: _DATA WORD USE32 00000000 bytes


Module: stimewnt
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 000000D6 bytes
0000				_dos_settime:
0000  53				push		ebx
0001  56				push		esi
0002  57				push		edi
0003  55				push		ebp
0004  83 EC 24				sub		esp,0x00000024
0007  8B 5C 24 38			mov		ebx,dword ptr 0x38[esp]
000B  8D 44 24 20			lea		eax,0x20[esp]
000F  50				push		eax
0010  6A 28				push		0x00000028
0012  E8 00 00 00 00			call		_GetCurrentProcess
0017  50				push		eax
0018  E8 00 00 00 00			call		_OpenProcessToken
001D  85 C0				test		eax,eax
001F  75 0A				jne		L$1
0021  E8 00 00 00 00			call		__set_errno_nt
0026  E9 A3 00 00 00			jmp		L$4
002B				L$1:
002B  8D 44 24 14			lea		eax,0x14[esp]
002F  50				push		eax
0030  68 00 00 00 00			push		offset DGROUP:L$5
0035  6A 00				push		0x00000000
0037  E8 00 00 00 00			call		_LookupPrivilegeValueA
003C  6A 00				push		0x00000000
003E  6A 00				push		0x00000000
0040  6A 00				push		0x00000000
0042  8D 44 24 1C			lea		eax,0x1c[esp]
0046  50				push		eax
0047  BA 01 00 00 00			mov		edx,0x00000001
004C  6A 00				push		0x00000000
004E  8B 74 24 34			mov		esi,dword ptr 0x34[esp]
0052  B9 02 00 00 00			mov		ecx,0x00000002
0057  56				push		esi
0058  89 54 24 28			mov		dword ptr 0x28[esp],edx
005C  89 4C 24 34			mov		dword ptr 0x34[esp],ecx
0060  E8 00 00 00 00			call		_AdjustTokenPrivileges
0065  89 E0				mov		eax,esp
0067  50				push		eax
0068  E8 00 00 00 00			call		_GetLocalTime
006D  8A 03				mov		al,byte ptr [ebx]
006F  30 E4				xor		ah,ah
0071  66 89 44 24 08			mov		word ptr 0x8[esp],ax
0076  8A 43 01				mov		al,byte ptr 0x1[ebx]
0079  66 89 44 24 0A			mov		word ptr 0xa[esp],ax
007E  8A 43 02				mov		al,byte ptr 0x2[ebx]
0081  31 D2				xor		edx,edx
0083  66 89 44 24 0C			mov		word ptr 0xc[esp],ax
0088  8A 53 03				mov		dl,byte ptr 0x3[ebx]
008B  BB 0A 00 00 00			mov		ebx,0x0000000a
0090  89 D0				mov		eax,edx
0092  C1 FA 1F				sar		edx,0x1f
0095  F7 FB				idiv		ebx
0097  66 89 44 24 0E			mov		word ptr 0xe[esp],ax
009C  89 E0				mov		eax,esp
009E  50				push		eax
009F  E8 00 00 00 00			call		_SetLocalTime
00A4  85 C0				test		eax,eax
00A6  74 04				je		L$2
00A8  31 DB				xor		ebx,ebx
00AA  EB 07				jmp		L$3
00AC				L$2:
00AC  E8 00 00 00 00			call		__set_errno_nt
00B1  89 C3				mov		ebx,eax
00B3				L$3:
00B3  31 FF				xor		edi,edi
00B5  57				push		edi
00B6  57				push		edi
00B7  57				push		edi
00B8  8D 44 24 1C			lea		eax,0x1c[esp]
00BC  50				push		eax
00BD  57				push		edi
00BE  8B 6C 24 34			mov		ebp,dword ptr 0x34[esp]
00C2  55				push		ebp
00C3  89 7C 24 34			mov		dword ptr 0x34[esp],edi
00C7  E8 00 00 00 00			call		_AdjustTokenPrivileges
00CC  89 D8				mov		eax,ebx
00CE				L$4:
00CE  83 C4 24				add		esp,0x00000024
00D1  5D				pop		ebp
00D2  5F				pop		edi
00D3  5E				pop		esi
00D4  5B				pop		ebx
00D5  C3				ret		

Routine Size: 214 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000016 bytes
0000				L$5:
0000  53 65 53 79 73 74 65 6D 74 69 6D 65 50 72 69 76 SeSystemtimePriv
0010  69 6C 65 67 65 00                               ilege.

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes


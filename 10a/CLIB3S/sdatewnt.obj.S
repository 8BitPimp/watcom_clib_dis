Module: sdatewnt
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 000000CA bytes
0000				_dos_setdate:
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
0026  E9 97 00 00 00			jmp		L$4
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
0071  66 89 44 24 06			mov		word ptr 0x6[esp],ax
0076  8A 43 01				mov		al,byte ptr 0x1[ebx]
0079  66 89 44 24 02			mov		word ptr 0x2[esp],ax
007E  66 8B 43 02			mov		ax,word ptr 0x2[ebx]
0082  66 89 04 24			mov		word ptr [esp],ax
0086  8A 43 04				mov		al,byte ptr 0x4[ebx]
0089  30 E4				xor		ah,ah
008B  66 89 44 24 04			mov		word ptr 0x4[esp],ax
0090  89 E0				mov		eax,esp
0092  50				push		eax
0093  E8 00 00 00 00			call		_SetLocalTime
0098  85 C0				test		eax,eax
009A  74 04				je		L$2
009C  31 DB				xor		ebx,ebx
009E  EB 07				jmp		L$3
00A0				L$2:
00A0  E8 00 00 00 00			call		__set_errno_nt
00A5  89 C3				mov		ebx,eax
00A7				L$3:
00A7  31 FF				xor		edi,edi
00A9  57				push		edi
00AA  57				push		edi
00AB  57				push		edi
00AC  8D 44 24 1C			lea		eax,0x1c[esp]
00B0  50				push		eax
00B1  57				push		edi
00B2  8B 6C 24 34			mov		ebp,dword ptr 0x34[esp]
00B6  55				push		ebp
00B7  89 7C 24 34			mov		dword ptr 0x34[esp],edi
00BB  E8 00 00 00 00			call		_AdjustTokenPrivileges
00C0  89 D8				mov		eax,ebx
00C2				L$4:
00C2  83 C4 24				add		esp,0x00000024
00C5  5D				pop		ebp
00C6  5F				pop		edi
00C7  5E				pop		esi
00C8  5B				pop		ebx
00C9  C3				ret		

Routine Size: 202 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000016 bytes
0000				L$5:
0000  53 65 53 79 73 74 65 6D 74 69 6D 65 50 72 69 76 SeSystemtimePriv
0010  69 6C 65 67 65 00                               ilege.

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes


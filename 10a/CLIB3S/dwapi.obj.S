Module: dwapi
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 000000C1 bytes
0000				_dwDeleteOnClose:
0000  53				push		ebx
0001  83 3D 00 00 00 00 00		cmp		dword ptr _WindowsDestroyOnClose,0x00000000
0008  74 1E				je		L$1
000A  8B 5C 24 08			mov		ebx,dword ptr 0x8[esp]
000E  53				push		ebx
000F  FF 15 00 00 00 00			call		dword ptr _WindowsIsWindowedHandle
0015  83 C4 04				add		esp,0x00000004
0018  85 C0				test		eax,eax
001A  74 0C				je		L$1
001C  50				push		eax
001D  FF 15 00 00 00 00			call		dword ptr _WindowsDestroyOnClose
0023  83 C4 04				add		esp,0x00000004
0026  5B				pop		ebx
0027  C3				ret		
0028				L$1:
0028  31 C0				xor		eax,eax
002A  5B				pop		ebx
002B  C3				ret		

Routine Size: 44 bytes,    Routine Base: _TEXT + 0000

002C				_dwSetAboutDlg:
002C  53				push		ebx
002D  83 3D 00 00 00 00 00		cmp		dword ptr _WindowsSetAbout,0x00000000
0034  74 15				je		L$2
0036  8B 5C 24 0C			mov		ebx,dword ptr 0xc[esp]
003A  53				push		ebx
003B  8B 4C 24 0C			mov		ecx,dword ptr 0xc[esp]
003F  51				push		ecx
0040  FF 15 00 00 00 00			call		dword ptr _WindowsSetAbout
0046  83 C4 08				add		esp,0x00000008
0049  5B				pop		ebx
004A  C3				ret		
004B				L$2:
004B  31 C0				xor		eax,eax
004D  5B				pop		ebx
004E  C3				ret		

Routine Size: 35 bytes,    Routine Base: _TEXT + 002C

004F				_dwSetAppTitle:
004F  53				push		ebx
0050  83 3D 00 00 00 00 00		cmp		dword ptr _WindowsSetAppTitle,0x00000000
0057  74 10				je		L$3
0059  8B 5C 24 08			mov		ebx,dword ptr 0x8[esp]
005D  53				push		ebx
005E  FF 15 00 00 00 00			call		dword ptr _WindowsSetAppTitle
0064  83 C4 04				add		esp,0x00000004
0067  5B				pop		ebx
0068  C3				ret		
0069				L$3:
0069  31 C0				xor		eax,eax
006B  5B				pop		ebx
006C  C3				ret		

Routine Size: 30 bytes,    Routine Base: _TEXT + 004F

006D				_dwSetConTitle:
006D  53				push		ebx
006E  83 3D 00 00 00 00 00		cmp		dword ptr _WindowsSetAppTitle,0x00000000
0075  74 23				je		L$4
0077  8B 5C 24 08			mov		ebx,dword ptr 0x8[esp]
007B  53				push		ebx
007C  FF 15 00 00 00 00			call		dword ptr _WindowsIsWindowedHandle
0082  83 C4 04				add		esp,0x00000004
0085  85 C0				test		eax,eax
0087  74 11				je		L$4
0089  8B 4C 24 0C			mov		ecx,dword ptr 0xc[esp]
008D  51				push		ecx
008E  50				push		eax
008F  FF 15 00 00 00 00			call		dword ptr _WindowsSetConTitle
0095  83 C4 08				add		esp,0x00000008
0098  5B				pop		ebx
0099  C3				ret		
009A				L$4:
009A  31 C0				xor		eax,eax
009C  5B				pop		ebx
009D  C3				ret		

Routine Size: 49 bytes,    Routine Base: _TEXT + 006D

009E				_dwYield:
009E  83 3D 00 00 00 00 00		cmp		dword ptr _WindowsYieldControl,0x00000000
00A5  74 07				je		L$5
00A7  FF 15 00 00 00 00			call		dword ptr _WindowsYieldControl
00AD  C3				ret		
00AE				L$5:
00AE  31 C0				xor		eax,eax
00B0  C3				ret		

Routine Size: 19 bytes,    Routine Base: _TEXT + 009E

00B1				_dwShutDown:
00B1  83 3D 00 00 00 00 00		cmp		dword ptr _WindowsShutDown,0x00000000
00B8  74 F4				je		L$5
00BA  FF 15 00 00 00 00			call		dword ptr _WindowsShutDown
00C0  C3				ret		

Routine Size: 16 bytes,    Routine Base: _TEXT + 00B1

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes


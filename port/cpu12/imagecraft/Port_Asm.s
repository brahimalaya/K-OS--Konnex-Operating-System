;
;  k_os (Konnex Operating-System based on the OSEK/VDX-Standard).
;
;  (C) 2007-2010 by Christoph Schueler <chris@konnex-tools.de,
;                                      cpu12.gems@googlemail.com>
;
;  All Rights Reserved
;
;  This program is free software; you can redistribute it and/or modify
;  it under the terms of the GNU General Public License as published by
;  the Free Software Foundation; version 2 of the License.
;
;  This program is distributed in the hope that it will be useful,
;  but WITHOUT ANY WARRANTY; without even the implied warranty of
;  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;  GNU General Public License for more details.
;
;  You should have received a copy of the GNU General Public License
;  along with this program; if not, write to the Free Software
;  Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA 
;
;  s. FLOSS-EXCEPTION.txt
;

	.module Port_Asm.s
	.area text
	
_SetJump::
	tfr		d,y
    movw    0,sp,2,y+
    sts     0,y
    ldd     #0x0000
	rts
	
_LongJump::
; D -> Pointer to Context.
; 2,sp -> Value.
	tfr		d,y
	ldd		2,sp
    lds     2,y ; SP
    ldx     0,y ; PC
    tbne    d,__ljexit
    inx 
__ljexit:    
    jmp     [0,x]
	rts

_CPU_INTERRUPTS_DISABLED::
	tfr   ccr,b
	andb  #$10
	rts

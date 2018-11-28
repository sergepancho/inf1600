.data
        factor: .float 2.0 /* use this to multiply by two */

.text
.globl _ZNK7CCircle12PerimeterAsmEv

_ZNK7CCircle12PerimeterAsmEv:
        push %ebp      /* save old base pointer */
        mov %esp, %ebp /* set ebp to current esp */
/*
mov 8(%ebp),%edi
lea 4(%edi),%eax
fld factor
fld (%eax)

fmulp
fldpi
fmulp
fstp (%eax)*/
/*mov (%esi),%eax*/
        /* Write your solution here */
        
        leave          /* restore ebp and esp */
        ret            /* return to the caller */

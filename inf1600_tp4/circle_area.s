.globl _ZNK7CCircle7AreaAsmEv

_ZNK7CCircle7AreaAsmEv:
        push %ebp      /* save old base pointer */
        mov %esp, %ebp /* set ebp to current esp */
        
        /* Write your solution here */
        
mov 8(%ebp),%edi
lea 4(%edi),%eax
fld (%eax)
fld (%eax)
fmulp
fldpi
fmulp

/*mov (%esi),%eax*/

mov $0,%eax
        leave          /* restore ebp and esp */
        ret            /* return to the caller */

.data
        factor: .float 2.0 /* use this to multiply by two */

.text
.globl _ZNK7CCircle12PerimeterAsmEv

_ZNK7CCircle12PerimeterAsmEv:
        push %ebp      /* save old base pointer */
        mov %esp, %ebp /* set ebp to current esp */

        mov 8(%ebp), %edi /*sauvegarde de this*/
        lea 4(%edi), %eax /*sauvegarde de l'adresse de raduis*/
        fld factor /*mise sur la pile de la valeur de raduis pour la multiplication st[0] */
        fld (%eax) /*raduis dans st[1]*/
        fmulp /*multiplie st[0] et st[1]*/
        fldpi /*ajout de pi sur la pile*/
        fmulp /* multiplie pi * raduis * raduis */
        leave          /* restore ebp and esp */
        ret           /* return to the caller */

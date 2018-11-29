.data
        factor: .float 2.0 /* use this to multiply by two */

.text

.globl	_ZNK9CTriangle9HeightAsmEv

_ZNK9CTriangle9HeightAsmEv:
        push %ebp      /* save old base pointer */
        mov %esp, %ebp /* set ebp to current esp */
        
        addl $-4, %esp /*espace pour la variable local A*/
        mov 8(%ebp), %edi /*sauvegarde de this*/
        lea 4(%edi), %eax /*sauvegarde de l'adresse du tableau mSide*/
        push %edi /*sauvegarde this dans la pile*/
        mov (%edi), %edi /*vtable adresse*/
        call *20(%edi) /*appel de la methode */

        fld 8(%eax) /*met mside[2] sur la pile de float*/
        fdivrp /* st[1] / st[0] ou (A / mside[2]) */

        fld factor /*met 2 sur la pile de float*/
        fmulp /* (2.0 * A / mside[2])*/

        add $4, %eax /*depile la variable local*/
        
        leave          /* restore ebp and esp */
        ret            /* return to the caller */

.globl _ZNK9CTriangle12PerimeterAsmEv

_ZNK9CTriangle12PerimeterAsmEv:
        push %ebp      /* save old base pointer */
        mov %esp, %ebp /* set ebp to current esp */
        
        /* Write your solution here */
        mov 8(%ebp), %edi /*sauvegarde de this*/
        lea 4(%edi), %eax /*sauvegarde de l'adresse du tableau mSide*/
        fld (%eax) /*mise sur la pile de la valeur de mSide[0] */
        fld 4(%eax) /*mise sur la pile de la valeur de mSide[1] */
        faddp /*addition mSide[0] et mSide[1]*/
        fld 8(%eax) /*ajout de pi sur la pile*/
        faddp /* addition mSide[1] + mSide[0] + mSide[2] */
        
        leave          /* restore ebp and esp */
        ret            /* return to the caller */

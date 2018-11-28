.globl _ZNK9CTriangle12PerimeterAsmEv

_ZNK9CTriangle12PerimeterAsmEv:
        push %ebp      /* save old base pointer */
        mov %esp, %ebp /* set ebp to current esp */
        
        /* Write your solution here */
        mov 8(%ebp), %edi /*sauvegarde de this*/
        lea 4(%edi), %eax /*sauvegarde de l'adresse de raduis*/
        fld (%eax) /*mise sur la pile de la valeur de raduis pour la multiplication st[0] */
        fld 4(%eax) /*raduis dans st[1]*/
        faddp /*multiplie st[0] et st[1]*/
        fld 8(%eax) /*ajout de pi sur la pile*/
        faddp /* multiplie pi * raduis * raduis */
        
        leave          /* restore ebp and esp */
        ret            /* return to the caller */

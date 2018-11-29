.data
        factor: .float 2.0 /* use this to multiply by two */

.text

.globl _ZNK9CTriangle7AreaAsmEv

_ZNK9CTriangle7AreaAsmEv:
        push %ebp      /* save old base pointer */
        mov %esp, %ebp /* set ebp to current esp */
        
        addl $-8, %esp /*espace pour la variable local p et espace qu'on va utiliser pour les calculs*/
        mov 8(%ebp), %edi /*sauvegarde de this*/
        lea 4(%edi), %eax /*sauvegarde de l'adresse du tableau mSide*/
        push %edi /*sauvegarde this dans la pile*/
        mov (%edi), %edi /*vtable adresse*/
        fld factor /*mise sur la pile de 2 qui ira apres l'appel de perimetre en st[1] */
        call *12(%edi) /*appel de la methode */
        fdivp /*divise st[0] et st[1]*/
        fstp -4(%ebp) /*met le resulat de la division dans p*/


        fld -4(%ebp) /*remet p sur la pile de float*/
        fld (%eax) /*met msides[0] sur la pile de float*/
        fsubrp /*fait (p - msides[0]) ou (st[1] - st[0])*/
        fstp -8(%ebp)


        fld -4(%ebp) /*remet p sur la pile de float*/
        fld 4(%eax) /*met msides[1] sur la pile de float*/
        fsubrp /*fait (p - msides[1]) ou (st[1] - st[0])*/
        fld -8(%ebp) /*remet le resultat de (p - msides[0]) sur la pile de float*/
        fmulp /* (p - msides[0])*(p - msides[1]) */
        fstp -8(%ebp)

        fld -4(%ebp) /*remet p sur la pile de float*/
        fld 8(%eax) /*met msides[2] sur la pile de float*/
        fsubrp /*fait (p - msides[2]) ou (st[1] - st[0])*/
        fld -8(%ebp) /*remet le resultat de (p - msides[0]) sur la pile de float*/
        fmulp /* (p - msides[0])*(p - msides[1])* (p - msides[2]) */
        
        fld -4(%ebp) /*remet p sur la pile de float*/
        fmulp /* p*(p - msides[0])*(p - msides[1])* (p - msides[2]) */

        fsqrt /*renvoie la racine du resultat precedent*/
        
        addl $8, %esp
        leave          /* restore ebp and esp */
        ret            /* return to the caller */

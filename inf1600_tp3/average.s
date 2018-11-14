.global matrix_row_aver_asm

matrix_row_aver_asm:
    push %ebp      			/* Save old base pointer */
    mov %esp, %ebp 			/* Set ebp to current esp */

    /* Write your solution here */
    push %ebx
    sub $12, %esp /* espace pour les variables local r, c , i, elem */
    
    FOR:
    movl $0, -4(%ebp) /* initialise r a zero*/
    movl $0, -8(%ebp) /* initialise c a zero*/
    movl $0, (%esp) /* initialise elem a zero*/
    movl 16(%ebp), %ecx /*transfert la valeur matorder dans ecx*/
            FOR_TEST_R:
            cmp %ecx, -4(%ebp) /* il compare r avec matorder */
            jge END_FOR_TEST_R /* sort de la boucle si r >= matorder*/
            movl $0, (%esp) /* initialise elem a zero*/
            movl $0, -8(%ebp) /* reinitialise c pour la boucle*/
                    FOR_TEST_C:
                    cmp %ecx, -8(%ebp) /* il compare matorder avec c  */
                    jge END_FOR_TEST_C /* sort de la boucle si c >= matorder*/
                                                            
                    /* calcul des valeurs a linterieur du tableau out */

                    movl -4(%ebp), %eax  /* met r dans eax*/
                    mul %ecx  /*r * matorder*/
                    add -8(%ebp),%eax  /* c + r * matorder */
                    mov %eax, %edi /* sauvegarde du calcul de c + r * matorder*/
                    mov 8(%ebp), %esi	/*adresse du tableau inmatdata*/
                    mov (%esi, %edi, 4), %esi   /* inmatdata[c + r * matorder]*/
                    add %esi, (%esp) /*incremente elem avec le resultat precedent*/


                            FOR_TEST_I:
                            cmp %ecx, -16(%ebp) /* il compare matorder avec i  */
                            jge END_FOR_TEST_I /* sort de la boucle si i >= matorder*/

                            movl -8(%ebp), %eax  /* met r dans eax*/
                            mul %ecx  /*r * matorder*/
                            add -16(%ebp),%eax  /* i + r * matorder */
                            mov %eax, %edi /* sauvegarde du calcul de i + r * matorder*/

                            movl -16(%ebp), %eax  /* met i dans eax*/
                            mul %ecx  /*i * matorder*/
                            add -12(%ebp),%eax  /* c + i * matorder */
                            mov %eax, %esi /* sauvegarde du calcul de c + i * matorder*/
                            
                            /* dereference des  tableaux inmatdata*/
                            mov 8(%ebp), %ebx	/*adresse du tableau in 1*/
                            mov 12(%ebp), %edx	/*adresse du tableau in 2*/
                            mov (%ebx, %edi, 4), %ebx   /* inmatdata1[i + r * matorder]*/
                            mov (%edx, %esi, 4), %edx   /* inmatdata2[c + i * matorder]*/
                            /* calcul de la nouvelle valeur de elem */

                            mov %ebx, %eax /* sauvegarde la valeur du tableau inmatdata1 */ 
                            mul %edx /* multiplie les valeurs des deux tableaux */
                            add %eax, (%esp) /*incremente elem avec le resultat precedent*/

                            add $1,-16(%ebp)  /* incremente i */
                            jmp FOR_TEST_I
                            END_FOR_TEST_I:

                    movl -8(%ebp), %eax  /* met r dans eax*/
                    mul %ecx  /*r * matorder*/
                    add -12(%ebp),%eax  /* c + r * matorder */
                    mov %eax, %edi /* sauvegarde du calcul de c + r * matorder*/
                    mov 16(%ebp), %ebx	/*adresse du tableau out*/
                    lea (%ebx, %edi, 4), %ebx   /* outmatdata[i + r * matorder]*/
                    mov (%esp), %eax  /*sauvegarde elem dans eax*/
                    mov %eax, (%ebx) /* transfert elem a la bonne position dans le tableau*/

                    add $1,-12(%ebp)  /* incremente c */
                    jmp FOR_TEST_C
                    END_FOR_TEST_C:

    add $1,-8(%ebp)  /* incremente r */
    jmp FOR_TEST_R
    END_FOR_TEST_R:
    
    leave          			/* Restore ebp and esp */
    ret           			/* Return to the caller */
		

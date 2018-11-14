.global matrix_row_aver_asm

matrix_row_aver_asm:
        push %ebp      			/* Save old base pointer */
        mov %esp, %ebp 			/* Set ebp to current esp */

        /* Write your solution here */
        push %ebx
        sub $12, %esp /* espace pour les variables local r, c , elem */
        
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
                                                                
                        movl -4(%ebp), %eax  /* met r dans eax*/
                        mul %ecx  /*r * matorder*/
                        add -8(%ebp),%eax  /* c + r * matorder */
                        mov %eax, %edi /* sauvegarde du calcul de c + r * matorder*/
                        mov 8(%ebp), %esi	/*adresse du tableau inmatdata*/
                        mov (%esi, %edi, 4), %esi   /* inmatdata[c + r * matorder]*/
                        add %esi, (%esp) /*incremente elem avec le resultat precedent*/

                        movl $1, -8(%ebp)  /* incremente c */
                        jmp FOR_TEST_C
                        END_FOR_TEST_C:

                mov (%esp) , %eax  /* met elem dans eax*/
                div %ecx /* elem/matorder*/
                mov -4(%ebp) , %edi
                mov 12(%ebp), %edx	/*adresse du tableau out*/
                mov %eax , (%edx, %edi, 4)  /* outmatdata[r] = elem/matorder */

                movl $1, -4(%ebp)  /* incremente r */
                jmp FOR_TEST_R
                END_FOR_TEST_R:
    
    leave          			/* Restore ebp and esp */
    ret           			/* Return to the caller */
		

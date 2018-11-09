.globl matrix_equals_asm

matrix_equals_asm:
        push %ebp      /* Save old base pointer */
        mov %esp, %ebp /* Set ebp to current esp */
        /* Write your solution here */
        sub $8, %esp /* espace pour les variables local r, c */
        
        
		
        FOR:
        movl $0, -4(%ebp) /* initialise r a zero*/
        movl $0, -8(%ebp) /* initialise c a zero*/
        mov 16(%ebp), %ecx /*transfert la valeur matorder dans ecx*/
        
        BOUCLE1:
			TESTR:
			cmp %ecx, -4(%ebp) /* il compare r avec matorder */
			jge ENDBOUCLE1 /* sort de la boucle si matorder <= r */
			
			BOUCLE2:
				TESTC:
				mov -8(%ebp), %edx  /* il sauvegarde c dans edx*/
				cmp %ecx, -8(%ebp) /* il compare matorder avec c  */
				jge ENDBOUCLE2 /* sort de la boucle si matorder <= c */
				
					IF:
										
					/* calcul des valeurs a linterieur du tableau */
					mov -4(%ebp), %eax  /* met r dans eax*/
					mul %ecx  /*r * matorder*/
					add -8(%ebp),%eax  /*c + r * matorder*/
					mov %eax, %edi /* sauvegarde du calcul de c + r * matorder*/
					
					/* dereference les tableaux */
					mov 8(%ebp), %eax /*adresse des tableau*/
					mov 12(%ebp), %esi	/*adresse des tableau*/
					
					mov (%eax, %edi, 4), %eax  /*inmatdata2[c + r * matorder]*/
					mov (%esi, %edi, 4), %esi
					
					/* fais la comparaison */
					add $1, -8(%ebp)  /* incremente c juste avant la comparaison */

					cmp %esi,%eax  /* compare legalite*/
					je TESTC	/* on retourne faire le test si cest egale */
					
					mov $0, %eax /*retourne 0*/
					jmp ENDFONCTION
				
				
				jmp TESTC /* revient sur testc */
			ENDBOUCLE2: 
			
			add $1, -4(%ebp)	/* incremente r */
			jmp TESTR
        
        ENDBOUCLE1:
			mov $1, %eax /*retourne 1*/
        ENDFONCTION:
        
        leave          /* Restore ebp and esp */
        ret            /* Return to the caller */

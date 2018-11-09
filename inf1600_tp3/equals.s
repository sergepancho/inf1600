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
				cmp %ecx, -8(%ebp) /* il compare c avec matorder */
				jge ENDBOUCLE2 /* sort de la boucle si matorder <= c */
				
				IF:
				/*r * matorder*/
				/*c + r * matorder*/
				/*inmatdata1[c + r * matorder]*/
				/*inmatdata2[c + r * matorder]*/
				/*compare legalite*/
				je  /* sort si cest egale*/
				add $1, -8(%ebp)  /* incremente c */
				jump TESTC /* revient sur testc */
			ENDBOUCLE2: 
			
		add $1, -4(%ebp)	/* incremente r */
		jump TESTR
        
        ENDBOUCLE1:
        
        leave          /* Restore ebp and esp */
        ret            /* Return to the caller */

.globl matrix_transpose_asm

matrix_transpose_asm:
        push %ebp      /* save old base pointer */
        mov %esp, %ebp /* set ebp to current esp */
        
        /* Write your solution here */
        
         sub $8, %esp /* espace pour les variables local r, c */
        
        
		
        FOR:
        
        movl $0, -4(%ebp) /* initialise r a zero*/
        movl $0, -8(%ebp) /* initialise c a zero*/
        movl 16(%ebp), %ecx /*transfert la valeur matorder dans ecx*/
        mov -8(%ebp), %edx
        BOUCLE1:
			TESTR:
			cmp %ecx, -4(%ebp) /* il compare r avec matorder */
			jge ENDBOUCLE1 /* sort de la boucle si matorder <= r */
			
			BOUCLE2:
				TESTC:
				 /*  il sauvegarde c dans edx*/
				cmp %ecx, -8(%ebp) /* il compare matorder avec c  */
				jge ENDBOUCLE2 /* sort de la boucle si matorder <= c */
				
					IF:
										
					/* calcul des valeurs a linterieur du tableau out */
					mov -4(%ebp), %eax  /* met r dans eax*/
					mul %ecx  /*r * matorder*/
					add -8(%ebp),%eax  /*c + r * matorder*/
					mov %eax, %edi /* sauvegarde du calcul de c + r * matorder*/
					
					/* dereference du  tableaux outmatdata*/
					
					mov 12(%ebp), %esi	/*adresse des tableau out*/
					
					
					lea (%esi, %edi, 4), %esi   /*adresse outmatdata2[c + r * matorder]*/
					
               /*                 determination du tableau     inmatdata[r+c*matdata]          */


                                          /* calcul des valeurs a linterieur du tableau in */
					mov -8(%ebp), %eax  /* met c dans eax*/
					mul %ecx  /*c * matorder*/
					add -4(%ebp),%eax  /*r + c * matorder*/
					mov %eax, %edi /* sauvegarde du calcul de r + c * matorder*/
					

                                        /* dereference du  tableaux inmatdata*/
                                        mov 8(%ebp), %eax /*adresse du tableau in*/





                                        mov (%eax, %edi, 4), %eax  /* inmatdata[r+c*matdata] */ 
/*inmatdata2[r + c * matorder]*/        
                                        mov %eax,(%esi)  /* *esi =eax  */
					
					add $1,-8(%ebp)  /* incremente c */
										
				        jmp TESTC /* revient sur testc */
			ENDBOUCLE2: 
			
			add $1, -4(%ebp)	/* incremente r */
			jmp TESTR
        
        ENDBOUCLE1:
			
        ENDFONCTION:
        
        leave          /* Restore ebp and esp */
        ret            /* Return to the caller */

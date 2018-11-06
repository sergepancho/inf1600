	.data
	/* Votre programme assembleur ici... */

	i: .int 0  
	

.global func_s

func_s:	
	/* Votre programme assembleur ici... */
	/*initialisation des registres a zero */
	


    jmp test_au_debut
    
    boucle:
	/*a=d+e-b*/
	mov d, %edx
	mov e, %eax
	mov b, %ebx
	mov $0,%ecx
	mov $0,%esi
	mov $0,%edi
	
	add %eax, %edi /*edi=e*/
	add %edx, %edi /*edi=e+d*/
	sub %ebx, %edi /*edi=e+d-b*/
	mov %edi, a
    
	if: 
	mov b,%edi
	mov c,%ecx
	sub $1000, %edi
	add $500, %ecx
	cmp %edi, %ecx
	jle else /*jna ecx -edi <=0 il jumpe a else sinonil execute le ventre de if*/
	add $1, i  /*pour que i soit a jour pour l instruction suivante*/
	sub $1000, %ecx
	mov %ecx, c
	
	
	/*compare b et la nouvelle valeur c(c+500) avant de sauter a la prochaine instruction 2eme if*/
	mov b,%ebx
    
	cmp %ebx, %ecx
	jge test_au_debut /*c-b>=0 jae est inutilisable ici on va au test de la boucle*/
	
	sub $500, %ebx
	mov %ebx, b
	
	jmp test_au_debut
	else:
	/*b=b-e et d=d+500*/
	mov b, %ebx
	mov e, %eax
	mov d, %edx
	sub %eax, %ebx
	mov %ebx, b
	add $500, %edx
	mov %edx, d

    add $1, i
    /*jmp test_au_debut*/
    test_au_debut:
	cmp $10, i
	jle boucle /*jna possible*/

	ret



.global func_s

func_s:
	/* Votre programme assembleur ici... */
    flds b
    flds d
    fmulp
    flds c
    fsubrp
    fstps a
    flds f
    flds g
    fsubrp
    flds a
    fdivp
    flds e
    faddp
    fstps a
    flds g
    flds e
    fsubrp
    flds f
    fdivrp
    flds a
    fmulp
    fstps a
    
	ret


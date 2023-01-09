9990 LET L = 110
9991 FOR N = 16515 TO 32700
# (assumes 1K. Change to '16515 TO 32700' for 16K)
9993 IF PEEK N <> 118 THEN GOTO 9999
9994 IF PEEK (N+1) > 38 THEN STOP
#9995 PRINT 256 * PEEK (N+1) + PEEK (N+2); \
#       " ->";
# (space, minus, greater than)
#9996 PRINT L
9995 POKE N+1, INT (L / 256)
9996 POKE N+2, L - 256 * INT (L / 256)
9997 LET N = N + 3 + PEEK (N+3) + \
       256 * PEEK (N+4)
9998 LET L = L + 10
9999 NEXT N

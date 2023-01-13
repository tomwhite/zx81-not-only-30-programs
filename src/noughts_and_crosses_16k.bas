# tw: a 16K version with an alteration on line 430
# tw: we have room to store the variables too
1 LET X = 1
2 LET Y = 2
3 LET Z = 4
4 LET B = 8
5 LET S = 100 
50  PAUSE S*Z
60  CLS
70  LET A$="1\:: 2\:: 38\:: X\:: 47\:: 6\:: 5"
# (graphics 8 followed by space)
80  FOR I=X TO X+Y
90  PRINT A$(TO B-X)
100 IF I<=Y THEN PRINT "\..\.:\..\..\.:\..\.."
# (graphics 6,Q,6,6,Q,66)
110 LET A$=A$(B TO )
120 NEXT I
130 FOR T=X TO Z
140 PRINT AT B,X;"YOUR TURN"
150 LET V=52
160 INPUT R
170 GOSUB 420
180 PRINT AT B,X;"MY TURN  "
190 IF T>X THEN GOTO 230
200 LET E=R=Y*INT(R/Y)
210 LET P=R
220 LET A=P-P
230 LET V=61
240 LET A=A+X
250 IF T=X OR P=R+Z OR P=R-Z THEN GOTO 300
260 LET P=P+Z
270 GOSUB S*Z
280 PRINT "I WON"
290 GOTO X
300 IF A=X+Y AND E THEN LET A=B-X
310 IF A=Z THEN LET A=Z+Y
320 LET P=P+A
330 GOSUB S*Z
340 IF A=B-X THEN GOTO 280
350 NEXT T
360 PRINT "DRAW"
370 GOTO X
400 IF P>B THEN LET P=P-B
410 LET R=P
420 LET D=PEEK 16396+256*PEEK 16397
# tw: replace Z with 32 in next line for 16K ZX81 since display file is not collapsed
# tw: this works, but is slow since it has to scan a lot more memory
430 FOR I=X TO 32*B+B
440 IF PEEK(D+I)=R+28 THEN POKE D+I,V
450 NEXT I
460 RETURN
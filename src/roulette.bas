100 LET M=100
105 PAUSE 100
108 CLS
110 LET C=2
115 PRINT "HIGH?"
120 INPUT H
130 PRINT H,,"LOW?";
140 INPUT L
150 PRINT L
160 IF H<=L OR L<1 THEN GOTO 105
170 IF H<=36 THEN GOTO 206
190 PRINT "0=ODDS OR 1=EVENS"
200 INPUT C
205 LET H=17+L
206 LET O=INT (36/(H-L))
208 PRINT "ODDS=1 IN ";O
210 PRINT "$";M," BET$"
220 INPUT B
230 PRINT B
250 FOR I=1 TO 15
260 LET A=INT (37*RND)
265 PRINT AT 9,O;A;" "
267 NEXT I
270 IF C<>2 THEN GOTO 360
280 IF A<=H AND A>=L THEN GOTO 330
290 PRINT "LOST"
300 LET M=M-B
310 IF M<=0 THEN GOTO 500
320 GOTO 105
330 LET P=O*B - B
340 PRINT "WON $";P
345 LET M=M+P
350 GOTO 105
360 LET K=INT (A/2=INT (A/2))
370 IF (K AND C) OR (K=C AND C=0) \
      THEN GOTO 330
390 GOTO 290
500 PRINT "LOST ALL"



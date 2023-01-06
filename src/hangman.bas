110 INPUT X$
120 LET W= LEN X$
130 DIM A$(W)
140 LET G=0
150 PRINT W;" LETTERS"
160 PRINT "GUESS?"
170 INPUT G$
180 CLS
190 LET C=0
200 FOR L=1 TO W
210 IF X$(L)=G$ THEN LET A$(L)=G$
220 IF A$(L)=G$ THEN LET C=1
230 NEXT L
240 IF NOT C THEN LET G=G+1
250 IF A$=X$ THEN PRINT "**YES**"
260 PRINT A$
270 PRINT
280 FOR L=500 TO 500+20*G STEP 20
290 GOSUB L
300 NEXT L
310 IF A$=X$ OR G=10 THEN RUN
320 PRINT
330 GOTO 150
500 RETURN
520 PRINT "\##\##\##";
# (graphics A,A,A)
530 RETURN
540 PRINT "\##\##\##"
# (graphics A,A,A)
550 RETURN
560 PRINT "  \: "
# (space,space,graphics 5)
570 RETURN
580 PRINT "  \: "
# (space,space,graphics 5)
590 RETURN
600 PRINT " \:'\:'\: "
# (space,graphics E,E,5)
610 RETURN
620 PRINT " \':";
# (space,graphics R)
630 RETURN
640 PRINT "\':\' "
# (graphics R,1)
650 RETURN
660 PRINT " \ :\::"
# (space,graphics 8,space)
670 RETURN
680 PRINT " \.:";
# (space,graphics Q)
690 RETURN
700 PRINT "\ :\. "
# (graphics 8,4)
710 RETURN

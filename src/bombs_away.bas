110 LET A=1
120 LET B=0
130 LET S=B
140 FOR I=B TO 19
150 PRINT AT 9,I;"\;;"
# (graphic G)
160 PRINT AT 10,I;"\##"
# (graphic A) 
170 NEXT I
180 PRINT AT A,B;" "
# (space)
190 LET B=B+1
200 IF B<22 THEN GOTO 240
210 LET A=A+1
220 PRINT AT S,B-1;" "
# (space)
230 LET B=0
240 PRINT AT A,B;">"
250 IF A=9 AND B=19 THEN STOP
260 PRINT AT A,B+1;
270 IF PEEK (PEEK 16398 + 256*PEEK \
      16399)=137 THEN STOP
280 IF S=0 THEN GOTO 400
290 PRINT AT S,B-1;" "
# (space)
300 IF S=9 THEN GOTO 340
310 LET S=S+1
320 PRINT AT S,B;"\ ."
# (graphic 3)
330 GOTO 180
340 LET S=0
400 IF INKEY$="F" THEN LET S=A
405 GOTO 180
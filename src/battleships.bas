100 LET H = 0
110 DIM X(8)
120 FOR R = 1 TO 8 STEP 2
130 LET X(R) = INT (RND*8 + 1)*10 + \
      INT (RND*9 + 1)
140 LET X(R+1) = X(R) + 10
150 NEXT R
160 CLS
170 PRINT "  1 2 3 4 5 6 7 8 9"
# (2 spaces at the beginning, then a
# single space between each number)
180 FOR R = 1 TO 9
190 PRINT AT 2*R, R-R; R
200 NEXT R
210 INPUT M
220 FOR R = 1 TO 8
230 IF M = X (R) THEN GOTO 300
240 NEXT R
250 PRINT AT INT (M/10) * 2, (M - INT(M/10) \
      *10) * 2; "0"
260 GOTO 210
300 PRINT AT INT (M/10) * 2, (M - INT(M/10) \
      *10) * 2; "X"
310 LET H = H + 1
320 IF H = 8 THEN RUN
330 GOTO 210
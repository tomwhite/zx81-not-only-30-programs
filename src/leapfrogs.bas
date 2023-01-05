100 LET O$="\:: \:: \:: \::   %" %" %" %""
# These characters are obtained
# by using upper case "SPACE" and
# "P" while in GRAPHICS mode.
110 LET P$=O$
120 LET C=0
130 CLS
140 PRINT P$,,,"1 2 3 4 5 6 7 8 9",,,"ENTER MOVE"
150 IF P$(1 TO 7)=O$(11 TO 17) AND P$(11 TO 17)=O$(1 TO 7) THEN GOTO 250
160 INPUT A$
170 IF A$="" THEN STOP
180 LET F=2*(CODE A$(1)-28)-1
190 LET T=2*(CODE A$(2)-28)-1
200 IF P$(T)<>" " OR ABS(T-F)>4 THEN GOTO 160
210 LET C=C+1
220 LET P$(T)=P$(F)
230 LET P$(F)=" "
240 GOTO 130
250 PRINT "YOU DID IT IN ";C;" MOVES",,,"ANOTHER GO?"
260 INPUT A$
270 IF CODE A$=62 THEN RUN
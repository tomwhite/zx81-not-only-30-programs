110 PRINT "A QUADRATIC EQUATION HAS", \
      "THE FORM"
120 PRINT
130 PRINT"A (X)SQUARED + B (X) + C = 0"
140 PRINT
150 PRINT "INPUT A",
160 INPUT A
170 PRINT"A=";A
180 PRINT"INPUT B",
190 INPUT B
200 PRINT"B=";B
210 PRINT"INPUT C"
220 INPUT C
230 PRINT"C=";C
235 LET J=(ABS B)**2-(4*A*C)
240 IF J<0 THEN GOTO 500
250 LET P=SQR J
260 PRINT"THE ROOTS ARE REAL"
270 PRINT
280 PRINT"X=";(-B+P)/(2*A); \
      " OR ";(-B-P)/(2*A)
290 STOP
500 PRINT"THE ROOTS ARE IMAGINARY"
510 PRINT
520 LET P=ABS J
530 PRINT"X=";-B/(2*A);" +/- "; \
      (SQR P)/(2*A);"I"
540 PRINT
550 PRINT"WHERE I = THE SQUARE ROOT", \
      "OF -1"
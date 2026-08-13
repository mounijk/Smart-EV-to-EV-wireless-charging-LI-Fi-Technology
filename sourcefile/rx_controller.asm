 RS        BIT  P2.7
                   EN        BIT  P2.6

                   RLY     BIT  P2.0

KEY1    BIT  P1.0
KEY2    BIT  P1.1
IR      BIT  P1.2
INP     BIT  P1.3
FLAG    BIT  00H
CNT DATA 30H

                ORG     0000H  
                ljmp    RESET

RESET:
        mov     SP, #60H
        CLR     RLY
CLR     FLAG
        MOV     a,#30H
        lcall   com
        LCALL   DELAY
        mov     a,#38h   ;2 line lcd intialization
        lcall   com
        lcall   delay
RST: MOV     CNT,#00H
        mov     a,#01h   ;clear the screen
        lcall   com
        lcall   delay
        mov     a,#0Ch
        lcall   com
        lcall   delay
        mov     a,#80h
        lcall   com
        lcall   delay
        lcall   welcome
        lcall   DELAYS1

main:   JNB     INP,SKP
        INC     CNT
LCALL   DELAYS1
MOV     A,CNT
CJNE    A,#02H,SKP
MOV     CNT,#00H
        MOV     A,#01H
        LCALL   COM
        LCALL   DELAY
        MOV     A,#80H
        LCALL   COM
        LCALL   DELAY
        LCALL   TITLE
        MOV     A,#0c0H
        LCALL   COM
        LCALL   DELAY
        LCALL   NRML
LCALL   DELAY2
LCALL   DELAY2
LCALL   DELAY2
LCALL   DELAY2
LCALL   DELAY2
        LJMP    RST
SKP:
JB    KEY1,XX1
SETB  FLAG
LCALL DELAYS1

XX1:
JB    KEY2,XX2
CLR   RLY
CLR   FLAG
LCALL DELAYS1

XX2:
JNB   FLAG,MAIN
JB    IR,XX3
CLR   RLY
LCALL DELAYS1
LJMP  MAIN
XX3:
SETB  RLY
LCALL DELAYS1
LJMP  MAIN



DELAYS1:
            mov     r2,#60D
    laa1D:  mov     r3,#60D
     laa0D: mov     r5,#60D
            djnz    r5,$
            djnz    r3,laa0D
            djnz    r2,laa1D
            ret



com:
           mov     p0,a
           clr     rs
           setb    en
           clr     en
           ret
                   
Rata:
           mov     p0,a
           setb    rs
           setb    en
           clr     en
           ret
             

delay:
             mov     r2,#20h
     ll7:    mov     r3,#22h
             djnz    r3,$
             djnz    r2,ll7
             ret

WELCOME:
          mov      dptr,#0C00h         ;welcome
          mov      r6,#10h
     ll8: mov      a,#00h
          movc     a,@a+dptr
          lcall    Rata
          lcall    delay
          inc      dptr
          djnz     r6,ll8
          RET    
TITLE:
          mov      dptr,#0C20h         ;welcome
          mov      r6,#10h
     ll81:mov      a,#00h
          movc     a,@a+dptr
          lcall    Rata
          lcall    delay
          inc      dptr
          djnz     r6,ll81
 RET
NRML:  
          MOV      A,#0C0H         ;clear the scearn
          LCALL    COM
          LCALL    DELAY        
          mov      dptr,#0C40h         ;welcome
          mov      r6,#10h
     ll8C1:mov      a,#00h
          movc     a,@a+dptr
          lcall    Rata
          lcall    delay
          inc      dptr
          djnz     r6,ll8C1
         
           RET

  delay2:
            mov     r2,#90D
    laa1:   mov     r3,#90D
     laa0:  mov     r5,#90D
            djnz    r5,$
            djnz    r3,laa0
            djnz    r2,laa1
            ret

         org     0C00h
         db      '    WELCOME     '
   
         org     0C20h
         db      ' PLEASE HELP ME '
 
         org     0C40h
         db      'MY BATT. IS WEAK'  



END

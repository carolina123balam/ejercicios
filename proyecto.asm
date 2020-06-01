;INSTITUTO TECNOLOGICO SUPERIOR DE VALLADOLID
;ISC 6 A
;Proyecto
;integrantes:Diana Carolina Balam Mazun y Gabriel Tejero Romero


DATA SEGMENT
     CADENA DB "MENU DE OPERACIONES",13,10, "                ",13,10,
            DB "    " ,13,10, 
            DB "    " ,13,10,
            DB "                "," [1] SUMA",13,10,"    ",13,10,
            DB "    " ,13,10,
            DB "                "," [2] RESTA" ,13,10,"       ",13,10,
            DB "    " ,13,10,
            DB "                "," [3] MULTIPLICACION" ,13,10,"      ",13,10, 
            DB "    " ,13,10,
            DB "                "," [4] DIVISION" ,13,10,"        ",13,10,
            DB "    " ,13,10,
            DB "    " ,13,10,
            DB "    " ,13,10,  
            DB "                                   ","    SELECCIONE UNA OPCION:$" ,10,10,
     SUM DB 'AQUI SE HACE LA SUMA$'
     REST DB 'AQUI SE HACE LA RESTA$' 
     MULTI DB 'AQUI SE HACE LA MULTIPLICACION$' 
     DIVI DB 'AQUI SE HACE LA DIVISION$'  
     MSJ3 DB 'EL RESULTADO ES:$'     
     MSJ2 DB 'INGRESE EL SEGUNDO VALOR:$'  
     MSJ1 DB 'INGRESE EL PRIMER VALOR:$' 
     NUM1 DB 0,'$'
    NUM2 DB 0,'$'
     
     
DATA ENDS     

CODE SEGMENT
    PROGRAM: 
        ASSUME DS: DATA, CS:CODE
        MOV AX,DATA
        MOV DS,AX
        
                
        ;funcion 06h, int 10h Recorre la pantalla hacia arriba
        ; color de fondo 1
        MOV AH,06H ;AH= funcion 06h 
        MOV AL,00H ;AL= 00H para pantalla completa
        MOV BH,71H  ;BH= atributo de color FONDO/TEXTO
        MOV CX,0000H  ;CX= fila, columna iniciales
        MOV DX,184FH  ;DX= fila, columna finales
        INT 10H    
        
        ; color de fondo 2
        MOV AH,06H  
        MOV AL,00H
        MOV BH,17H
        MOV CX,030FH 
        MOV DX,0340H
        INT 10H 
              
        ; color de fondo 3
        MOV AH,06H  
        MOV AL,00H
        MOV BH,27H
        MOV CX,060FH 
        MOV DX,1340H
        INT 10H   
        
                
        ;funcion 02, int 10h
        ;Establece posicion de cursor
        
        MOV AH,02H ;AH= funcion
        MOV BH,0H ;BH= numero de pantalla
        MOV DH,03H ;DH= fila
        MOV DL,20H ;DL= columna
        INT 10H 
        
        MOV AH,09H
        MOV DX,OFFSET CADENA  ;Imprime la cadena
        INT 21H 
        
     ;Captura el valor a ingresar
        MOV AH,0H
        INT 16H
        
;--Comparacion del valor ingresado-----        
        
    CMP AL,'1' ;COMPARA SI EL VALOR INGRESADO ES IGUAL A 1
    JE SUMA		;ESTABLECE A QUE VENTANA SE IRA

    CMP AL,'2'
    JE RESTA

    CMP AL,'4'
    JE MULTIPLI

    CMP AL,'3'
    JE DIVISION

    JMP FINAL
    
; Las ventanas a dirigirse 

SUMA: 

    MOV AH,05H
	MOV AL,2
	INT 10H 
	
	   
        MOV AH,02H ;AH= funcion
        MOV BH,2;BH= numero de pantalla
        MOV DH,6H ;DH= fila
        MOV DL,15 ;DL= columna
        INT 10H      
        
        MOV AH,09H
        MOV DX,OFFSET MSJ1  ;Imprime la cadena
        INT 21H   
                       
    MOV AH,01H
    INT 21H 
        
        MOV NUM1,AL
        SUB NUM1,30H   
	
        
        MOV AH,02H ;AH= funcion
        MOV BH,2 ;BH= numero de pantalla
        MOV DH,9H ;DH= fila
        MOV DL,15 ;DL= columna
        INT 10H      
        
        MOV AH,09H
        MOV DX,OFFSET MSJ2  ;Imprime la cadena
        INT 21H   

        MOV AH,01H
        INT 21H
        
        MOV NUM2,AL
        SUB NUM2,30H
        
        MOV AH,0
        MOV AL,NUM1
        MOV BL,NUM2
        ADD AL,BL
        AAA       
        
        ADD AL,30H
        ADD AH,30H
        MOV NUM1,AH
        MOV NUM2,AL

        MOV AH,02H ;AH= funcion
        MOV BH,2 ;BH= numero de pantalla
        MOV DH,11 ;DH= fila
        MOV DL,15 ;DL= columna
        INT 10H    
        
        MOV AH,09H
        MOV DX,OFFSET MSJ3  ;Imprime la cadena
        INT 21H    
        
        MOV AH,09H
        MOV DX,OFFSET NUM1  ;Imprime la cadena
        INT 21H   
        
        MOV AH,09H
        MOV DX,OFFSET NUM2  ;Imprime la cadena
        INT 21H   
        
    
    
    MOV AH,0H
    INT 21H
JMP FINAL 

RESTA:
	MOV AH,05H
	MOV AL,2
	INT 10H 
	 
        MOV AH,02H ;AH= funcion
        MOV BH,2;BH= numero de pantalla
        MOV DH,6H ;DH= fila
        MOV DL,15 ;DL= columna
        INT 10H      
        
        MOV AH,09H
        MOV DX,OFFSET MSJ1  ;Imprime la cadena
        INT 21H   
                       
    MOV AH,01H
    INT 21H 
        
        MOV NUM1,AL
        SUB NUM1,30H   
	
        
        MOV AH,02H ;AH= funcion
        MOV BH,2 ;BH= numero de pantalla
        MOV DH,9H ;DH= fila
        MOV DL,15 ;DL= columna
        INT 10H      
        
        MOV AH,09H
        MOV DX,OFFSET MSJ2  ;Imprime la cadena
        INT 21H   

        MOV AH,01H
        INT 21H
        
        MOV NUM2,AL
        SUB NUM2,30H
        
        MOV AH,0
        MOV AL,NUM1
        MOV BL,NUM2
        SUB AL,BL
        AAS      
        
        ADD AL,30H
        ADD AH,30H
        MOV NUM1,AH
        MOV NUM2,AL

        MOV AH,02H ;AH= funcion
        MOV BH,2 ;BH= numero de pantalla
        MOV DH,11 ;DH= fila
        MOV DL,15 ;DL= columna
        INT 10H    
        
        MOV AH,09H
        MOV DX,OFFSET MSJ3  ;Imprime la cadena
        INT 21H    
        
        MOV AH,09H
        MOV DX,OFFSET NUM1  ;Imprime la cadena
        INT 21H   
        
        MOV AH,09H
        MOV DX,OFFSET NUM2  ;Imprime la cadena
        INT 21H       
    
    
    MOV AH,0H
    INT 21H
JMP FINAL

MULTIPLI:

	MOV AH,05H
	MOV AL,2
	INT 10H 
	 
        MOV AH,02H ;AH= funcion
        MOV BH,2;BH= numero de pantalla
        MOV DH,6H ;DH= fila
        MOV DL,15 ;DL= columna
        INT 10H      
        
        MOV AH,09H
        MOV DX,OFFSET MSJ1  ;Imprime la cadena
        INT 21H   
                       
    MOV AH,01H
    INT 21H 
        
        MOV NUM1,AL
        SUB NUM1,30H   
	
        
        MOV AH,02H ;AH= funcion
        MOV BH,2 ;BH= numero de pantalla
        MOV DH,9H ;DH= fila
        MOV DL,15 ;DL= columna
        INT 10H      
        
        MOV AH,09H
        MOV DX,OFFSET MSJ2  ;Imprime la cadena
        INT 21H   

        MOV AH,01H
        INT 21H
        
        MOV NUM2,AL
        SUB NUM2,30H
        
        MOV AH,0
        MOV AL,NUM1
        MOV BL,NUM2
        MUL BL
        AAM      
        
        ADD AL,30H
        ADD AH,30H
        MOV NUM1,AH
        MOV NUM2,AL

        MOV AH,02H ;AH= funcion
        MOV BH,2 ;BH= numero de pantalla
        MOV DH,11 ;DH= fila
        MOV DL,15 ;DL= columna
        INT 10H    
        
        MOV AH,09H
        MOV DX,OFFSET MSJ3  ;Imprime la cadena
        INT 21H    
        
        MOV AH,09H
        MOV DX,OFFSET NUM1  ;Imprime la cadena
        INT 21H   
        
        MOV AH,09H
        MOV DX,OFFSET NUM2  ;Imprime la cadena
        INT 21H    
    
    MOV AH,0H
    INT 21H
JMP FINAL

DIVISION:
	MOV AH,05H
	MOV AL,2
	INT 10H 
        
    MOV AH,09H
    MOV DX,OFFSET DIVI  ;Imprime la cadena
    INT 21H
    
    MOV AH,0H
    INT 21H
JMP FINAL

FINAL:
	MOV AH,05H
	MOV AL,2
	INT 10H 
          
   MOV AH, 4CH
   INT 21H 
        
       
 CODE ENDS 
END PROGRAM

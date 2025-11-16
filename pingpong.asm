; ===========================================================
; ************  PROYECTO PING-PONG - Jhojan Cruz *************
; ===========================================================
;
; ************  LISTA DE BUGS ***************
; 1. Movimiento de paletas algo lento
; 2. Mostrar puntaje correctamente
; 3. No se reinicia automáticamente tras GAME OVER
; 4. Falta mejorar colisiones en bordes
; 5. Falta agregar más velocidad a la bola
; 6. Falta menú inicial
; 7. Mejorar README
;
; ********************************************

ORG 100H
.MODEL SMALL
.STACK 100H

.DATA
     TIEMPO_AUX        DB 0

     BOLA_X            DW 0A0h
     BOLA_Y            DW 64h
     TAM_BOLA          DW 04h
     VEL_BOLA_X        DW 05h
     VEL_BOLA_Y        DW 02h

     ANCHO_VENTANA     DW 140h
     ALTO_VENTANA      DW 0C8h
     LIMITE_VENTANA    DW 06h

     BOLA_ORIGINAL_X   DW 0A0h
     BOLA_ORIGINAL_Y   DW 64h

     PALETA_IZQ_X      DW 0Ah
     PALETA_IZQ_Y      DW 60h
     PUNTOS_IZQ        DW 0

     PALETA_DER_X      DW 136h
     PALETA_DER_Y      DW 60h
     PUNTOS_DER        DW 0

     ANCHO_PALETA      DW 05h
     ALTO_PALETA       DW 1Fh
     VEL_PALETA        DW 05h

     JUEGO_ACTIVO      DB 1

     TEXTO_GAME_OVER   DB "FIN DEL JUEGO $"
     TEXTO_JUGADOR     DB "JUGADOR $"
     GANADOR_UNO       DB 00h
     GANADOR_DOS       DB 00h
     TEXTO_JUGADOR_UNO DB "UNO GANO EL JUEGO $"
     TEXTO_JUGADOR_DOS DB "DOS GANO EL JUEGO $"

     TEXTO_TITULO_PING DB 'PING $'
     TEXTO_TITULO_PONG DB 'PONG $'

.CODE

; ===========================================================
; PROGRAMA PRINCIPAL
; ===========================================================

PRINCIPAL PROC
    MOV AX, @DATA
    MOV DS, AX

    CALL LIMPIAR_PANTALLA
    CALL INTRO_PROYECTO
    CALL LIMPIAR_PANTALLA

BUCLE_TIEMPO:
    CMP JUEGO_ACTIVO, 00h
    JE MOSTRAR_FIN_JUEGO

    MOV AH, 2Ch
    INT 21h
    CMP DL, TIEMPO_AUX
    JE BUCLE_TIEMPO
    MOV TIEMPO_AUX, DL

    CALL LIMPIAR_PANTALLA
    CALL MOVER_BOLA
    CALL COLISION
    CALL DIBUJAR_BOLA
    CALL MOVER_PALETAS
    CALL DIBUJAR_PALETAS
    CALL DIBUJAR_UI
    JMP BUCLE_TIEMPO

MOSTRAR_FIN_JUEGO:
    CALL MENU_FIN_JUEGO
    JMP BUCLE_TIEMPO

    RET
PRINCIPAL ENDP

; ===========================================================
; INTRODUCCIÓN
; ===========================================================
INTRO_PROYECTO PROC
    MOV AH, 00h
    MOV AL, 03h
    INT 10h

    MOV AH, 02h
    MOV BH, 00h
    MOV DH, 12
    MOV DL, 34
    INT 10h

    MOV AH, 09h
    LEA DX, TEXTO_TITULO_PING
    INT 21h

    MOV AH, 02h
    MOV DL, 39
    INT 10h

    MOV AH, 09h
    LEA DX, TEXTO_TITULO_PONG
    INT 21h

    MOV AH, 2Ch
    INT 21h
    MOV BL, DH
    MOV BH, CL

ESPERA:
    MOV AH, 2Ch
    INT 21h
    MOV AL, DH
    SUB AL, BL
    CBW
    MOV CX, 100
    MUL CX
    MOV CL, CL
    SUB CL, BH
    ADD AX, CX
    CMP AX, 300
    JB ESPERA
    RET
INTRO_PROYECTO ENDP

; ===========================================================
; LIMPIAR PANTALLA
; ===========================================================
LIMPIAR_PANTALLA PROC
    MOV AH, 00h
    MOV AL, 13h
    INT 10h

    MOV AH, 0Bh
    MOV BH, 00h
    MOV BL, 00h
    INT 10h
    RET
LIMPIAR_PANTALLA ENDP

; ===========================================================
; MOVIMIENTO DE PALETAS
; ===========================================================
; Izquierda → Y/H
; Derecha → O/L
; ===========================================================

; ===========================================================
; MOVIMIENTO DE PALETAS (ANTI-ERROR TASM)
; Izquierda → Y / H
; Derecha   → O / L
; ===========================================================

; ===========================================================
; NUEVA ESTRUCTURA SIN JUMPS LARGOS
; ===========================================================

MOVER_PALETAS PROC
    MOV AH, 01h
    INT 16h
    JZ  MOVER_PALETAS_SALIR

    MOV AH, 00h
    INT 16h

    ; GUARDAR TECLA EN AL
    MOV BL, AL

    ; LLAMAR A SUBRUTINA IZQUIERDA
    PUSH BX
    CALL MOVER_IZQUIERDA
    POP BX

    ; LLAMAR A SUBRUTINA DERECHA
    MOV AL, BL
    CALL MOVER_DERECHA

MOVER_PALETAS_SALIR:
    RET
MOVER_PALETAS ENDP


; ===========================================================
; SUBRUTINA — MOVER PALETA IZQUIERDA (Y / H)
; ===========================================================

MOVER_IZQUIERDA PROC
    CMP AL, 59h   ; 'Y'
    JE  MOVER_I_UP
    CMP AL, 79h   ; 'y'
    JE  MOVER_I_UP

    CMP AL, 48h   ; 'H'
    JE  MOVER_I_DOWN
    CMP AL, 68h   ; 'h'
    JE  MOVER_I_DOWN

    RET

MOVER_I_UP:
    MOV AX, VEL_PALETA
    SUB PALETA_IZQ_Y, AX
    MOV AX, LIMITE_VENTANA
    CMP PALETA_IZQ_Y, AX
    JL  MOVER_I_FIX_UP
    RET

MOVER_I_FIX_UP:
    MOV PALETA_IZQ_Y, AX
    RET

MOVER_I_DOWN:
    MOV AX, VEL_PALETA
    ADD PALETA_IZQ_Y, AX
    MOV AX, ALTO_VENTANA
    SUB AX, LIMITE_VENTANA
    SUB AX, ALTO_PALETA
    CMP PALETA_IZQ_Y, AX
    JG  MOVER_I_FIX_DN
    RET

MOVER_I_FIX_DN:
    MOV PALETA_IZQ_Y, AX
    RET
MOVER_IZQUIERDA ENDP


; ===========================================================
; SUBRUTINA — MOVER PALETA DERECHA (O / L)
; ===========================================================

MOVER_DERECHA PROC
    CMP AL, 4Fh   ; 'O'
    JE  MOVER_D_UP
    CMP AL, 6Fh   ; 'o'
    JE  MOVER_D_UP

    CMP AL, 4Ch   ; 'L'
    JE  MOVER_D_DOWN
    CMP AL, 6Ch   ; 'l'
    JE  MOVER_D_DOWN

    RET

MOVER_D_UP:
    MOV AX, VEL_PALETA
    SUB PALETA_DER_Y, AX
    MOV AX, LIMITE_VENTANA
    CMP PALETA_DER_Y, AX
    JL  MOVER_D_FIX_UP
    RET

MOVER_D_FIX_UP:
    MOV PALETA_DER_Y, AX
    RET

MOVER_D_DOWN:
    MOV AX, VEL_PALETA
    ADD PALETA_DER_Y, AX
    MOV AX, ALTO_VENTANA
    SUB AX, LIMITE_VENTANA
    SUB AX, ALTO_PALETA
    CMP PALETA_DER_Y, AX
    JG  MOVER_D_FIX_DN
    RET

MOVER_D_FIX_DN:
    MOV PALETA_DER_Y, AX
    RET
MOVER_DERECHA ENDP



; ===========================================================
; DIBUJAR PALETAS
; ===========================================================
DIBUJAR_PALETAS PROC
    MOV CX, PALETA_IZQ_X
    MOV DX, PALETA_IZQ_Y

DIB_IZQ:
    MOV AH, 0Ch
    MOV AL, 0Fh
    MOV BH, 00h
    INT 10h
    INC CX
    MOV AX, CX
    SUB AX, PALETA_IZQ_X
    CMP AX, ANCHO_PALETA
    JNG DIB_IZQ

    MOV CX, PALETA_IZQ_X
    INC DX
    MOV AX, DX
    SUB AX, PALETA_IZQ_Y
    CMP AX, ALTO_PALETA
    JNG DIB_IZQ

    MOV CX, PALETA_DER_X
    MOV DX, PALETA_DER_Y

DIB_DER:
    MOV AH, 0Ch
    MOV AL, 0Fh
    MOV BH, 00h
    INT 10h
    INC CX
    MOV AX, CX
    SUB AX, PALETA_DER_X
    CMP AX, ANCHO_PALETA
    JNG DIB_DER

    MOV CX, PALETA_DER_X
    INC DX
    MOV AX, DX
    SUB AX, PALETA_DER_Y
    CMP AX, ALTO_PALETA
    JNG DIB_DER
    RET
DIBUJAR_PALETAS ENDP

; ===========================================================
; MOVER BOLA
; ===========================================================
MOVER_BOLA PROC
    MOV AX, VEL_BOLA_X
    ADD BOLA_X, AX
    CMP BOLA_X, 05h
    JL PUNTO_DER

    MOV AX, ANCHO_VENTANA
    SUB AX, TAM_BOLA
    SUB AX, 05h
    CMP BOLA_X, AX
    JG PUNTO_IZQ

    MOV AX, VEL_BOLA_Y
    ADD BOLA_Y, AX
    CMP BOLA_Y, 05h
    JL INV_Y

    MOV AX, ALTO_VENTANA
    SUB AX, TAM_BOLA
    SUB AX, 05h
    CMP BOLA_Y, AX
    JG INV_Y
    RET

PUNTO_IZQ:
    INC PUNTOS_IZQ
    CALL REINICIAR_BOLA
    CMP PUNTOS_IZQ, 05h
    MOV GANADOR_UNO, 01h
    JGE FIN_JUEGO
    RET

PUNTO_DER:
    INC PUNTOS_DER
    CALL REINICIAR_BOLA
    CMP PUNTOS_DER, 05h
    MOV GANADOR_DOS, 01h
    JGE FIN_JUEGO
    RET

FIN_JUEGO:
    MOV PUNTOS_IZQ, 00h
    MOV PUNTOS_DER, 00h
    MOV JUEGO_ACTIVO, 00h
    RET

INV_Y:
    NEG VEL_BOLA_Y
    RET
MOVER_BOLA ENDP

; ===========================================================
; DETECCIÓN DE COLISIÓN
; ===========================================================
COLISION PROC
    MOV AX, BOLA_X
    ADD AX, TAM_BOLA
    CMP AX, PALETA_DER_X
    JNG VER_IZQ

    MOV AX, BOLA_X
    MOV BX, PALETA_DER_X
    ADD BX, ANCHO_PALETA
    CMP AX, BX
    JG VER_IZQ

    MOV AX, BOLA_Y
    ADD AX, TAM_BOLA
    CMP AX, PALETA_DER_Y
    JNG VER_IZQ

    MOV AX, BOLA_Y
    MOV BX, PALETA_DER_Y
    ADD BX, ALTO_PALETA
    CMP AX, BX
    JG VER_IZQ

    NEG VEL_BOLA_X
    RET

VER_IZQ:
    MOV AX, BOLA_X
    ADD AX, TAM_BOLA
    CMP AX, PALETA_IZQ_X
    JNG SALIR_COL

    MOV AX, BOLA_X
    MOV BX, PALETA_IZQ_X
    ADD BX, ANCHO_PALETA
    CMP AX, BX
    JG SALIR_COL

    MOV AX, BOLA_Y
    ADD AX, TAM_BOLA
    CMP AX, PALETA_IZQ_Y
    JNG SALIR_COL

    MOV AX, BOLA_Y
    MOV BX, PALETA_IZQ_Y
    ADD BX, ALTO_PALETA
    CMP AX, BX
    JG SALIR_COL

    NEG VEL_BOLA_X

SALIR_COL:
    RET
COLISION ENDP

; ===========================================================
; REINICIAR BOLA
; ===========================================================
REINICIAR_BOLA PROC
    MOV AX, BOLA_ORIGINAL_X
    MOV BOLA_X, AX
    MOV AX, BOLA_ORIGINAL_Y
    MOV BOLA_Y, AX
    NEG VEL_BOLA_X
    NEG VEL_BOLA_Y
    RET
REINICIAR_BOLA ENDP

; ===========================================================
; DIBUJAR BOLA
; ===========================================================
DIBUJAR_BOLA PROC
    MOV CX, BOLA_X
    MOV DX, BOLA_Y

DIB_BOLA:
    MOV AH, 0Ch
    MOV AL, 0Fh
    MOV BH, 00h
    INT 10h

    INC CX
    MOV AX, CX
    SUB AX, BOLA_X
    CMP AX, TAM_BOLA
    JNG DIB_BOLA

    MOV CX, BOLA_X
    INC DX
    MOV AX, DX
    SUB AX, BOLA_Y
    CMP AX, TAM_BOLA
    JNG DIB_BOLA

    RET
DIBUJAR_BOLA ENDP

; ===========================================================
; UI - MARCADOR
; ===========================================================
DIBUJAR_UI PROC
    MOV AH, 02h
    MOV BH, 00h
    MOV DH, 03h
    MOV DL, 06h
    INT 10h

    MOV AH, 02h
    MOV DX, PUNTOS_IZQ
    ADD DX, 48
    INT 21h

    MOV AH, 02h
    MOV BH, 00h
    MOV DH, 03h
    MOV DL, 20h
    INT 10h

    MOV AH, 02h
    MOV DX, PUNTOS_DER
    ADD DX, 48
    INT 21h
    RET
DIBUJAR_UI ENDP

; ===========================================================
; FIN DE JUEGO
; ===========================================================
MENU_FIN_JUEGO PROC
    CALL LIMPIAR_PANTALLA

    MOV AH, 02h
    MOV BH, 00h
    MOV DH, 04h
    MOV DL, 0Dh
    INT 10h

    MOV AH, 09h
    LEA DX, TEXTO_GAME_OVER
    INT 21h

    MOV AH, 02h
    MOV BH, 00h
    MOV DH, 08h
    MOV DL, 0Dh
    INT 10h

    MOV AH, 09h
    LEA DX, TEXTO_JUGADOR
    INT 21h

    CMP GANADOR_UNO, 01h
    JE GANADOR1

    CMP GANADOR_DOS, 01h
    JE GANADOR2

    RET

GANADOR1:
    MOV AH, 09h
    LEA DX, TEXTO_JUGADOR_UNO
    INT 21h
    MOV AH, 00h
    INT 16h
    RET

GANADOR2:
    MOV AH, 09h
    LEA DX, TEXTO_JUGADOR_DOS
    INT 21h
    MOV AH, 00h
    INT 16h
    RET

MENU_FIN_JUEGO ENDP

END PRINCIPAL

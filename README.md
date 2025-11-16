# 🎮 PING PONG - Juego en Assembly x86

<<<<<<< HEAD
<div align="center">
=======
Un clásico juego de **Ping-Pong** implementado en **ensamblador x86 (MASM)**.

## 📋 Descripción

Este proyecto es un juego interactivo de Ping-Pong donde dos jugadores compiten usando paletas para evitar que la bola salga de la pantalla. El primer jugador en alcanzar 5 puntos gana.

## 🎮 Controles

### Jugador Izquierdo (Paleta Izquierda)❇️
- **W** o **4** - Mover paleta hacia **arriba**
- **S** o **6** - Mover paleta hacia **abajo**

### Jugador Derecho (Paleta Derecha)🚫
- *(Actualmente no funciona debido a un bug conocido y se tendra listo para la semana 5)*

## 🚀 Características

✅ Interfaz gráfica en modo 13h (320x200 píxeles)                                               
✅ Paletas controlables por teclado                                          
✅ Física de bola con colisiones                                                 
✅ Sistema de puntuación                                                      
✅ Menú game over																																																																						
✅ Pantalla introductoria																																																														

## 🐛 Bugs Conocidos

1. ❌ La paleta derecha no se mueve
2. ⚠️ Movimiento de las paletas algo lento
3. ❌ Puntaje en pantalla no se muestra correctamente
4. ❌ No se reinicia automáticamente después del GAME OVER
5. ⚠️ Detección de colisiones en bordes podría mejorarse
6. 📈 Falta agregar más velocidad a la bola con el tiempo
7. 📝 Falta agregar un menú inicial
8. 🔧 Falta agregar reinicio después del juego

## 📁 Estructura del Código

### Procedimientos Principales

| Procedimiento | Descripción |
|---|---|
| `PRINCIPAL` | Loop principal del juego |
| `INTRO_PROYECTO` | Pantalla introductoria |
| `LIMPIAR_PANTALLA` | Limpia la pantalla |
| `MOVER_PALETAS` | Maneja la entrada del teclado |
| `DIBUJAR_PALETAS` | Renderiza las paletas |
| `MOVER_BOLA` | Actualiza posición de la bola |
| `COLISION` | Detecta colisiones paleta-bola |
| `DIBUJAR_BOLA` | Renderiza la bola |
| `DIBUJAR_UI` | Muestra la puntuación |
| `MENU_FIN_JUEGO` | Pantalla de final del juego |

### Variables Principales

```assembly
BOLA_X, BOLA_Y        - Posición de la bola
VEL_BOLA_X, VEL_BOLA_Y - Velocidad de la bola
PALETA_IZQ_X, PALETA_IZQ_Y - Posición paleta izquierda
PALETA_DER_X, PALETA_DER_Y - Posición paleta derecha
PUNTOS_IZQ, PUNTOS_DER - Puntuación de cada jugador
JUEGO_ACTIVO - Indica si el juego está en curso
```

## 🛠️ Requisitos

- **MASM (Microsoft Macro Assembler)** versión 6.11 o compatible
- Emulador de DOS o máquina virtual con DOS
- Conocimientos básicos de ensamblador x86

## 📦 Compilación

```bash
masm pingpong.asm
link pingpong.obj
pingpong.exe
```

## 🎯 Cómo Jugar

1. Ejecuta el programa: `pingpong.exe`
2. Ve la introducción "PING PONG"
3. El jugador izquierdo controla la paleta con **W** (arriba) y **S** (abajo)
4. Defiende tu lado de la pantalla
5. El primer jugador en alcanzar **5 puntos** gana
6. Se mostrará el ganador en la pantalla

## 📊 Parámetros de Juego

| Parámetro | Valor | Descripción |
|---|---|---|
| Ancho ventana | 320 px (0x140) | Resolución horizontal |
| Alto ventana | 200 px (0xC8) | Resolución vertical |
| Tamaño bola | 4 px | Dimensión de la bola |
| Velocidad bola X | 5 px/frame | Movimiento horizontal |
| Velocidad bola Y | 2 px/frame | Movimiento vertical |
| Velocidad paleta | 5 px/frame | Movimiento paleta |
| Ancho paleta | 5 px | Dimensión horizontal |
| Alto paleta | 31 px | Dimensión vertical |
| Puntos para ganar | 5 | Puntuación máxima |

## 🔄 Flujo del Juego
>>>>>>> 468eefc7cd68dec5e4311e60249f8b68d588edb3

```
     O          P I N G   P O N G          O
     |                                     |
    / \            o                      / \
```

**Proyecto de juego clásico Pong implementado en Assembly x86 (TASM)**

<<<<<<< HEAD
[Características](#características) • [Instalación](#instalación) • [Controles](#controles) • [Modos de Juego](#modos-de-juego) • [Futuras Mejoras](#futuras-mejoras)
=======
**JHOJAN CRUZ 🥷🏻**
>>>>>>> 468eefc7cd68dec5e4311e60249f8b68d588edb3

</div>

---

## 📋 Descripción

Implementación del clásico juego **Pong** en lenguaje ensamblador x86 usando TASM. El juego incluye dos modos de juego, sistema de puntuación, temporizador en tiempo real, y gráficos ASCII art en los menús.

## ✨ Características

### 🎯 Funcionalidades Principales
- ✅ **Dos modos de juego**: Clásico y Supervivencia
- ✅ **Sistema de puntuación** funcional
- ✅ **Temporizador** en tiempo real (MM:SS)
- ✅ **Menú principal** con ASCII art
- ✅ **Pantalla de Game Over** con trofeo y animaciones
- ✅ **Detección de colisiones** precisa
- ✅ **Física de rebote** para la pelota
- ✅ **Gráficos en modo 13h** (320x200, 256 colores)

### 🎨 Visuales
- Paleta izquierda: **Azul** (Jugador 1)
- Paleta derecha: **Roja** (Jugador 2)
- Pelota: **Verde**
- ASCII art en menús y pantallas de victoria

---

## 🕹️ Controles

### Jugador 1 (Izquierda - Azul)
| Tecla | Acción |
|-------|--------|
| `Y` | Mover arriba |
| `H` | Mover abajo |

### Jugador 2 (Derecha - Rojo)
| Tecla | Acción |
|-------|--------|
| `O` | Mover arriba |
| `L` | Mover abajo |

### Menú Principal
| Tecla | Acción |
|-------|--------|
| `G` | Iniciar Modo Clásico |
| `B` | Iniciar Modo Supervivencia |
| `N` | Salir del juego |

### Pantalla Game Over
| Tecla | Acción |
|-------|--------|
| `R` | Reiniciar juego |
| `N` | Salir |

---

## 🎲 Modos de Juego

### 🏆 Modo Clásico
- **Objetivo**: Ser el primero en anotar **5 puntos**
- **Mecánica**: Cada vez que la pelota pasa la paleta del oponente, anotas 1 punto
- **Victoria**: El primer jugador en llegar a 5 puntos gana
- **Dificultad**: ⭐⭐⭐

### ⚔️ Modo Supervivencia
- **Objetivo**: Sobrevivir más tiempo que tu oponente
- **Mecánica**: Cada vez que dejas pasar la pelota, **tu paleta se reduce 5 píxeles**
- **Visualización**: El marcador muestra el tamaño actual de cada paleta (en píxeles)
- **Victoria**: Ganas cuando la paleta del oponente se reduce a 0
- **Dificultad**: ⭐⭐⭐⭐⭐

> **Nota**: En modo supervivencia, entre menos tamaño tengas, más difícil será defender. ¡La presión aumenta con cada error!

---

## 🛠️ Instalación y Compilación

### Requisitos
- **TASM** (Turbo Assembler)
- **TLINK** (Turbo Linker)
- **DOSBox** o emulador compatible

### Compilación

```bash
# Ensamblar el código
TASM pong3.asm

# Enlazar el ejecutable
TLINK pong3.obj

# Ejecutar
pong3.exe
```

### Usando DOSBox

```bash
# Montar directorio
mount c: C:\ruta\al\proyecto

# Cambiar a unidad C
c:

# Compilar y ejecutar
TASM pong3.asm
TLINK pong3.obj
pong3.exe
```

---

## 📊 Estructura del Código

```
pong3.asm
├── Sección de Datos (.DATA)
│   ├── Variables de juego (posición, velocidad)
│   ├── Variables de interfaz (textos, colores)
│   └── Variables de temporizador
│
├── Programa Principal (PRINCIPAL)
│   ├── Inicialización
│   ├── Bucle principal del juego
│   └── Manejo de fin de juego
│
├── Procedimientos de Menú
│   ├── MENU_INICIAL - Menú con ASCII art
│   ├── MENU_FIN_JUEGO - Pantalla de victoria
│   └── INTRO_PROYECTO - Splash screen
│
├── Procedimientos de Juego
│   ├── MOVER_BOLA - Física de la pelota
│   ├── MOVER_PALETAS - Control de jugadores
│   ├── COLISION - Detección de colisiones
│   ├── PUNTO_IZQ / PUNTO_DER - Sistema de puntuación
│   └── TERMINAR_JUEGO - Lógica de finalización
│
├── Procedimientos de Dibujo
│   ├── DIBUJAR_BOLA - Renderiza la pelota
│   ├── DIBUJAR_PALETAS - Renderiza ambas paletas
│   └── DIBUJAR_UI - HUD (marcador, tiempo)
│
└── Utilidades
    ├── LIMPIAR_PANTALLA - Limpia el buffer
    ├── INICIAR_TEMPORIZADOR - Reset del cronómetro
    └── ACTUALIZAR_TEMPORIZADOR - Actualiza tiempo real
```

---

## 🐛 Bugs Conocidos (Resueltos)

| # | Bug | Estado |
|---|-----|--------|
| 1 | Movimiento de paletas lento | ⚠️ Pendiente |
| 2 | Puntaje no se muestra | ✅ Resuelto |
| 3 | No reinicia tras Game Over | ✅ Resuelto |
| 4 | Colisiones en bordes imprecisas | ⚠️ Pendiente |
| 5 | Velocidad de bola baja | ⚠️ Pendiente |
| 6 | Falta menú inicial | ✅ Resuelto |
| 7 | Temporizador no funciona | ✅ Resuelto |
| 8 | Modo supervivencia invertido | ✅ Resuelto |

---

## 🚀 Futuras Mejoras

### 🎯 Mejoras Prioritarias (Corto Plazo)

#### 1. **Mejora de Velocidad**
- [ ] Aumentar velocidad de las paletas (actualmente 5 píxeles/frame)
- [ ] Implementar aceleración progresiva de la pelota
- [ ] Sistema de velocidad dinámica según duración del rally

#### 2. **Física Mejorada**
- [ ] Ángulo de rebote dependiente de la zona de impacto en la paleta
- [ ] Efecto "spin" al golpear con la parte superior/inferior de la paleta
- [ ] Colisiones más precisas en las esquinas

#### 3. **Efectos Visuales**
- [ ] Trail/estela detrás de la pelota
- [ ] Efecto de parpadeo en paletas al recibir punto
- [ ] Animación de explosión cuando termina el juego
- [ ] Partículas al hacer contacto con las paletas

### 🎨 Mejoras de Interfaz (Mediano Plazo)

#### 4. **Sistema de Pausa**
- [ ] Pausar juego con tecla `P` o `ESC`
- [ ] Menú de pausa con opciones (Continuar, Reiniciar, Salir)
- [ ] Mantener el tiempo pausado

#### 5. **Configuración de Juego**
- [ ] Seleccionar número de puntos para ganar (3, 5, 7, 10)
- [ ] Ajustar velocidad inicial de la pelota
- [ ] Cambiar tamaño de las paletas
- [ ] Activar/desactivar el temporizador

#### 6. **Mejoras Visuales**
- [ ] Línea divisoria central del campo (línea punteada)
- [ ] Animación de cuenta regresiva (3, 2, 1, GO!) al iniciar
- [ ] Mostrar "GOAL!" cuando se anota un punto
- [ ] Efectos de color parpadeante en el ganador

### 🎮 Nuevos Modos de Juego (Largo Plazo)

#### 7. **Modo Turbo**
- [ ] La pelota aumenta velocidad cada 10 segundos
- [ ] Pelota se vuelve más pequeña con el tiempo
- [ ] Power-ups aleatorios en el campo

#### 8. **Modo vs CPU**
- [ ] IA básica que sigue la pelota
- [ ] Tres niveles de dificultad (Fácil, Medio, Difícil)
- [ ] IA con reacción imperfecta (más realista)

#### 9. **Modo Práctica**
- [ ] Jugar solo contra la pared
- [ ] Contador de toques consecutivos
- [ ] Sin límite de tiempo

#### 10. **Modo Arcade**
- [ ] Obstáculos en el centro del campo
- [ ] Obstáculos móviles que bloquean la pelota
- [ ] Zonas especiales que cambian dirección de la pelota

### 🔊 Audio y Efectos (Avanzado)

#### 11. **Sistema de Sonido**
- [ ] Beep al golpear la paleta (usando PC Speaker)
- [ ] Sonido diferente al anotar punto
- [ ] Música de fondo simple (opcional)
- [ ] Efecto de sonido al ganar

### 📊 Sistema de Estadísticas

#### 12. **Historial de Partidas**
- [ ] Guardar récord de victorias J1 vs J2
- [ ] Tiempo más largo jugado
- [ ] Rally más largo (más rebotes seguidos)
- [ ] Tabla de clasificación local

#### 13. **Estadísticas en Tiempo Real**
- [ ] Mostrar velocidad actual de la pelota
- [ ] Contador de rebotes en el rally actual
- [ ] Porcentaje de aciertos por jugador

### 🎓 Características Educativas

#### 14. **Modo Tutorial**
- [ ] Explicación interactiva de controles
- [ ] Práctica guiada paso a paso
- [ ] Consejos y estrategias

#### 15. **Comentarios en Código**
- [ ] Documentación detallada de cada procedimiento
- [ ] Diagramas de flujo en comentarios
- [ ] Explicación de interrupciones usadas

### 🌐 Características Online (Ambicioso)

#### 16. **Multijugador Local Mejorado**
- [ ] Soporte para 4 jugadores (2vs2)
- [ ] Modo torneo (eliminatorias)
- [ ] Sistema de handicap (paletas de diferente tamaño)

---

## 💡 Ideas Creativas

### Power-ups (Modo Arcade)
- ⚡ **Rayo**: Aumenta velocidad de tu paleta por 5 segundos
- 🛡️ **Escudo**: Tu paleta se hace más grande temporalmente
- 🎯 **Precisión**: La pelota va directo donde apuntas
- ❄️ **Congelar**: Ralentiza la pelota por 3 segundos
- 🔄 **Invertir**: Invierte los controles del oponente

### Temas Visuales
- 🌃 Modo nocturno (fondo oscuro, colores neón)
- 🌈 Modo arcoíris (paletas cambian de color)
- 👾 Modo retro (estilo Atari 2600)
- 🎄 Tema navideño (paletas como bastones de caramelo)

---

## 📝 Notas Técnicas

### Interrupciones Utilizadas
- **INT 10h**: Servicios de video (dibujar píxeles, cambiar modo, posicionar cursor)
- **INT 16h**: Servicios de teclado (leer teclas presionadas)
- **INT 21h**: Servicios DOS (obtener hora del sistema, salir del programa)

### Modo de Video
- **Modo 13h**: 320x200 píxeles, 256 colores
- Acceso directo a memoria de video para mejor rendimiento

### Optimizaciones
- Uso de saltos condicionales cortos para evitar errores de TASM
- Procedimientos NEAR para permitir CALL desde cualquier parte
- División de código en procedimientos pequeños (<200 bytes)

---

## 👨‍💻 Autor

**Jhojan Cruz**

---

## 📄 Licencia

Este proyecto es de código abierto y está disponible para fines educativos.

---

## 🙏 Agradecimientos

- A la comunidad de Assembly x86
- A los creadores del juego original Pong (Atari, 1972)
- A todos los que contribuyan con ideas y mejoras

---

<div align="center">

### ¿Disfrutaste el proyecto? ⭐

**¡Prueba los dos modos de juego y compite con tus amigos!**

```
    O              O
    |              |
   /|\            /|\
   / \            / \
   
  J1 vs J2 - ¡Que gane el mejor!
```

</div>
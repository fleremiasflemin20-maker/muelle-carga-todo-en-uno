# Muelle de carga "todo en uno" paramétrico

Base de escritorio para celular + reloj + audífonos que usa los **cargadores originales del cliente**
(disco MagSafe/Qi2, disco del reloj y un cable USB-C). Todos los cables salen por atrás.

## Archivos
| Carpeta | Contenido |
|---|---|
| `01_codigo_cad/` | `muelle_carga_todo_en_uno.scad`: modelo paramétrico (Customizer de OpenSCAD y MakerWorld) |
| `02_modelos_stl/` | MC-00 prueba de ajuste · MC-01 MagSafe + Apple Watch + AirPods Pro 2 · MC-02 celular con USB-C fijo · MC-03 compacto sin reloj · MC-04 bicolor (cuerpo + texto) |
| `03_planos/` | Planos A3 en PDF (3 hojas) y PNG |
| `04_renders/` | Muestras R-01 a R-07 |
| `05_documentacion/` | Este archivo |

Diseño original: **Fleremias** · Licencia CC BY-NC-SA 4.0.

## Cómo funciona cada módulo
- **Celular, modo MagSafe/Qi2:** respaldo inclinado 15° con hueco para el disco, canal oculto detrás del celular y ranura que lleva el cable al borde trasero. Sirve para iPhone con MagSafe y Android con funda magnética Qi2.
- **Celular, modo cable USB-C:** el conector se mete desde arriba en un hueco inclinado (paralelo al respaldo) y el cable baja por una ranura abierta por debajo hasta atrás. La base se eleva sola según el largo del conector.
- **Reloj:** torre inclinada con hueco para el disco magnético; ranura bajo el disco para el cable y espacio delante para que cuelgue la correa.
- **Audífonos:** bolsillo a la medida del estuche. En modo cable, el conector USB-C queda fijo apuntando hacia arriba (AirPods de pie). Para estuches con puerto atrás (Galaxy Buds, Pixel Buds) se pueden acostar de espaldas e indicar la huella y el desplazamiento del puerto, o usar "Solo bolsillo".
- Cada disco tiene un agujero trasero para empujarlo hacia afuera.

## Flujo para un pedido
1. Pide al cliente los modelos y, si puedes, mide con calibrador: diámetro y grosor de cada disco, cuerpo del conector USB-C (ancho, grosor, largo sin la punta metálica) y la huella del estuche.
2. Ajusta los valores en el Customizer (pestañas Celular / Reloj / Audífonos / Cables). Los valores "Apple Watch" y "MagSafe" son aproximados: **verifícalos**.
3. Exporta `pieza = Prueba de ajuste` (o usa `MC-00_prueba_de_ajuste.stl`) e imprímela. Los discos deben entrar a presión suave; ajusta `tolerancia` (0.3 a 0.5) si quedan duros o sueltos.
4. Exporta el muelle completo. Para nombre en otro color: exporta `Solo cuerpo` y `Solo texto`, impórtalos juntos en Creality Print como una pieza de varias partes y asigna un filamento a cada una.

## Ajustes de impresión (PLA mate)
- Orientación: tal como sale del modelo (base sobre la cama). **Sin soportes**: los huecos y ranuras son puentes cortos (≤ 5 mm).
- Capa 0.2 mm, boquilla 0.4 mm, 3 perímetros, 4 capas superiores / 3 inferiores, relleno giroide 15 %.
- Boquilla 210–220 °C, cama 55–60 °C, ventilador al 100 % después de la capa 3.
- K2 Plus: perfil "Hyper PLA Matte" (o el PLA mate que uses) a velocidad estándar. SPARKX i7: perfil PLA genérico.
- Multicolor en la K2 Plus (CFS): el texto está en la cara frontal, así que hay cambio de color en cada capa que cruza las letras (más purga). Si quieres ahorrar purga, deja el texto en el mismo color (grabado) o asigna otro color solo a una banda por altura (p. ej. los primeros 3 mm de la base) con el modificador de altura de Creality Print.
- Pega 4 patas de goma de 10 mm en los huecos de abajo.

## Subirlo a MakerWorld
Sube el `.scad` como "Parametric Model" (Customizer). Usa solo la fuente Liberation incluida y no depende de librerías externas.

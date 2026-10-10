// =====================================================================
//  Muelle de carga "todo en uno" paramétrico  (celular + reloj + audífonos)
//  Diseño original: Fleremias · Versión 1.0 · 2026-10-10
//  Modelado CAD paramétrico por código (OpenSCAD, geometría CSG).
//  Licencia: CC BY-NC-SA 4.0 — uso personal libre citando al autor;
//  la venta de piezas impresas requiere permiso de Fleremias.
//  Compatible con el Customizer de OpenSCAD y el de MakerWorld.
//  Se usan los cargadores ORIGINALES del cliente (disco MagSafe / Qi2,
//  disco del reloj y un cable USB-C fijo); la base solo los aloja y
//  ordena los cables, que salen todos por la parte trasera.
//  Medidas en mm. Mide siempre los cargadores reales con calibrador e
//  imprime primero la "Prueba de ajuste" (pestaña Exportar).
// =====================================================================

/* [Celular] */
// Cómo carga el celular
celular_modo = "magsafe"; // [magsafe:MagSafe / Qi2 (disco magnético), cable:Cable USB-C fijo, ninguno:Sin celular]
// Modelo (solo importa el grosor, para el modo cable y la repisa)
celular_modelo = "iphone15"; // [iphone15:iPhone 15 / 16, iphone15pm:iPhone 15 / 16 Pro Max, s24:Galaxy S24 / S25, s24u:Galaxy S24 / S25 Ultra, pixel8:Pixel 8 / 9, custom:Personalizado]
// Grosor del celular si elegiste "Personalizado"
celular_grosor_custom = 8.0; // [5:0.1:14]
// Grosor de la funda por cada lado (0 = sin funda)
funda_grosor = 1.5; // [0:0.1:4]
// Inclinación del respaldo hacia atrás (grados)
respaldo_angulo = 15; // [5:1:30]
// Alto del respaldo (se alarga solo si el disco MagSafe no cabe)
respaldo_alto = 100; // [60:1:160]
// Diámetro del disco MagSafe / Qi2 (Apple MagSafe ≈ 56)
magsafe_diametro = 56.0; // [40:0.1:80]
// Grosor del disco MagSafe / Qi2 (Apple MagSafe ≈ 5.6)
magsafe_grosor = 5.6; // [3:0.1:15]
// Altura del centro del disco medida desde la repisa del celular
magsafe_altura_centro = 72; // [40:1:120]

/* [Reloj] */
// Cómo carga el reloj
reloj_modo = "disco"; // [disco:Cargador de disco magnético, ninguno:Sin reloj]
// Modelo del cargador
reloj_modelo = "apple"; // [apple:Apple Watch (medir),custom:Personalizado]
// Diámetro del disco si elegiste "Personalizado"
reloj_diametro_custom = 30.0; // [15:0.1:60]
// Grosor del disco si elegiste "Personalizado"
reloj_grosor_custom = 8.0; // [3:0.1:20]
// Altura del centro del disco sobre la base (deja colgar la correa)
reloj_altura_centro = 50; // [30:1:90]
// Inclinación de la torre del reloj hacia atrás (grados)
reloj_angulo = 12; // [0:1:30]

/* [Audífonos] */
// Cómo carga el estuche de audífonos
audif_modo = "cable"; // [cable:Cable USB-C por abajo, bolsillo:Solo bolsillo / carga inalámbrica, ninguno:Sin audífonos]
// Modelo de estuche
audif_modelo = "airpodspro2"; // [airpodspro2:AirPods Pro 2 (de pie),airpods4:AirPods 4 (de pie),custom:Personalizado]
// Ancho de la huella del estuche (lado que apoya), si es personalizado
audif_ancho_custom = 60.0; // [20:0.1:90]
// Fondo de la huella del estuche, si es personalizado
audif_fondo_custom = 25.0; // [10:0.1:70]
// Desplazamiento del puerto USB-C respecto al centro (izq/der)
audif_puerto_dx = 0; // [-30:0.1:30]
// Desplazamiento del puerto USB-C respecto al centro (adelante/atrás)
audif_puerto_dy = 0; // [-30:0.1:30]
// Profundidad del bolsillo del estuche
audif_profundidad = 12; // [4:1:30]

/* [Cables y conector USB-C] */
// Diámetro del cable más grueso que se va a usar
cable_diametro = 3.5; // [2:0.1:7]
// Ancho de la "bota" donde el cable sale del disco
cable_bota_ancho = 6.0; // [3:0.1:12]
// Ancho del cuerpo plástico del conector USB-C (medir)
usbc_ancho = 12.5; // [8:0.1:20]
// Grosor del cuerpo plástico del conector USB-C (medir)
usbc_grosor = 6.5; // [4:0.1:12]
// Largo del cuerpo rígido del conector, sin la punta metálica (medir)
usbc_largo = 20; // [8:0.5:40]
// Espacio bajo el conector para que el cable doble
curva_cable = 8; // [4:0.5:20]
// Cuánto sobresale el disco de su hueco (para que haga contacto)
disco_sobresale = 0.8; // [0:0.1:3]

/* [Base y personalización] */
// Fondo de la base
base_fondo = 95; // [70:1:150]
// Alto de la base
base_alto = 12; // [8:0.5:25]
// Radio de las esquinas
radio_esquinas = 8; // [1:0.5:20]
// Separación entre módulos
separacion = 6; // [0:0.5:20]
// Huecos para patas de goma de 10 mm
patas_goma = true;
// Texto en el frente (nombre del cliente, marca…). Vacío = sin texto
texto = "";
// Alto de las letras
texto_tamano = 7; // [3:0.5:15]
// Fuente
texto_fuente = "Liberation Sans:style=Bold";
// Profundidad del texto incrustado
texto_profundidad = 0.8; // [0.4:0.2:2]
// Holgura general de ajuste
tolerancia = 0.4; // [0:0.05:1]

/* [Exportar] */
// Qué pieza generar. Para multicolor exporta "cuerpo" y "texto" y únelos en el slicer
pieza = "todo"; // [todo:Todo junto,cuerpo:Solo cuerpo,texto:Solo texto (2º color),prueba:Prueba de ajuste (imprimir primero)]

/* [Hidden] */
$fa = 4;
$fs = 0.5;
e = 0.01;

// ------------------------- datos derivados ---------------------------
function celular_grosor() =
    celular_modelo == "iphone15"   ? 7.8  :
    celular_modelo == "iphone15pm" ? 8.25 :
    celular_modelo == "s24"        ? 7.6  :
    celular_modelo == "s24u"       ? 8.6  :
    celular_modelo == "pixel8"     ? 8.9  : celular_grosor_custom;

ph  = celular_modo != "ninguno";
mag = celular_modo == "magsafe";
pc  = celular_modo == "cable";
wa  = reloj_modo != "ninguno";
au  = audif_modo != "ninguno";
auc = audif_modo == "cable";

cs   = cable_diametro + 0.6;            // ancho de ranura de cable
uw   = usbc_ancho + tolerancia;
ut   = usbc_grosor + tolerancia;

// --- celular
pa       = respaldo_angulo;
p_tot    = celular_grosor() + 2 * funda_grosor;
repisa   = p_tot + 1.5;                 // ancho de la repisa
p_py     = -(funda_grosor + celular_grosor() / 2);   // eje del puerto (modo cable)
p_zb     = p_py * tan(pa) - usbc_largo;               // fondo del conector (modo cable)
// labio delantero (en modo cable se engrosa para dejar 3 mm de pared delante del conector)
lab_t    = pc ? max(4, 3 - repisa - ((p_py - (usbc_grosor + tolerancia) / 2) * cos(pa) + p_zb * sin(pa))) : 4;
lab_h    = 8;
ys       = lab_t + repisa;              // pie del respaldo
mag_d    = magsafe_diametro + tolerancia;
mag_p    = magsafe_grosor - disco_sobresale;
resp_t   = mag ? max(magsafe_grosor + 3.5, 8) : 8;
resp_h   = mag ? max(respaldo_alto, magsafe_altura_centro + mag_d / 2 + 8) : respaldo_alto;
p_w      = mag ? max(mag_d + 16, 66) : 66;
repisa_z = pc ? max(base_alto, usbc_largo * cos(pa) + curva_cable) : base_alto;

// --- reloj
w_d  = (reloj_modelo == "apple" ? 27.5 : reloj_diametro_custom) + tolerancia;
w_g  = reloj_modelo == "apple" ? 7.0 : reloj_grosor_custom;
w_p  = w_g - disco_sobresale;
wa_a = reloj_angulo;
t_w  = w_d + 14;
t_d  = max(w_p + 4, 10);
t_h  = reloj_altura_centro + w_d / 2 + 8;
t_y  = max(base_fondo - 8 - t_d - t_h * sin(wa_a), 15);

// --- audífonos
a_w    = (audif_modelo == "airpodspro2" ? 60.6 : audif_modelo == "airpods4" ? 50.1 : audif_ancho_custom) + tolerancia * 2;
a_f    = (audif_modelo == "airpodspro2" ? 21.7 : audif_modelo == "airpods4" ? 21.2 : audif_fondo_custom) + tolerancia * 2;
a_par  = 3.5;
a_sw   = a_w + 2 * a_par;
a_piso = auc ? max(base_alto, usbc_largo + curva_cable) : base_alto;
a_top  = a_piso + audif_profundidad;
a_yc   = base_fondo / 2;

// --- distribución en fila: celular | reloj | audífonos
m   = 4;
x_p = m;
x_w = x_p + (ph ? p_w + separacion : 0);
x_a = x_w + (wa ? t_w + separacion : 0);
W   = x_a + (au ? a_sw : -separacion) + m;
D   = base_fondo;

// ---------------------------- utilidades -----------------------------
module huella() offset(r = radio_esquinas) offset(delta = -radio_esquinas) square([W, D]);

module rrect(w, d, r) translate([-w / 2, -d / 2]) offset(r = r) offset(delta = -r) square([w, d]);

module marco_respaldo() translate([0, ys, repisa_z]) rotate([-pa, 0, 0]) children();
module marco_torre()    translate([0, t_y, base_alto]) rotate([-wa_a, 0, 0]) children();

// ------------------------------ celular ------------------------------
module celular_pos() translate([x_p, 0, 0]) {
    if (repisa_z > base_alto) cube([p_w, ys + resp_t + 8, repisa_z]);
    cube([p_w, lab_t, repisa_z + lab_h]);                         // labio
    marco_respaldo() translate([0, 0, -repisa_z - 10]) cube([p_w, resp_t, resp_h + repisa_z + 10]);
    hull() {                                                      // refuerzo trasero
        marco_respaldo() translate([0, resp_t - 1, 0]) cube([p_w, 1, 30]);
        translate([0, ys + resp_t, 0]) cube([p_w, 22, repisa_z]);
    }
}

module celular_neg() translate([x_p, 0, 0]) {
    cx = p_w / 2;
    if (mag) {
        marco_respaldo() {
            translate([cx, -1, magsafe_altura_centro]) rotate([-90, 0, 0]) cylinder(d = mag_d, h = mag_p + 1);
            translate([cx, 0, magsafe_altura_centro]) rotate([-90, 0, 0]) cylinder(d = 18, h = 60);   // empujar disco
            translate([cx - cable_bota_ancho / 2, -1, magsafe_altura_centro - mag_d / 2 - 8])
                cube([cable_bota_ancho, mag_p + 1, 10]);                                           // salida del cable
            translate([cx - cs / 2, -1, -6]) cube([cs, cs + 1, magsafe_altura_centro]);           // canal oculto tras el celular
        }
        translate([cx - cs / 2, ys - 3, -1]) cube([cs, D, repisa_z + 9]);                          // pasa al fondo
    }
    if (pc) {
        py = p_py;
        zb = p_zb;
        marco_respaldo() translate([cx - uw / 2, py - ut / 2, zb]) cube([uw, ut, usbc_largo + 30]);
        yb = ys + py * cos(pa) + zb * sin(pa);
        zw = repisa_z - usbc_largo * cos(pa);
        translate([cx - cs / 2, yb - ut / 2, -1]) cube([cs, D, zw + 1.5]);                         // cable por debajo
    }
}

// ------------------------------- reloj -------------------------------
module reloj_pos() translate([x_w, 0, 0])
    marco_torre() translate([0, 0, -base_alto - 10]) cube([t_w, t_d, t_h + base_alto + 10]);

module reloj_neg() translate([x_w, 0, 0]) {
    cx = t_w / 2;
    marco_torre() {
        translate([cx, -1, reloj_altura_centro]) rotate([-90, 0, 0]) cylinder(d = w_d, h = w_p + 1);
        translate([cx, 0, reloj_altura_centro]) rotate([-90, 0, 0]) cylinder(d = 10, h = 40);
        translate([cx - cable_bota_ancho / 2, -1, reloj_altura_centro - w_d / 2 - 8]) cube([cable_bota_ancho, w_p + 1, 10]);
        translate([cx - cs / 2, -1, -base_alto - 2]) cube([cs, t_d + 2, reloj_altura_centro + base_alto + 2]);
    }
    translate([cx - cs / 2, t_y, -1]) cube([cs, D, base_alto + 2]);
}

// ----------------------------- audífonos -----------------------------
module audif_pos() translate([x_a + a_sw / 2, a_yc, 0])
    linear_extrude(a_top) rrect(a_sw, a_f + 2 * a_par, min(8, a_f / 2));

module audif_neg() translate([x_a + a_sw / 2, a_yc, 0]) {
    translate([0, 0, a_piso]) linear_extrude(audif_profundidad + 1) rrect(a_w, a_f, min(6, a_f / 2 - 0.5));
    if (auc) translate([audif_puerto_dx, audif_puerto_dy, 0]) {
        translate([-uw / 2, -ut / 2, a_piso - usbc_largo]) cube([uw, ut, usbc_largo + 1]);
        translate([-cs / 2, -ut / 2, -1]) cube([cs, D, a_piso - usbc_largo + 1.5]);
    }
}

// ------------------------------ comunes ------------------------------
module patas() for (p = [[14, 14], [W - 14, 14], [14, D - 14], [W - 14, D - 14]])
    translate([p[0], p[1], -1]) cylinder(d = 10.5, h = 1 + 1.2);

module texto_sol(prof) translate([W / 2, prof, base_alto / 2]) rotate([90, 0, 0])
    linear_extrude(prof) text(texto, size = texto_tamano, font = texto_fuente, halign = "center", valign = "center");

module cuerpo() difference() {
    intersection() {
        union() {
            linear_extrude(base_alto) huella();
            if (ph) celular_pos();
            if (wa) reloj_pos();
            if (au) audif_pos();
        }
        linear_extrude(400) huella();
    }
    if (ph) celular_neg();
    if (wa) reloj_neg();
    if (au) audif_neg();
    if (patas_goma) patas();
    if (texto != "") translate([0, -1, 0]) texto_sol(texto_profundidad + 1);
}

// ---------------------- prueba de ajuste rápida ----------------------
module prueba() {
    piso = 1.2;
    if (mag) difference() {
        cylinder(d = mag_d + 8, h = mag_p + piso);
        translate([0, 0, piso]) cylinder(d = mag_d, h = 20);
        translate([0, 0, -1]) cylinder(d = 18, h = 20);
        translate([-cable_bota_ancho / 2, -mag_d / 2 - 10, piso]) cube([cable_bota_ancho, 10, 20]);
    }
    if (wa) translate([mag_d / 2 + w_d / 2 + 14, 0, 0]) difference() {
        cylinder(d = w_d + 8, h = w_p + piso);
        translate([0, 0, piso]) cylinder(d = w_d, h = 20);
        translate([0, 0, -1]) cylinder(d = 10, h = 20);
        translate([-cable_bota_ancho / 2, -w_d / 2 - 10, piso]) cube([cable_bota_ancho, 10, 20]);
    }
    if (pc || auc) translate([mag_d / 2 + w_d + 32, 0, 0]) difference() {
        translate([-uw / 2 - 3, -ut / 2 - 3, 0]) cube([uw + 6, ut + 6, 12]);
        translate([-uw / 2, -ut / 2, 4]) cube([uw, ut, 20]);
        translate([-cs / 2, -ut / 2 - 4, -1]) cube([cs, ut + 8 , 5.5]);
    }
    if (au) translate([0, -max(mag_d, w_d) / 2 - a_f / 2 - 14, 0]) difference() {
        linear_extrude(5) rrect(a_w + 6, a_f + 6, min(8, a_f / 2));
        translate([0, 0, -1]) linear_extrude(7) rrect(a_w, a_f, min(6, a_f / 2 - 0.5));
    }
}

// ------------------------------- salida ------------------------------
if (pieza == "todo") {
    cuerpo();
    if (texto != "") color("white") texto_sol(texto_profundidad);
} else if (pieza == "cuerpo") cuerpo();
else if (pieza == "texto") { if (texto != "") texto_sol(texto_profundidad); }
else if (pieza == "prueba") prueba();

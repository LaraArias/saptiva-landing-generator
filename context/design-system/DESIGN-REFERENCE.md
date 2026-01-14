# Saptiva Design Reference

Guía de referencia para crear landing pages con el estilo visual de Saptiva.

> **Para agentes:** Las imágenes en `/reference` son ejemplos visuales del sitio actual. Úsalas para validar que tu output sigue el estilo correcto.

---

## Estructura de este directorio

```
/saptiva-design-system
  /reference
    01-hero-dark-3d-map.png      # Hero con ilustración 3D del mapa de LATAM
    02-cards-light-features.png   # Sección clara con cards de features
    03-cards-dark-illustrations.png # Cards oscuras con ilustraciones
    04-diagram-concentric.png     # Diagrama de círculos concéntricos
    05-hero-dark-3d-cubes.png     # Hero con ilustración 3D de cubos
    06-cards-dark-line-art.png    # Cards oscuras con arte de línea
    07-team-section.png           # Sección de equipo con fotos tratadas
    08-hero-dark-latam-map.png    # Hero con mapa outline de LATAM
  /assets
    logo-color.png                # Logo Saptiva AI (fondo claro)
  DESIGN-REFERENCE.md             # Este documento
```

---

## Identidad Visual

**Personalidad:** Técnico, confiable, regional (LATAM), enterprise pero moderno.

**Sensación general:** Un producto de infraestructura serio que no se siente corporativo aburrido. Oscuro con acentos brillantes. Limpio, modular, geométrico.

---

## Colores

```css
:root {
  /* Primario - usar para acentos, CTAs, highlights */
  --primary: #00E5B0;
  --primary-hover: #00C99A;
  --primary-dark: #00A896;      /* texto turquesa sobre fondo claro */
  --primary-glow: #00FFD0;      /* highlights en elementos 3D */
  
  /* Fondos */
  --bg-dark: #0B1426;           /* secciones oscuras */
  --bg-dark-card: #0F1A2E;      /* cards sobre fondo oscuro */
  --bg-light: #F5F7FA;          /* secciones claras */
  --bg-white: #FFFFFF;          /* cards sobre fondo claro */
  
  /* Texto */
  --text-dark: #0B1426;         /* sobre fondo claro */
  --text-gray: #4A5568;         /* párrafos sobre claro */
  --text-white: #FFFFFF;        /* sobre fondo oscuro */
  --text-muted: #A0AEC0;        /* secundario sobre oscuro */
  
  /* Bordes y líneas */
  --border-dark: #1A2744;
  --border-light: #E2E8F0;
}
```

**Regla simple:** El turquesa (#00E5B0) es el ÚNICO color de acento. Nunca usar otros colores brillantes.

---

## Tipografía

**Fuente:** Inter (Google Fonts)

```css
font-family: 'Inter', -apple-system, BlinkMacSystemFont, sans-serif;
```

**Escala práctica:**
- Títulos hero: 56px, bold (700)
- Títulos de sección: 40px, bold
- Títulos de card: 20-24px, semibold (600)
- Subtítulos destacados: 18px, medium (500), color turquesa
- Cuerpo: 16px, regular (400)
- Pequeño: 14px

**Patrón de títulos:** En títulos principales, UNA palabra clave va en turquesa. Esa palabra representa el beneficio o diferenciador principal.

```
"Your AI, on your [terms]"         ← turquesa en "terms"
"Built for [Control]"              ← turquesa en "Control"  
"Deploy AI [Anywhere]"             ← turquesa en "Anywhere"
```

---

## Layout y Estructura

### Patrón de secciones

Las páginas alternan entre secciones oscuras y claras:

```
[Hero - OSCURO]
[Features - CLARO]
[Arquitectura/Técnico - OSCURO]
[Beneficios - CLARO]
[Testimonial - OSCURO]
[CTA - OSCURO]
```

**Regla:** Nunca dos secciones oscuras seguidas. El contraste crea ritmo.

> **Ver referencia:** `01-hero-dark-3d-map.png` y `02-cards-light-features.png` muestran esta alternancia.

### Espaciado

- Padding de secciones: 80-120px vertical
- Gap entre cards: 24-32px
- Padding interno de cards: 32px
- Contenedor máximo: 1280px

### Grids comunes

- 3 columnas para feature cards
- 2 columnas para contenido + ilustración
- 4 columnas para features pequeños/iconos

---

## Componentes

### Botón primario
```css
.btn-primary {
  background: #00E5B0;
  color: #0B1426;
  padding: 14px 28px;
  border-radius: 8px;
  font-weight: 500;
  border: none;
}
```

### Botón secundario (outline)
```css
.btn-secondary {
  background: transparent;
  color: #00E5B0;
  padding: 14px 28px;
  border-radius: 8px;
  border: 1px solid #00E5B0;
}
```

### Card clara (sobre fondo gris/blanco)

> **Ver referencia:** `02-cards-light-features.png`

```css
.card-light {
  background: white;
  border: 1px solid #E2E8F0;
  border-radius: 12px;
  padding: 32px;
}
/* Título de card en turquesa oscuro (#00A896) */
/* Icono en caja con fondo #E6FFF9 y border-radius 12px */
```

**Estructura de card clara:**
1. Icono en caja cuadrada con fondo turquesa muy claro
2. Título en turquesa oscuro (#00A896)
3. Descripción en gris (#4A5568)
4. Sin bordes de color, solo gris sutil

### Card oscura (sobre fondo oscuro)

> **Ver referencia:** `03-cards-dark-illustrations.png` y `06-cards-dark-line-art.png`

```css
.card-dark {
  background: #0F1A2E;
  border: 1px solid #1A2744;
  border-radius: 12px;
  padding: 32px;
  /* Agregar patrón de grid como background */
}
/* Título en turquesa brillante (#00E5B0) */
/* Texto en blanco */
```

**Estructura de card oscura:**
1. Título en turquesa (#00E5B0)
2. Descripción en blanco
3. Ilustración de línea o icono en la parte inferior
4. Grid pattern sutil como fondo

### Grid decorativo de fondo
```css
.grid-pattern {
  background-image: 
    linear-gradient(rgba(26,39,68,0.5) 1px, transparent 1px),
    linear-gradient(90deg, rgba(26,39,68,0.5) 1px, transparent 1px);
  background-size: 32px 32px;
}
```

---

## Estilo de Ilustraciones

Saptiva usa dos tipos de ilustraciones. No mezclarlos en la misma sección.

### Tipo 1: Ilustraciones 3D Isométricas

> **Ver referencia:** `01-hero-dark-3d-map.png`, `05-hero-dark-3d-cubes.png`

**Cuándo usar:** Hero sections, conceptos de infraestructura, representación de LATAM.

**Características:**
- Construidas con cubos/bloques en perspectiva isométrica (ángulo 30°)
- Paleta: gradiente de turquesa - cara superior más brillante (#00FFD0), frontal media (#00E5B0), lateral oscura (#00A896)
- Cubos pequeños flotando alrededor como partículas en grises oscuros (#2D3748)
- Siempre sobre fondo oscuro (#0B1426)
- Sensación: modular, técnico, construcción digital

**Ejemplos específicos del sitio:**
- **Mapa de LATAM en voxels:** Silueta del continente construida con cubos. México arriba, Centroamérica delgado, Sudamérica expandiéndose. Cubos sueltos flotando alrededor.
- **Estructura de cubos modulares:** Cubos apilados formando estructura abstracta tipo "edificio". Iconos pequeños (chat, documento, búsqueda) flotando conectados con líneas finas.
- **Cubo explotado:** Cubo grande (4x4x4) con piezas separándose, revelando interior. Representa experimentación/lab.

### Tipo 2: Diagramas e ilustraciones de línea

> **Ver referencia:** `06-cards-dark-line-art.png`, `04-diagram-concentric.png`

**Cuándo usar:** Explicar arquitectura, flujos, conexiones entre sistemas, dentro de cards.

**Características:**
- Líneas de 1.5-2px de grosor
- Color: turquesa (#00E5B0) sobre oscuro, o gris/negro sobre claro
- Sin fills sólidos (outline/stroke only)
- Iconos simples en nodos conectados
- Conexiones con líneas rectas o curvas suaves

**Ejemplos específicos del sitio:**
- **Servidor/rack:** Rectángulo vertical con líneas horizontales (slots), pequeños cuadrados como LEDs turquesa. A veces con círculo o arco alrededor.
- **Flujo con ondas:** Dos nodos (servidores) conectados por líneas onduladas paralelas. Representa transferencia de datos.
- **Diagrama de nodos:** Nodo central (frIdA) con líneas conectando a nodos superiores (inputs) e inferiores (outputs). Líneas rectas con curvas en esquinas.
- **Balanza:** Estructura de balanza de justicia con iconos en los platos. Para casos de uso legal/compliance.
- **Edificio:** Icono de edificio institucional para gobierno/banca.
- **Hexágono con agente:** Hexágono outline con icono de agente/robot adentro, líneas saliendo hacia otros nodos.

### Iconos

- Estilo: línea/outline, no sólidos
- Grosor: 1.5px
- Color: turquesa sobre oscuro, turquesa oscuro sobre claro
- Cuando van en cards claras: ponerlos en caja cuadrada con fondo #E6FFF9 y border-radius 12px
- Set recomendado: Lucide Icons o Phosphor Icons

---

## Fotografía de Equipo

> **Ver referencia:** `07-team-section.png`

Tratamiento para fotos de personas:

1. Imagen base convertida a escala de grises
2. Overlay turquesa semitransparente encima (blend mode multiply, ~30-40% opacidad)
3. Marco decorativo: borde turquesa (2px) desplazado 8px hacia abajo-derecha, creando efecto de sombra offset
4. Foto en contenedor con border-radius 8px

```css
.team-photo-container {
  position: relative;
}

.team-photo {
  filter: grayscale(100%);
  border-radius: 8px;
}

.team-photo-overlay {
  position: absolute;
  inset: 0;
  background: rgba(0, 229, 176, 0.35);
  mix-blend-mode: multiply;
  border-radius: 8px;
}

.team-photo-frame {
  position: absolute;
  inset: 8px -8px -8px 8px;
  border: 2px solid #00E5B0;
  border-radius: 8px;
  z-index: -1;
}
```

---

## Navegación

```css
.nav {
  /* Transparente sobre hero */
  padding: 16px 48px;
  display: flex;
  justify-content: space-between;
  align-items: center;
}

.nav-link {
  color: white; /* o #0B1426 sobre fondo claro */
  font-size: 15px;
  font-weight: 500;
  text-decoration: none;
}

.nav-link:hover,
.nav-link.active {
  color: #00E5B0;
}
```

**Logo:** Usar `assets/logo-color.png`. Sobre fondo oscuro el logo se ve con "SAPTIVA" en turquesa y "AI" en blanco.

---

## Qué NO hacer

1. **No usar otros colores de acento** - solo turquesa
2. **No usar gradientes en UI** - solo en ilustraciones 3D
3. **No centrar texto en cards** - siempre alinear izquierda
4. **No usar fotos de stock** - solo ilustraciones o fotos reales tratadas
5. **No poner ilustraciones 3D sobre fondo claro** - siempre sobre oscuro
6. **No usar sombras de color** - solo sombras negras/grises sutiles
7. **No usar border-radius mayor a 16px** - mantener geométrico
8. **No mezclar estilos de ilustración** en la misma sección
9. **No hacer cards sin estructura clara** - siempre icono/título/descripción
10. **No usar tipografías decorativas** - solo Inter

---

## Ejemplos de Secciones Completas

### Hero típico

> **Ver referencia:** `01-hero-dark-3d-map.png`, `05-hero-dark-3d-cubes.png`

```
[Fondo oscuro #0B1426 + grid pattern]
[Nav transparente con logo a la izquierda, links al centro, botones a la derecha]
[Layout 2 columnas]
  [Columna izquierda]
    - Título grande (56px) - palabra clave en turquesa
    - Subtítulo en turquesa (18px, una o dos líneas)
    - Párrafo descriptivo en blanco (16px, 2-3 líneas)
    - Botón primario + botón secundario (inline)
  [Columna derecha]
    - Ilustración 3D isométrica
```

### Sección de features (fondo claro)

> **Ver referencia:** `02-cards-light-features.png`

```
[Fondo gris #F5F7FA]
[Título centrado - palabra clave en turquesa]
[Párrafo centrado - descripción breve]
[Grid de 3-4 cards claras]
  Cada card:
    - Icono en caja turquesa clara (56x56px)
    - Título turquesa oscuro (#00A896)
    - Descripción gris (#4A5568)
```

### Sección técnica (fondo oscuro)

> **Ver referencia:** `03-cards-dark-illustrations.png`, `06-cards-dark-line-art.png`

```
[Fondo oscuro #0B1426 + grid pattern]
[Título centrado - palabra clave en turquesa]
[Párrafo centrado en blanco]
[Grid de 2-3 cards oscuras]
  Cada card:
    - Título turquesa (#00E5B0)
    - Descripción blanca
    - Ilustración de línea en la mitad inferior
    - Grid pattern como fondo de card
```

### Sección de equipo

> **Ver referencia:** `07-team-section.png`

```
[Fondo gris #F5F7FA + grid pattern sutil]
[Título centrado - palabra clave en turquesa]
[Párrafo centrado]
[Grid de 3 columnas x 2 filas para 6 personas]
  Cada miembro:
    - Foto con tratamiento (grayscale + overlay turquesa + frame offset)
    - Nombre en turquesa (#00A896)
    - Cargo en gris
    - Icono de LinkedIn en turquesa
```

### Testimonial

```
[Fondo oscuro #0B1426 + grid pattern]
[Contenedor centrado max-width 800px]
  - Quote en blanco, 24px, font-weight 400
  - Nombre en turquesa, 18px, bold
  - Cargo/empresa en turquesa, 16px
[Flechas de navegación turquesa a los lados (chevron icons)]
```

---

## Resumen Rápido

| Elemento | Valor |
|----------|-------|
| Color primario | #00E5B0 |
| Color primario (texto sobre claro) | #00A896 |
| Fondo oscuro | #0B1426 |
| Fondo cards oscuras | #0F1A2E |
| Fondo claro | #F5F7FA |
| Texto sobre oscuro | #FFFFFF |
| Texto sobre claro | #0B1426 (títulos), #4A5568 (cuerpo) |
| Fuente | Inter |
| Border radius cards | 12px |
| Border radius botones | 8px |
| Estilo de iconos | Outline, 1.5px stroke |
| Ilustraciones hero | 3D isométricas con cubos turquesa |
| Ilustraciones cards | Línea/outline, diagramas de nodos |

# Frontend Style Guide - Saptiva Landings

> **Fuente**: Basado en `/context/design-system/DESIGN-REFERENCE.md`
> **Personalidad**: Técnico, confiable, regional (LATAM), enterprise pero moderno.

## Stack Tecnológico
- HTML5 semántico
- CSS3 con custom properties
- JavaScript vanilla (sin frameworks)
- Google Fonts: Inter

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

  /* Iconos */
  --icon-box-bg: #E6FFF9;
}
```

**Regla**: El turquesa (#00E5B0) es el ÚNICO color de acento. Nunca usar otros colores brillantes.

---

## Tipografía

```css
@import url('https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap');

:root {
  --font-family: 'Inter', -apple-system, BlinkMacSystemFont, sans-serif;
}
```

### Escala

| Elemento | Tamaño | Peso | Notas |
|----------|--------|------|-------|
| Título hero | 56px | 700 (bold) | Una palabra en turquesa |
| Título sección | 40px | 700 (bold) | Una palabra en turquesa |
| Título card | 20-24px | 600 (semibold) | Turquesa sobre oscuro, turquesa oscuro sobre claro |
| Subtítulo destacado | 18px | 500 (medium) | Color turquesa |
| Cuerpo | 16px | 400 (regular) | |
| Pequeño | 14px | 400 | |
| Navegación | 15px | 500 | |

### Patrón de títulos
En títulos principales, UNA palabra clave va en turquesa:
```
"Your AI, on your [terms]"         ← turquesa en "terms"
"Built for [Control]"              ← turquesa en "Control"
"Deploy AI [Anywhere]"             ← turquesa en "Anywhere"
```

---

## Layout

### Patrón de secciones (Alternancia)
```
[Hero - OSCURO]
[Features - CLARO]
[Arquitectura/Técnico - OSCURO]
[Beneficios - CLARO]
[Testimonial - OSCURO]
[CTA - OSCURO]
```

**Regla**: Nunca dos secciones oscuras seguidas. El contraste crea ritmo.

### Espaciado
- Padding de secciones: 80-120px vertical
- Gap entre cards: 24-32px
- Padding interno de cards: 32px
- Contenedor máximo: 1280px

### Grids comunes
- 3-4 columnas para feature cards
- 2 columnas para contenido + ilustración
- 4 columnas para features pequeños/iconos

### Responsive Breakpoints
```css
/* Mobile first - Default: < 640px */

/* Tablet */
@media (min-width: 640px) { }

/* Desktop */
@media (min-width: 1024px) { }

/* Large desktop */
@media (min-width: 1280px) { }
```

---

## Componentes

### Botón Primario
```css
.btn-primary {
  background: #00E5B0;
  color: #0B1426;
  padding: 14px 28px;
  border-radius: 8px;
  font-weight: 500;
  border: none;
  cursor: pointer;
  transition: background 0.2s ease;
}

.btn-primary:hover {
  background: #00C99A;
}
```

### Botón Secundario (Outline)
```css
.btn-secondary {
  background: transparent;
  color: #00E5B0;
  padding: 14px 28px;
  border-radius: 8px;
  border: 1px solid #00E5B0;
  font-weight: 500;
  cursor: pointer;
  transition: all 0.2s ease;
}

.btn-secondary:hover {
  background: rgba(0, 229, 176, 0.1);
}
```

### Card Clara (sobre fondo gris/blanco)
```css
.card-light {
  background: white;
  border: 1px solid #E2E8F0;
  border-radius: 12px;
  padding: 32px;
}

.card-light .icon-box {
  width: 56px;
  height: 56px;
  background: #E6FFF9;
  border-radius: 12px;
  display: flex;
  align-items: center;
  justify-content: center;
}

.card-light h3 {
  color: #00A896;
  font-size: 20px;
  font-weight: 600;
}

.card-light p {
  color: #4A5568;
}
```

### Card Oscura (sobre fondo oscuro)
```css
.card-dark {
  background: #0F1A2E;
  border: 1px solid #1A2744;
  border-radius: 12px;
  padding: 32px;
  position: relative;
}

/* Grid pattern de fondo */
.card-dark::before {
  content: '';
  position: absolute;
  inset: 0;
  background-image:
    linear-gradient(rgba(26,39,68,0.5) 1px, transparent 1px),
    linear-gradient(90deg, rgba(26,39,68,0.5) 1px, transparent 1px);
  background-size: 32px 32px;
  border-radius: 12px;
  pointer-events: none;
}

.card-dark h3 {
  color: #00E5B0;
  font-size: 20px;
  font-weight: 600;
}

.card-dark p {
  color: #FFFFFF;
}
```

### Grid Pattern de Fondo
```css
.grid-pattern {
  background-image:
    linear-gradient(rgba(26,39,68,0.5) 1px, transparent 1px),
    linear-gradient(90deg, rgba(26,39,68,0.5) 1px, transparent 1px);
  background-size: 32px 32px;
}
```

### Navegación
```css
.nav {
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
  transition: color 0.2s ease;
}

.nav-link:hover,
.nav-link.active {
  color: #00E5B0;
}
```

---

## Ilustraciones

### Tipo 1: 3D Isométricas (Heroes)
- Construidas con cubos en perspectiva isométrica (30°)
- Paleta: gradiente turquesa (glow #00FFD0, main #00E5B0, shadow #00A896)
- Cubos flotantes como partículas en grises (#2D3748)
- SOLO sobre fondo oscuro
- Uso: Hero sections, representación LATAM

### Tipo 2: Diagramas de línea (Cards)
- Líneas de 1.5-2px
- Color: turquesa (#00E5B0) sobre oscuro
- Sin fills sólidos (outline only)
- Iconos simples conectados con líneas
- Uso: Dentro de cards, flujos, arquitectura

### Iconos
- Estilo: línea/outline, NO sólidos
- Grosor: 1.5px
- Color sobre oscuro: #00E5B0
- Color sobre claro: #00A896
- En cards claras: ponerlos en caja cuadrada #E6FFF9, border-radius 12px
- Set recomendado: Lucide Icons o Phosphor Icons

---

## Fotografía de Equipo

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

## Accesibilidad

### Obligatorio
- Contraste mínimo 4.5:1 para texto
- Focus visible en elementos interactivos
- Alt text en todas las imágenes
- Estructura de headings correcta (h1 → h2 → h3)
- Labels en formularios

### Recomendado
- Skip links
- ARIA labels donde sea necesario
- `prefers-reduced-motion` para animaciones

---

## Performance

### Imágenes
- Formato WebP con fallback PNG
- Lazy loading para below the fold
- Tamaños responsivos con srcset

### CSS/JS
- CSS crítico inline en head
- JS defer o al final del body
- Minificar en producción

---

## Qué NO Hacer

1. **No usar otros colores de acento** - solo turquesa
2. **No usar gradientes en UI** - solo en ilustraciones 3D
3. **No centrar texto en cards** - siempre alinear izquierda
4. **No usar fotos de stock** - solo ilustraciones o fotos tratadas
5. **No poner ilustraciones 3D sobre fondo claro** - siempre sobre oscuro
6. **No usar sombras de color** - solo sombras negras/grises sutiles
7. **No usar border-radius > 16px** - mantener geométrico
8. **No mezclar estilos de ilustración** en la misma sección
9. **No hacer cards sin estructura clara** - siempre icono/título/descripción
10. **No usar tipografías decorativas** - solo Inter

---

## Referencia Visual

Ver imágenes en `/context/design-system/reference/`:
- `01-hero-dark-3d-map.png` - Hero con mapa LATAM 3D
- `02-cards-light-features.png` - Cards claras con iconos
- `03-cards-dark-illustrations.png` - Cards oscuras con ilustraciones
- `04-diagram-concentric.png` - Sección compliance/seguridad
- `05-hero-dark-3d-cubes.png` - Hero con cubos 3D
- `06-cards-dark-line-art.png` - Cards con diagramas de línea
- `07-team-section.png` - Fotos de equipo tratadas
- `08-hero-dark-latam-map.png` - Hero con mapa outline LATAM

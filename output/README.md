# Saptiva Landing Pages

Landing pages de producción para Saptiva AI.

---

## El Problema

Saptiva necesita landing pages que:

1. **Hablen diferente a cada segmento** - Enterprise (financial services) tiene un driver diferente (Time to Value) que Gobierno (IA Soberana)
2. **Mantengan consistencia de marca** - Colores, tipografía y tono deben ser coherentes
3. **Sean trazables** - Todo el copy debe venir de documentos de negocio verificados, no inventado
4. **Escalen** - Agregar nuevos verticales no debe requerir rediseñar desde cero

---

## Decisiones Tomadas

### 1. Arquitectura de Páginas

| Página | Propósito | Audiencia |
|--------|-----------|-----------|
| `/home/` | Landing principal, introduce Saptiva | Todos los visitantes |
| `/demo/` | Formulario de contacto para agendar demo | Leads calificados |
| `/financial-services/` | Landing vertical enterprise | CTOs, VPs Engineering sector financiero |
| `/gobierno/` | Landing vertical gobierno | CTOs sector público, responsables de TI |

**Por qué:** Cada segmento tiene preocupaciones diferentes. Enterprise quiere velocidad (2 semanas a producción). Gobierno quiere control (IA soberana, datos en su jurisdicción).

### 2. Design System

```css
--primary: #00E5B0        /* Turquesa - único color de acento */
--bg-dark: #0B1426        /* Fondo oscuro principal */
--bg-light: #F5F7FA       /* Fondo claro */
--font-family: 'Inter'    /* Tipografía única */
```

**Por qué:**
- Un solo color de acento (#00E5B0) crea identidad visual fuerte y reconocible
- Alternancia oscuro/claro entre secciones crea ritmo visual
- Inter es legible, moderna y profesional

### 3. CTAs Diferenciados por Segmento

| Segmento | CTA Principal | Razón |
|----------|---------------|-------|
| Home | "Agenda una demo" | Genérico, aplica a todos |
| Financial Services | "Acelera tu time-to-value" | Refleja el driver de velocidad |
| Gobierno | "Agenda una sesión de arquitectura" | Refleja el driver de control técnico |

**Por qué:** Los CTAs genéricos ("Solicita demo", "Contáctanos") no convierten. El CTA debe reflejar el outcome que busca el visitante.

### 4. Formulario Simple

Campos del formulario de contacto:
- Nombre
- Apellido
- Correo corporativo
- Teléfono (con código de país LATAM)
- Empresa

**Por qué:**
- "Correo corporativo" filtra leads personales (gmail, hotmail)
- Código de país pre-selecciona México (+52) porque es el mercado principal
- Sin campo "mensaje" porque genera fricción y raramente aporta valor

### 5. Social Proof con Métricas

En lugar de logos de clientes (que requieren permisos), usamos métricas:
- "9+ empresas en producción"
- "2 semanas de kickoff a valor"
- "100% datos en tu jurisdicción"

**Por qué:** Las métricas son verificables y no requieren autorización legal de terceros.

---

## Estructura de Archivos

```
/
├── index.html              # Redirect a /home/
├── home/
│   ├── index.html          # Landing principal
│   └── assets/             # Imágenes y SVGs
├── demo/
│   └── index.html          # Formulario de contacto
├── financial-services/
│   ├── index.html          # Landing enterprise
│   └── assets/
└── gobierno/
    ├── index.html          # Landing gobierno
    └── assets/
```

---

## Stack Técnico

- **HTML5** semántico
- **CSS3** con custom properties (sin frameworks)
- **JavaScript** vanilla (sin dependencias)
- **Google Fonts** (Inter)

**Por qué:** Máxima performance, zero dependencias, fácil de mantener.

---

## Notas de Implementación

### Formulario de Contacto

El formulario en `/demo/` actualmente hace `console.log()` de los datos. Para conectar a un backend:

```javascript
// Reemplazar console.log con:
fetch('TU_ENDPOINT', {
  method: 'POST',
  body: JSON.stringify(data),
  headers: { 'Content-Type': 'application/json' }
});
```

Opciones recomendadas:
- **Formspree** - Gratis hasta 50 submissions/mes
- **HubSpot Forms** - Si ya usan HubSpot CRM
- **Google Sheets** - Via webhook con Apps Script

### GitHub Pages

Para servir con GitHub Pages:
1. Settings → Pages
2. Source: Deploy from branch
3. Branch: `main` / `/ (root)`

---

## Generado Con

Este sitio fue generado usando el sistema [Saptiva Landing Generator](https://github.com/LaraArias/saptiva-landing-generator), un sistema outcome-driven que traduce documentos de negocio en código.

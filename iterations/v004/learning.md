# Learning Extraído - v004

## Principio: Navegación Consistente en Sitios Multi-Página

### Contexto
v003 generó 3 páginas aisladas (Home, Financial Services, Gobierno) sin forma de navegar entre ellas. Esto rompía la experiencia de usuario al no poder explorar el sitio completo.

### Problema Detectado
1. Usuario llega a `/financial-services/index.html` desde un link externo
2. No hay forma de regresar a Home
3. No hay forma de descubrir que existe una página de Gobierno
4. Cada página parecía un sitio independiente

### Causa Raíz
- **Specs incompletos:** PRD.md no incluía requisito de navegación global
- **Generación aislada:** Cada página se generó independientemente sin considerar el sitio como sistema
- **Falta de validación:** ux-reviewer no verificaba navegación entre páginas

### Principio General Extraído
> **TODO sitio multi-página DEBE tener navegación global consistente desde v1, no como afterthought.**

La navegación no es un "nice to have" - es infraestructura crítica del sitio.

### Reglas Agregadas

#### 1. En PRD.md (pendiente implementar)
```markdown
## Navegación Global (Multi-Página)

Si el sitio tiene >1 página, la navegación debe:

1. **Consistencia:** Idéntica en todas las páginas
2. **Ubicación:** Sticky top, visible en scroll
3. **Elementos obligatorios:**
   - Logo → Home
   - Link a Home
   - Menú de páginas (dropdown si >3 páginas)
   - CTA primario
4. **Links:** Relativos si no hay servidor (`../page/index.html`)
5. **Active state:** Indicar página actual
6. **Accesibilidad:** Navegable por teclado, aria-labels correctos
```

#### 2. En ux-reviewer (pendiente implementar)
```markdown
## Navegación (Multi-Página)

Si detectas >1 archivo HTML:

□ Nav presente en TODAS las páginas
□ Nav es idéntico (estructura + estilos)
□ Links funcionan (verificar rutas relativas/absolutas)
□ Logo clickeable regresa a Home
□ Dropdown accesible por teclado (Tab, Enter, Escape)
□ Active state visible en página actual
□ Mobile: hamburger menu funcional

**Scoring:**
- Missing nav: BLOCKER (-10 puntos)
- Nav inconsistente entre páginas: CRITICAL (-5 puntos)
- Links rotos: CRITICAL (-5 puntos)
```

### Implementación en v004

**Estructura de nav (HTML):**
```html
<nav class="global-nav">
  <a href="../home/index.html" class="logo-link">
    <img src="assets/logo.png" alt="Saptiva">
  </a>
  <div class="nav-links">
    <a href="../home/index.html">Home</a>
    <div class="dropdown">
      <button aria-expanded="false" aria-haspopup="true">
        Industrias ▼
      </button>
      <div class="dropdown-content" role="menu">
        <a href="../financial-services/index.html" role="menuitem">Financial Services</a>
        <a href="../gobierno/index.html" role="menuitem">Gobierno</a>
      </div>
    </div>
  </div>
  <a href="#" class="cta-button">Agenda una demo</a>
</nav>
```

**Estilos consistentes (CSS):**
```css
.global-nav {
  position: sticky;
  top: 0;
  z-index: 1000;
  background: rgba(10, 25, 47, 0.95);
  backdrop-filter: blur(10px);
  padding: 1rem 2rem;
  display: flex;
  justify-content: space-between;
  align-items: center;
}

.dropdown:hover .dropdown-content,
.dropdown button:focus + .dropdown-content {
  display: block;
}
```

**JavaScript para accesibilidad:**
```javascript
// Cerrar dropdown con Escape
document.addEventListener('keydown', (e) => {
  if (e.key === 'Escape') {
    document.querySelectorAll('.dropdown-content').forEach(d => {
      d.style.display = 'none';
    });
  }
});
```

### Cómo Previene Errores Futuros

**Sin esta regla (antes):**
1. Designer genera página aislada
2. Usuario no puede navegar
3. ux-reviewer no detecta el problema
4. Se entrega sitio roto

**Con esta regla (ahora):**
1. spec-reviewer valida que existe nav en specs
2. frontend-builder implementa nav idéntico en todas las páginas
3. ux-reviewer verifica consistencia y funcionalidad
4. Se entrega sitio navegable desde v1

### Beneficios Adicionales

1. **SEO:** Crawler puede descubrir todas las páginas
2. **Analytics:** Tracking de flujo entre páginas
3. **UX:** Usuario explora el sitio sin fricción
4. **Branding:** Experiencia coherente en todo el sitio

### Checklist para Futuras Iteraciones

Antes de generar código multi-página, verificar:

- [ ] Nav definido en specs con estructura exacta
- [ ] Links funcionan como relativos o absolutos según contexto
- [ ] Dropdown incluye todas las páginas necesarias
- [ ] CTA primario es el mismo en todas las páginas
- [ ] Logo regresa a Home desde cualquier página
- [ ] Mobile-first: hamburger menu si nav no cabe
- [ ] Accesibilidad: Tab order lógico, aria-labels correctos

### Extensiones Futuras

**Mejoras pendientes:**
1. Active state automático (highlight página actual en nav)
2. Breadcrumbs para sitios >3 niveles
3. Mega menu para sitios con muchas páginas
4. Search bar global (si catálogo de productos crece)

**Tecnología:**
- Considerar framework (Astro, Hugo) para layouts compartidos
- Template único para nav → DRY
- Generación automática de sitemap.xml

# Changelog v004

## Resumen
Transformación de sistema single-page a multi-page site con navegación unificada, workflows actualizados y nueva página Home inspirada en meetgail.com.

---

## 1. Workflow v2 Actualizado (CLAUDE.md)

### Cambios en Agentes
**Antes (v003):** 7 agentes
**Ahora (v004):** 9 agentes

**Nuevos agentes:**
- `copy-reviewer`: Revisa tono, claridad y consistencia del copy antes de implementar
- `graphic-designer`: Genera assets visuales con MCP-Asset (Gemini)

### GATE 2 Mejorado
**Antes:**
```
GATE 2: Post-generación
→ Ver sitio en browser, feedback de copy/diseño
```

**Ahora:**
```
GATE 2: Post-generación + Auto-preview
→ graphic-designer abre automáticamente con MCP Chrome
→ CPO revisa visualmente sin comandos manuales
→ Feedback inmediato sobre copy/diseño
```

### Fase 3 Reestructurada
**Antes:** Pipeline secuencial simple
```
content-strategist → frontend-builder
```

**Ahora:** Pipeline secuencial + paralelo
```
┌─ content-strategist
│   ↓
├─ copy-reviewer (valida copy)
│   ↓
└─ [PARALELO]
    ├─ graphic-designer (genera assets)
    └─ frontend-builder (genera HTML/CSS/JS)
```

**Beneficio:** Assets se generan mientras se escribe código, reduciendo tiempo total.

### Fase 4 Expandida
**Nueva sección de validación:**
```markdown
Assets (CRÍTICO):
□ Todos los <img src> resuelven a archivos locales
□ Assets guardados en /output/{vertical}/assets/
□ Alt text descriptivo en todas las imágenes
□ SVGs optimizados (sin metadata innecesaria)
```

---

## 2. Validator Actualizado

### Nueva Sección: Assets (CRÍTICO)
```markdown
## Assets (CRÍTICO)
□ Todos los <img src> apuntan a archivos que existen
□ Assets guardados en /output/{vertical}/assets/
□ Alt text descriptivo (no "image" ni "icon")
□ SVGs optimizados (viewBox correcto, sin Illustrator metadata)
□ Lazy loading en imágenes below-the-fold
```

### Accesibilidad Expandida
**Antes:** Checklist básico
**Ahora:** WCAG AA compliance
```markdown
## Accesibilidad
□ Skip link funcional (#main-content)
□ Contraste mínimo 4.5:1 texto, 3:1 UI (WCAG AA)
□ Semántica correcta (<header>, <nav>, <main>, <footer>)
□ Labels en inputs, aria-label en iconos
□ Navegación por teclado funcional
```

---

## 3. Specs de Home Creados

### `/specs/verticals/home/sections.md`
**Inspiración:** meetgail.com (estructura clara, 5 segundos para entender)

**9 Secciones definidas:**
1. Hero: "Qué es Saptiva" + 2 CTAs
2. Navegación por industrias (cards grandes)
3. Por qué Saptiva (3 diferenciadores)
4. 3 Problemas del mercado actual
5. Cómo funciona (3 pasos visuales)
6. Productos (3 cards: RAGster, Octavios, Frida)
7. Casos de uso (2 industry-agnostic)
8. Confianza (opcional: logos de clientes)
9. CTA final + footer

### `/specs/verticals/home/cta-strategy.md`
**Estrategia:** 2 CTAs primarios por página, sin fricción.

**CTAs definidos:**
- Primario: "Agenda una demo" (high-intent)
- Secundario: "Explora [Financial Services|Gobierno]" (discovery)

---

## 4. SITE-STRUCTURE.md Actualizado

### Referencia Agregada
```markdown
## Inspiración de Diseño
- meetgail.com: Claridad en 5 segundos, navegación obvia, 3-card layout
```

### Tabla Comparativa de Páginas
```
| Elemento          | Home                | Financial Services | Gobierno           |
|-------------------|---------------------|--------------------|--------------------|
| Hero Message      | Qué es Saptiva      | IA en producción   | Soberanía de datos |
| Target Audience   | General decision-maker | C-level banca   | CIO/CISO gobierno  |
| Primary CTA       | Agenda demo         | Agenda demo        | Agenda demo        |
| Secondary CTA     | Explora industrias  | Ver caso: ABC Bank | Ver caso: CDMX     |
| Social Proof      | Opcional            | OBLIGATORIO        | OBLIGATORIO        |
```

---

## 5. Estructura de Navegación Unificada

### Problema Resuelto
**Antes (v003):**
- Páginas aisladas sin navegación entre ellas
- Directorio `/output/enterprise/` no alineado con branding

**Ahora (v004):**
- Navegación consistente en las 3 páginas
- Directorio renombrado: `enterprise` → `financial-services`

### Implementación
**Estructura de nav (idéntica en 3 páginas):**
```html
<nav>
  <a href="../home/index.html">
    <img src="assets/logo.png" alt="Saptiva">
  </a>
  <a href="../home/index.html">Home</a>
  <div class="dropdown">
    <button>Industrias ▼</button>
    <div class="dropdown-content">
      <a href="../financial-services/index.html">Financial Services</a>
      <a href="../gobierno/index.html">Gobierno</a>
    </div>
  </div>
  <a href="#" class="cta">Agenda una demo</a>
</nav>
```

**Rutas relativas:**
- Desde Home → `../financial-services/index.html`
- Desde Financial Services → `../home/index.html`
- Desde Gobierno → `../home/index.html`

**Razón:** Funcionar como archivos locales sin necesidad de servidor.

---

## 6. Asset de Hero de Gobierno Actualizado

### Problema
Asset anterior tenía fondo blanco que no encajaba con diseño oscuro del hero.

### Solución
Nuevo SVG generado con MCP-Asset:
- Fondo transparente
- Elementos: escudo (soberanía) + servidor (infraestructura)
- Paleta: teal/cyan sobre navy
- Tamaño: 800x600px

**Archivo:** `/output/gobierno/assets/design-1768709364637.svg`

---

## Learning Extraído

**Principio:** Navegación consistente es crítica en sitios multi-página.

**Contexto:** v003 tenía páginas aisladas sin forma de navegar entre ellas.

**Problema:** Usuario podía entrar a /financial-services/ pero no regresar a Home ni explorar Gobierno.

**Solución:** Nav unificado en las 3 páginas con dropdown de industrias.

**Regla general:**
- Todo sitio multi-página DEBE tener navegación global desde v1
- Links deben ser relativos si no hay servidor
- Estructura de directorios debe reflejar branding (enterprise → financial-services)

**Acción preventiva:**
- Agregar navegación como requisito en PRD.md
- Validar navegación en ux-reviewer (nuevo criterio)

---

## Archivos Modificados

```
CLAUDE.md                                    # Workflow v2 documentado
.claude/agents/validator.md                  # Assets + Accesibilidad expandida
specs/SITE-STRUCTURE.md                      # Tabla comparativa + inspiración
specs/verticals/home/sections.md             # Creado
specs/verticals/home/cta-strategy.md         # Creado
output/enterprise/ → output/financial-services/  # Renombrado
output/home/index.html                       # Creado
output/gobierno/assets/design-1768709364637.svg  # Actualizado
```

---

## Validación Final

### Technical: 9/10
- HTML válido
- CSS responsive
- Navegación funcional con links relativos
- Assets locales sin 404s

### UX: 18/20
- Navegación clara y consistente
- Dropdown intuitivo
- Flujo discovery → specific vertical funciona
- Minor: Logo Saptiva pendiente para nav (actualmente placeholder)

### Outcome: Aligned
- Home cumple rol de hub central
- Financial Services y Gobierno mantienen diferenciación
- CTAs claros en cada página
- Sin friction de navegación

---

## Next Steps

1. Opcional: Agregar meta tags Open Graph para compartir en redes
2. Pendiente: Logo Saptiva final para reemplazar placeholder en nav
3. Considerar: Analytics tags cuando se defina plataforma (GA4/Mixpanel/etc)

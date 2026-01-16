# Landing Generation Workflow

## Overview

Este workflow genera una landing page completa pasando por fases con agentes especializados y MCPs.

```
spec-reviewer → content-strategist → copy-reviewer (KAL) → frontend-builder → graphic-designer (MCP-Asset) → validator → ux-reviewer → outcome-evaluator → iteration-logger
```

## MCPs Disponibles

| MCP | Agente que lo usa | Propósito |
|-----|-------------------|-----------|
| **MCP-Asset** | graphic-designer | Generar ilustraciones, iconos, diagramas |
| **MCP-Saptiva** | copy-reviewer | Mexicanizar copy con KAL |

---

## Fase 0: Pre-Validación (GATE)

**Agente:** `spec-reviewer`

### Objetivo
Validar que todos los specs estén completos y consistentes ANTES de generar código.

### Proceso
1. Verificar existencia de archivos requeridos:
   - `/context/domains/{vertical}/DOMAIN.md`
   - `/context/domains/{vertical}/value-props.md`
   - `/specs/verticals/{vertical}/sections.md`
   - `/specs/verticals/{vertical}/cta-strategy.md`
   - `/context/company/product-bible.md`

2. Analizar consistencia:
   - CTA strategy alineado con driver en DOMAIN.md
   - Sections usan términos del ubiquitous language
   - No contradicciones entre specs

3. Detectar ambigüedades:
   - Términos sin definir
   - Referencias a contenido que no existe

### Output
```json
{
  "status": "ready|needs_clarification|blocked",
  "completeness": { "score": "1-5", "missing": [] },
  "consistency": { "score": "1-5", "conflicts": [] },
  "ambiguities": [],
  "gaps": [],
  "recommendations": []
}
```

### Gate
- Si `status != "ready"`: **STOP** - reportar gaps al usuario
- Si `status == "ready"`: continuar a Fase 1

---

## Fase 1: Identificar Vertical

Determina qué landing se va a generar:
- `enterprise` → Driver: Velocidad + Eficiencia
- `gobierno` → Driver: Soberanía + Compliance

---

## Fase 2: Cargar Contexto

### Archivos a leer
1. `/context/_index.md` - mapa de archivos
2. `/context/domains/{vertical}/DOMAIN.md` - ubiquitous language
3. `/context/domains/{vertical}/value-props.md` - propuestas de valor
4. `/context/company/product-bible.md` - copy general
5. `/context/company/whitepaper.md` - si es gobierno (términos técnicos)
6. `/context/design-system/DESIGN-REFERENCE.md` - guía visual

---

## Fase 3: Extraer Copy

**Agente:** `content-strategist`

### Input
- Vertical identificado
- Fuente de copy según DOMAIN.md
- Secciones definidas en specs

### Proceso
1. Lee DOMAIN.md para entender el "driver" del segmento
2. Extrae copy relevante de product-bible/whitepaper
3. Adapta el lenguaje al ubiquitous language del dominio
4. Estructura por sección

### Output
```json
{
  "hero": {
    "headline": "...",
    "subheadline": "...",
    "cta_text": "..."
  },
  "sections": [
    {
      "id": "value-props",
      "title": "...",
      "content": "..."
    }
  ]
}
```

---

## Fase 3.5: Mexicanización de Copy (MCP)

**Agente:** `copy-reviewer`
**MCP:** `MCP-Saptiva` (modelo KAL)

### Objetivo
Pasar el copy extraído por KAL para que suene natural en español mexicano corporativo.

### Proceso
1. Recibe copy estructurado de content-strategist
2. Identifica frases que suenan "traducidas"
3. Envía a KAL con contexto de audiencia (C-level banca)
4. Recibe copy mexicanizado
5. Verifica ortografía y gramática
6. Retorna copy listo para frontend-builder

### Llamada a MCP
```javascript
saptiva_chat({
  model: "Saptiva KAL",
  messages: [
    {
      role: "system",
      content: "Eres un copywriter mexicano senior para audiencia C-level en sector financiero. Reescribe el copy para que suene natural y profesional, como lo diría un director de banco mexicano. Mantén términos técnicos aceptados (KPIs, dashboard, compliance) pero mexicaniza las frases."
    },
    {
      role: "user",
      content: "Mexicaniza este copy de landing:\n\n[copy de content-strategist]"
    }
  ],
  max_tokens: 1000,
  temperature: 0.7
})
```

### Output
```json
{
  "hero": {
    "headline": "[mexicanizado]",
    "subheadline": "[mexicanizado]",
    "cta_text": "[mexicanizado]"
  },
  "sections": [...],
  "changes_made": [
    {
      "original": "Time to Value",
      "mexicanized": "Tiempo a resultados",
      "reason": "Más natural en juntas ejecutivas MX"
    }
  ]
}
```

---

## Fase 4: Cargar Specs

### Archivos a leer
1. `/specs/PRD.md` - reglas globales
2. `/specs/STYLE.md` - guía de frontend completa
3. `/specs/verticals/{vertical}/config.yaml` - configuración
4. `/specs/verticals/{vertical}/sections.md` - estructura de secciones
5. `/specs/verticals/{vertical}/cta-strategy.md` - estrategia CTA

---

## Fase 5: Generar Código

**Agente:** `frontend-builder`

### Input
- Copy estructurado (de content-strategist)
- Specs cargados
- Brand assets (`/context/company/brand-assets/`)
- Design reference (`/context/design-system/`)

### Proceso
1. Genera estructura HTML semántica
2. Aplica CSS siguiendo STYLE.md exactamente
3. Implementa interactividad según specs
4. Optimiza para performance

### Output
- `/output/{vertical}/index.html`
- `/output/{vertical}/styles.css` (si separado)
- `/output/{vertical}/scripts.js` (si necesario)

---

## Fase 5.5: Generación de Assets (MCP)

**Agente:** `graphic-designer`
**MCP:** `MCP-Asset`

### Objetivo
Generar ilustraciones y assets visuales que falten en la landing.

### Cuándo se activa
- Hero necesita ilustración personalizada
- Secciones requieren diagramas
- Se necesitan iconos que no existen en el design system

### Proceso
1. Analiza HTML generado
2. Identifica secciones que necesitan assets
3. Genera con MCP-Asset usando el design system como referencia
4. Guarda en `/context/design-system/assets/generated/`
5. Actualiza referencias en HTML

### Llamada a MCP
```javascript
// Para ilustración de hero
design({
  concept: "AI infrastructure for financial services, 3D isometric cubes, teal accent on dark background",
  variant: "dark",
  provider: "gemini",
  output: "both"
})

// Para diagrama de arquitectura
design({
  concept: "data flow diagram, minimal lines, enterprise security",
  variant: "dark",
  provider: "gemini",
  output: "image"
})
```

### Output
```json
{
  "assets_generated": [
    {
      "type": "illustration",
      "concept": "AI infrastructure",
      "path": "/context/design-system/assets/generated/hero-ai-infra.png",
      "svg_path": "/context/design-system/assets/generated/hero-ai-infra.svg"
    }
  ],
  "html_updated": true
}
```

---

## Fase 6: Validación Técnica

**Agente:** `validator`

### Criterios
Verifica contra `/skills/landing-generation/validation-criteria.md`:

- [ ] HTML válido (W3C)
- [ ] CSS responsive (mobile-first)
- [ ] Accesibilidad básica (WCAG 2.1 AA)
- [ ] Performance (LCP < 2.5s)
- [ ] Links funcionales
- [ ] Imágenes optimizadas

### Output
```json
{
  "status": "pass|fail",
  "checks": {
    "html_valid": true,
    "responsive": true,
    "accessibility": true,
    "performance": true
  },
  "issues": []
}
```

### Gate
- Si `status == "fail"`: volver a Fase 5 con issues documentados
- Si `status == "pass"`: continuar a Fase 7

---

## Fase 7: Validación UX

**Agente:** `ux-reviewer`

### Criterios
- **Claridad (3 segundos):** Hero comunica QUÉ y PARA QUIÉN
- **Flujo:** Secciones siguen narrativa lógica
- **Fricción:** CTA usa lenguaje del dominio, no genérico
- **Confianza:** Elementos de prueba social si aplica

### Output
```json
{
  "status": "pass|needs_review|fail",
  "clarity_score": "1-5",
  "flow_score": "1-5",
  "friction_score": "1-5",
  "findings": [],
  "summary": "..."
}
```

### Gate
- Si `status == "fail"`: documentar issues, iterar
- Si `status == "pass"` o `"needs_review"`: continuar

---

## Fase 8: Validación de Outcome

**Agente:** `outcome-evaluator`

### Criterios
- **Alineación con Driver:** Mensaje principal refleja el driver del dominio
- **Potencial de Conversión:** ¿El target se siente hablado?
- **Diferenciación:** ¿Queda claro por qué Saptiva?
- **Riesgos:** ¿Hay promesas que no podemos cumplir?

### Output
```json
{
  "status": "aligned|misaligned|needs_review",
  "driver_alignment": "strong|weak|misaligned",
  "conversion_potential": "high|medium|low",
  "risks": [],
  "opportunities": [],
  "verdict": "..."
}
```

### Gate
- Si `status == "aligned"`: continuar a documentación
- Si `status == "misaligned"`: **ESCALAR** al usuario con razón

---

## Fase 9: Documentación

**Agente:** `iteration-logger`

### Siempre
1. Crea entrada en `/iterations/v{NNN}/`
2. Documenta qué se generó
3. Lista specs usados

### Si hubo issues
1. Documenta qué falló y por qué
2. Sugiere cambio en specs (no en código)
3. Captura learning en `/iterations/_learnings.md`

### Si todo pasó
1. Marca versión como exitosa
2. Output listo para deploy
3. Captura learnings positivos

---

## Resumen del Pipeline

| Fase | Agente | Gate | Si falla |
|------|--------|------|----------|
| 0 | spec-reviewer | status=ready | STOP, reportar gaps |
| 1-4 | - | - | - |
| 5 | frontend-builder | - | - |
| 6 | validator | pass | Volver a Fase 5 |
| 7 | ux-reviewer | pass/review | Documentar, iterar |
| 8 | outcome-evaluator | aligned | ESCALAR al usuario |
| 9 | iteration-logger | - | - |

---

## Anti-patterns

Ver `/skills/landing-generation/anti-patterns.md` para errores comunes a evitar.

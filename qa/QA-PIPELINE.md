# QA Pipeline Configuration

## Overview

Este documento define el pipeline de Quality Assurance para las landings generadas.

---

## Capa 1: Validación Técnica

### HTML Validation
```json
{
  "checker": "validator",
  "criteria": {
    "valid_html5": true,
    "no_broken_links": true,
    "semantic_structure": true,
    "meta_tags_present": ["viewport", "description", "og:title"]
  }
}
```

### CSS Validation
```json
{
  "checker": "validator",
  "criteria": {
    "mobile_first": true,
    "breakpoints": ["640px", "768px", "1024px", "1280px"],
    "no_inline_styles": true,
    "css_variables_used": true
  }
}
```

### Accessibility
```json
{
  "checker": "validator",
  "criteria": {
    "wcag_level": "AA",
    "color_contrast": "4.5:1",
    "alt_text_required": true,
    "keyboard_navigable": true,
    "aria_labels": true
  }
}
```

### Performance
```json
{
  "checker": "validator",
  "criteria": {
    "lcp_target": "2.5s",
    "fid_target": "100ms",
    "cls_target": "0.1",
    "total_size_max": "500KB"
  }
}
```

---

## Capa 2: Validación UX

### Prompt para ux-reviewer

```
Analiza el HTML generado contra estos criterios:

1. CLARIDAD (3 segundos)
   - ¿El hero comunica QUÉ es el producto?
   - ¿El hero comunica PARA QUIÉN es?
   - ¿El CTA es visible sin scroll?

2. FLUJO NARRATIVO
   - ¿Las secciones siguen: Problema → Solución → Prueba → Acción?
   - ¿Hay saltos conceptuales?
   - ¿Cada sección refuerza la anterior?

3. FRICCIÓN
   - ¿El CTA usa lenguaje específico del dominio?
   - ¿Hay distracciones del objetivo principal?
   - ¿El formulario pide información mínima?

4. CONFIANZA
   - ¿Hay elementos de prueba social?
   - ¿El tono es apropiado para la audiencia?
   - ¿Las promesas tienen respaldo?

Output JSON:
{
  "clarity_score": 1-5,
  "flow_score": 1-5,
  "friction_score": 1-5,
  "trust_score": 1-5,
  "findings": [...],
  "status": "pass|needs_review|fail"
}
```

---

## Capa 3: Validación de Outcome

### Prompt para outcome-evaluator

```
Evalúa si el output generará el resultado de negocio deseado.

CONTEXTO:
- Lee /context/domains/{vertical}/DOMAIN.md para el driver
- Lee /context/domains/{vertical}/success-criteria.md para métricas

CRITERIOS:

1. ALINEACIÓN CON DRIVER
   - ¿El mensaje principal refleja el driver del dominio?
   - ¿El CTA está alineado con lo que motiva al segmento?
   - Enterprise: Velocidad + Eficiencia
   - Gobierno: Soberanía + Compliance

2. POTENCIAL DE CONVERSIÓN
   - ¿Un visitante del segmento se sentiría hablado?
   - ¿Los pain points son reales para este segmento?
   - ¿La solución resuelve SU problema específico?

3. DIFERENCIACIÓN
   - ¿Queda claro por qué Saptiva y no la competencia?
   - ¿Los diferenciadores son relevantes para ESTE segmento?

4. RIESGOS
   - ¿Hay promesas que no podemos cumplir?
   - ¿Hay mensajes que podrían alienar al segmento?

Output JSON:
{
  "driver_alignment": "strong|weak|misaligned",
  "conversion_potential": "high|medium|low",
  "differentiation": "clear|unclear|missing",
  "risks": [...],
  "status": "aligned|needs_review|misaligned"
}
```

---

## Learning Loop

### Captura de Learnings

Después de cada generación, documentar en `/iterations/_learnings.md`:

```markdown
## [DATE] - {vertical} - v{XXX}

### Resultado
- Status: pass|fail
- Issues encontrados: [lista]

### Root Cause
- ¿Por qué falló? [análisis]
- ¿Qué spec estaba incompleto? [archivo:línea]

### Acción Tomada
- ¿Qué se cambió en specs? [diff]
- ¿El cambio resolvió el issue? [sí/no]

### Learning
- ¿Qué agregar a anti-patterns.md? [regla nueva]
- ¿Qué mejorar en prompts de agentes? [sugerencia]
```

### Análisis de Patrones

Cada 5 iteraciones, revisar `_learnings.md` para:
1. Identificar errores recurrentes
2. Actualizar anti-patterns.md
3. Proponer mejoras a prompts de agentes
4. Sugerir cambios a validation-criteria.md

---

## Gates y Escalamiento

| Capa | Gate | Si falla |
|------|------|----------|
| Técnica | Todos los checks pasan | Volver a generar con fixes |
| UX | score >= 3 en todas las áreas | Documentar, sugerir cambios en specs |
| Outcome | status = aligned | **ESCALAR al usuario** |

### Regla de Escalamiento

Si `outcome-evaluator` retorna `status = "misaligned"`:
1. NO entregar el output
2. Explicar qué está desalineado
3. Sugerir cambio específico en spec
4. Esperar aprobación del usuario

---

## Métricas de Calidad

### Por Generación
- Technical pass rate
- UX average score
- Outcome alignment

### Agregadas (por semana/mes)
- % de generaciones que pasan primera vez
- Issues más comunes
- Tiempo promedio de iteración

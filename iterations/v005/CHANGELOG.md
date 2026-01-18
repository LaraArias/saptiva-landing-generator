# v005 - Copy Refinement (Expert Panel)

**Fecha:** 2026-01-17
**Página afectada:** Financial Services

## Cambios

### Cards de Beneficios - Copy Mejorado

| Antes | Después |
|-------|---------|
| Tag: "Time to First Inference" | Tag: "Primeros Resultados" |
| Copy: "Leading indicator de éxito en implementación..." | Copy: "De idea a prueba de concepto en días, no en meses." |
| Tag: "Potencial de Ahorro" | Tag: "Ahorro Operativo" |
| Métrica: "6+ cifras anuales" | Métrica: "Impacto comprobable" |
| Copy: largo y técnico | Copy: "Call centers, cobranza, backoffice. Métricas claras desde el primer proyecto." |

## Razón del Cambio

Copy original tenía problemas identificados por CPO:
- Tags en inglés ("Time to First Inference")
- Mezcla de idiomas ("Leading indicator")
- Jerga técnica ("instrumentado")
- Métricas ambiguas ("6+ cifras")
- Párrafos muy largos

## Proceso

1. Panel de expertos (Steve Jobs, April Dunford, Joanna Wiebe) iteró sobre propuestas
2. CPO aprobó versión final
3. Aplicado a `/output/financial-services/index.html`

## Quick Fixes (Post Expert-Panel Review)

### Financial Services - CTA Mejorado
| Antes | Después |
|-------|---------|
| "Acelera tu time-to-value" | "Empieza en 2 semanas" |

**Razón:** "time-to-value" es jerga de consultoría. El nuevo CTA es más directo y memorable.

### Gobierno - Requisitos Consolidados
- Eliminado requisito redundante (antes había 7, ahora 6)
- "Portabilidad verificable" y "Portabilidad garantizada" fusionados en uno solo
- Renumerados requisitos 4, 5, 6

## Nuevos Agentes

### decision-maker
- **Archivo:** `/.claude/agents/decision-maker.md`
- **Propósito:** Heurísticas para decisiones autónomas
- **Principio:** "Bias hacia la acción" - si es reversible y bajo riesgo, actuar sin preguntar
- **Mantra:** "Si tengo que preguntar si debo preguntar, probablemente no debo preguntar."

## Archivos Modificados

- `/output/financial-services/index.html`
  - Cards de beneficios (líneas 1189-1199)
  - CTAs (2 ocurrencias)
- `/output/gobierno/index.html`
  - Sección de requisitos (de 7 a 6)
  - Meta description
  - Título de sección
  - CTA secundario del hero
- `/specs/SITE-STRUCTURE.md`
  - Actualizado "7 requisitos" → "6 requisitos"
  - Actualizado CTA "Acelera tu time-to-value" → "Empieza en 2 semanas"
- `/CLAUDE.md`
  - Actualizado conteo de agentes: 10 → 11
  - Agregado `decision-maker` a la tabla de agentes estratégicos

## Ralph Wiggum Loop

Implementado sistema de iteración autónoma:
- `/.claude/hooks/stop.sh` - Stop hook que bloquea exit hasta ver `## DONE`
- `/.claude/PROMPT.md` - Archivo de tarea persistente
- Hook registrado en `settings.local.json`

**Uso:** Escribe tarea en PROMPT.md → Claude itera hasta completar → Agrega `## DONE` → Exit

## Iteración Autónoma - Ralph Loop

### Limpieza de Anglicismos
| Archivo | Antes | Después |
|---------|-------|---------|
| home | "Financial Services" (tag) | "Servicios Financieros" |
| home | "Time to Value" (h3) | "Resultados en 2 semanas" |
| home, fin-services | "board meeting" | "comité" |
| home | "roadmaps de 12 meses" | "planes de 12 meses" |
| fin-services | "acelerar tu time-to-value" | "acelerar tus resultados" |

### Consistencia de Documentación
| Archivo | Fix |
|---------|-----|
| gobierno | Comentario HTML: "7 Requisitos" → "6 Requisitos" |

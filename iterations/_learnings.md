# Accumulated Learnings

Este archivo contiene los principios extraídos de todas las iteraciones.
Cada aprendizaje previene errores futuros.

---

## Formato de Entrada

```markdown
## [YYYY-MM-DD] - Título Corto

**Contexto**: Qué se estaba haciendo
**Error**: Qué salió mal
**Causa**: Por qué ocurrió
**Principio**: Regla general extraída
**Acción**: Qué se agregó/cambió para prevenir
```

---

## Aprendizajes

<!-- Los aprendizajes se agregan aquí cronológicamente -->

---

## [2025-01-14] - CTAs secundarios requieren destino verificado

**Contexto**: Generando landing Enterprise v002
**Error**: CTA "Ver caso de éxito" apunta a #caso-exito que no existe en la página
**Causa**: cta-strategy.md definía opciones de CTA sin verificar existencia del contenido destino
**Principio**: TODO CTA debe tener destino verificable antes de generar código
**Acción**: Agregar check en spec-reviewer: "¿Existen las secciones/recursos referenciados por los CTAs?"

---

## [2025-01-14] - Social proof es requisito para Enterprise

**Contexto**: Validando landing Enterprise con ux-reviewer y outcome-evaluator
**Error**: Trust score 2/5 por ausencia total de logos, testimonios y casos de éxito
**Causa**: sections.md marca "Testimonios/Logos" como opcional, pero audiencia C-level requiere validación de pares
**Principio**: Para segmento Enterprise, social proof es OBLIGATORIO, no opcional
**Acción**: Actualizar specs/verticals/enterprise/sections.md para marcar social proof como requerido

---

## [2025-01-14] - value-props.md debe poblarse antes del pipeline

**Contexto**: spec-reviewer encontró placeholders en sections.md
**Error**: Múltiples [Pendiente: extraer de contexto] bloqueaban generación
**Causa**: value-props.md estaba vacío, sections.md referenciaba contenido inexistente
**Principio**: Contexto completo ANTES de correr pipeline, no durante
**Acción**: value-props.md poblado con copy extraído de product-bible.md ANTES de iniciar generación

---

## [2025-01-14] - Copy mexicanizado requiere LLM local

**Contexto**: Refinando copy de landing Enterprise para audiencia banca múltiple MX
**Problema**: Copy suena a "traducción de marketing gringo" - técnicamente correcto pero no natural
**Causa**: Claude genera español neutro, no español mexicano corporativo
**Principio**: Para copy auténtico MX, usar LLM fine-tuneado con corpus local (KAL)
**Acción futura**: Construir MCP que conecte a API de Saptiva/KAL para mexicanización de copy

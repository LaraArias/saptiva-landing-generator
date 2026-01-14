# Instrucciones para Setup: Outcome-Driven Landing Pages

## Contexto del Proyecto

Carlos Lara (CPO de Saptiva AI) está preparando una charla de 15 minutos para el Claude Code Community Meetup en CDMX (3 feb 2026). El título es "Ship Fast, Learn Faster: Outcome-Driven Product Engineering".

El concepto central: **"Edita el documento, no el código"**

El insight que guía todo:

> "Cuando el costo de construir tiende a cero, el costo de construir lo incorrecto se vuelve infinito."

Esto significa que en un mundo donde Claude puede generar código en minutos, el bottleneck ya no es la velocidad de output - es saber QUÉ construir. Por eso la arquitectura está diseñada para anclar todo a documentos de negocio, no a código.

---

## Qué Vas a Construir

Un sistema para generar 2 landing pages (Enterprise y Gobierno) para Saptiva donde:
- El PRD, Style Guide y contexto de negocio son los únicos artefactos que se modifican
- Claude Code construye e itera automáticamente
- Cada iteración captura aprendizajes que mejoran el sistema

**Diferenciadores por vertical:**

| Aspecto | Enterprise | Gobierno |
|---------|-----------|----------|
| Driver principal | Velocidad + Eficiencia | Soberanía + Compliance |
| "Control" significa | Dashboards, métricas | Jurisdicción, CLOUD Act |
| "Seguridad" es | Nice to have | Requisito legal |
| Mensaje clave | "IA a producción en 2 semanas" | "Tus datos nunca salen de tu jurisdicción" |

---

## Arquitectura del Proyecto

```
saptiva-landings/
├── CLAUDE.md                      # Orquestador maestro
├── .claude/
│   └── agents/                    # Sub-agentes especializados
│       ├── content-strategist.md  # Extrae copy del contexto
│       ├── frontend-builder.md    # Genera código siguiendo STYLE
│       ├── validator.md           # Valida criterios de aceptación
│       └── iteration-logger.md    # Documenta cambios y aprendizajes
│
├── skills/                        # Skills con progressive disclosure
│   ├── landing-generation/
│   │   ├── SKILL.md               # Metadata para triggering
│   │   ├── workflow.md            # Pasos detallados
│   │   ├── validation-criteria.md # Qué debe cumplir el output
│   │   └── anti-patterns.md       # Errores comunes a evitar
│   └── iteration-management/
│       ├── SKILL.md
│       └── learning-capture.md
│
├── context/                       # Fuentes de verdad (READ-ONLY)
│   ├── _index.md                  # Índice de qué hay y para qué
│   ├── company/
│   │   ├── whitepaper.md          # Extraído del PDF
│   │   ├── product-bible.md       # Extraído del PDF
│   │   └── brand-assets/
│   │       ├── colors.md
│   │       └── typography.md
│   └── domains/                   # Bounded contexts por vertical
│       ├── enterprise/
│       │   ├── DOMAIN.md          # Ubiquitous language de enterprise
│       │   ├── value-props.md     # Propuestas de valor específicas
│       │   ├── objections.md      # Objeciones comunes y respuestas
│       │   └── success-criteria.md
│       └── gobierno/
│           ├── DOMAIN.md          # Ubiquitous language de gobierno
│           ├── value-props.md
│           ├── objections.md
│           └── success-criteria.md
│
├── specs/                         # LO QUE SE EDITA PARA ITERAR
│   ├── PRD.md                     # Requerimientos de negocio
│   ├── STYLE.md                   # Guía de diseño/frontend
│   └── verticals/
│       ├── enterprise/
│       │   ├── config.yaml        # Configuración específica
│       │   ├── sections.md        # Estructura de la landing
│       │   └── cta-strategy.md    # Estrategia de CTAs
│       └── gobierno/
│           ├── config.yaml
│           ├── sections.md
│           └── cta-strategy.md
│
├── output/                        # Lo que Claude genera
│   ├── enterprise/
│   │   └── index.html
│   └── gobierno/
│       └── index.html
│
└── iterations/                    # Historia con aprendizajes
    ├── _learnings.md              # Aprendizajes acumulados (IMPORTANTE)
    └── v001/
        ├── manifest.yaml          # Metadata de la iteración
        ├── feedback.md            # Qué estuvo mal
        ├── changes.md             # Qué se cambió
        └── learning.md            # Principio capturado
```

---

## Principios de la Arquitectura

### 1. Bounded Contexts (de DDD)

Cada vertical tiene su propio "idioma". El archivo DOMAIN.md define qué significan las palabras en ese contexto.

**Ejemplo - /context/domains/gobierno/DOMAIN.md:**

```markdown
# Dominio: Gobierno

## Ubiquitous Language

### Control
En este contexto, "control" significa:
- Jurisdicción sobre los datos
- Independencia de proveedores extranjeros
- Capacidad de auditar y verificar
- NO significa dashboards o métricas operativas

### Soberanía
- Datos que nunca salen del territorio nacional
- Sin exposición a CLOUD Act
- Infraestructura bajo jurisdicción local

### Seguridad
- Requisito legal, no feature opcional
- Incluye residencia de datos, cifrado, trazabilidad
- Certificaciones y compliance obligatorios

## Driver Principal
El cliente gobierno compra por CONTROL JURISDICCIONAL, no por velocidad.
La velocidad es irrelevante si no hay garantía de soberanía.

## Anti-patterns
- NO usar "rápido" o "ágil" como diferenciador
- NO asumir que "demo" es el siguiente paso (prefieren "evaluación técnica")
- NO mezclar beneficios de enterprise con gobierno
```

### 2. Sub-Agentes Especializados (de Stephen Ellis)

Cada agente tiene UNA disciplina. No "personas" como "Frontend Engineer" sino herramientas enfocadas.

**Principio clave:** Named standards > términos subjetivos

```markdown
# MALO
"Eres el mejor diseñador de UI"

# BUENO  
"Aplica estas reglas:
- Contraste mínimo WCAG 2.1 AA
- Espaciado usando escala de 8px
- Tipografía: Inter para body, peso 400-600"
```

### 3. Progressive Disclosure (de Skills de Anthropic)

No cargar todo el contexto siempre. Los skills tienen metadata mínima para triggering, detalles en archivos separados.

**SKILL.md** - siempre cargado:
```yaml
name: landing-generation
description: Genera landing pages a partir de specs y contexto de dominio
triggers:
  - "genera landing"
  - "crea landing"
  - "landing para"
```

**workflow.md** - solo cuando el skill se activa:
```markdown
# Workflow de Generación

1. Identificar vertical (enterprise/gobierno)
2. Cargar DOMAIN.md del vertical
3. Leer specs/verticals/{vertical}/
4. Generar HTML siguiendo STYLE.md
5. Validar contra validation-criteria.md
6. Si falla, reportar y sugerir fix
```

### 4. Aprendizaje Acumulado

La diferencia entre "vibe coding" y este approach:

**Vibe coding:**
Error → Arreglas output → Mismo error después → Arreglas de nuevo → Cero aprendizaje

**Outcome-driven:**
Error → validator detecta → iteration-logger captura principio → Regla se agrega → Error nunca vuelve

**Ejemplo de learning capturado:**

```markdown
# Learning v001

## Problema Detectado
CTA dice "Solicita Demo" para landing de gobierno

## Por Qué Falló
El CTA no refleja el driver del dominio. Gobierno no busca "demos" - busca garantías de control.

## Principio Faltante
Los CTAs deben usar el lenguaje del ubiquitous language del dominio.

## Regla Agregada
Para gobierno: CTA debe incluir "control", "soberanía" o "jurisdicción"

## Prevención Futura
Antes de generar CTA, consultar DOMAIN.md del vertical y extraer términos del driver principal.
```

---

## Archivos a Crear

### 1. CLAUDE.md (Orquestador Maestro)

```markdown
# Saptiva Landing Pages - Outcome-Driven Architecture

## Principio Central
"Edita el documento, no el código."
El código es output derivado. Los documentos en /specs/ son la fuente de verdad.

## Estructura del Proyecto
- /context/ - Fuentes de verdad del negocio (READ-ONLY, no modificar)
- /specs/ - Lo que se edita para iterar
- /skills/ - Cómo ejecutar tareas
- /output/ - Lo que generas
- /iterations/ - Historia y aprendizajes

## Workflow Principal

Cuando el usuario pida generar una landing:

1. **Identificar vertical**
   - Si dice "enterprise" → /context/domains/enterprise/
   - Si dice "gobierno" → /context/domains/gobierno/
   - Si no especifica → PREGUNTAR

2. **Cargar contexto del dominio**
   - Leer DOMAIN.md del vertical (ubiquitous language)
   - Leer value-props.md (propuestas de valor)
   - Leer /specs/verticals/{vertical}/ (configuración específica)

3. **Delegar a sub-agentes**
   - @content-strategist: extrae copy del contexto
   - @frontend-builder: genera HTML/CSS
   - @validator: verifica criterios

4. **Validar antes de entregar**
   - Ejecutar validator contra /skills/landing-generation/validation-criteria.md
   - Si FAIL → reportar qué falló y sugerir fix en specs
   - Si PASS → entregar output

5. **Capturar aprendizaje**
   - Si hubo correcciones, @iteration-logger documenta
   - Actualizar /iterations/_learnings.md

## Regla de Oro
Si algo no está en /specs/ o /context/, PREGUNTAR. No asumir.

## Learnings Acumulados
Antes de generar, revisar /iterations/_learnings.md para evitar errores ya conocidos.
```

### 2. Sub-agente: content-strategist.md

```markdown
---
name: content-strategist
description: Extrae y adapta copy del contexto de negocio
tools:
  - Read
  - Grep
  - Glob
model: sonnet
---

# Content Strategist

## Rol
Extraer copy de /context/ y adaptarlo al ubiquitous language del dominio target.

## Proceso

1. Recibir: vertical (enterprise/gobierno) + sección requerida
2. Leer /context/domains/{vertical}/DOMAIN.md
3. Leer /context/company/whitepaper.md y product-bible.md
4. Extraer contenido relevante
5. Adaptar al lenguaje del dominio
6. Retornar JSON estructurado

## Output Format

```json
{
  "vertical": "gobierno",
  "section": "hero",
  "headline": "...",
  "subheadline": "...",
  "cta_text": "...",
  "source_refs": ["whitepaper.md:línea 45", "DOMAIN.md:línea 12"]
}
```

## Reglas
- TODO el copy debe venir del contexto, no inventado
- Usar SOLO términos del ubiquitous language del dominio
- Incluir referencias a fuentes para trazabilidad
- Si no hay contenido suficiente en el contexto, reportar qué falta
```

### 3. Sub-agente: validator.md

```markdown
---
name: validator
description: Valida output contra criterios de aceptación
tools:
  - Read
  - Grep
  - Glob
  - Bash
model: sonnet
---

# Validator

## Rol
Verificar que el output cumple con los criterios definidos.

## Proceso

1. Recibir: path al output generado + vertical
2. Cargar /skills/landing-generation/validation-criteria.md
3. Cargar /context/domains/{vertical}/success-criteria.md
4. Ejecutar validaciones
5. Retornar reporte

## Validaciones

### Copy
- [ ] Todo el copy viene del contexto (no inventado)
- [ ] Usa ubiquitous language del dominio
- [ ] CTA refleja driver del segmento
- [ ] No mezcla mensajes de otros verticales

### Técnico
- [ ] HTML válido
- [ ] CSS usa variables de brand-assets
- [ ] Responsive (mobile-first)
- [ ] Imágenes tienen alt text

### Negocio
- [ ] Hero comunica propuesta de valor del dominio
- [ ] Secciones siguen orden en specs
- [ ] No menciona features fuera de scope del vertical

## Output Format

```json
{
  "status": "PASS" | "FAIL",
  "checks": [
    {"name": "cta_reflects_driver", "status": "FAIL", "detail": "CTA dice 'Solicita Demo' pero dominio gobierno requiere términos de control", "suggested_fix": "Cambiar CTA a 'Toma el control de tu infraestructura'"}
  ],
  "summary": "2/10 checks failed"
}
```
```

### 4. Sub-agente: iteration-logger.md

```markdown
---
name: iteration-logger
description: Documenta cambios y captura aprendizajes
tools:
  - Read
  - Write
model: sonnet
---

# Iteration Logger

## Rol
Documentar qué cambió, por qué, y capturar el principio que faltaba.

## Proceso

Cuando se complete una iteración con correcciones:

1. Crear /iterations/v{NNN}/
2. Copiar specs actuales a la carpeta
3. Documentar en changes.md qué se modificó
4. Documentar en feedback.md qué estuvo mal
5. Capturar en learning.md el principio faltante
6. Actualizar /iterations/_learnings.md con el nuevo learning

## Pregunta Clave
"¿Qué principio faltaba que hubiera prevenido este error?"

No buscamos parches. Buscamos reglas que prevengan clases enteras de errores.

## Learning Format

```markdown
## Learning #{N}: {título corto}

**Problema:** {qué salió mal}
**Causa raíz:** {por qué salió mal}
**Principio:** {regla general que lo previene}
**Aplicación:** {cómo aplicar en futuras iteraciones}
```
```

---

## Contenido Base para /context/

### De los documentos de Saptiva, extraer:

**whitepaper.md:**
- Los 7 requisitos de IA Soberana
- El problema del CLOUD Act
- La arquitectura frIdA
- Diferenciadores vs hyperscalers

**product-bible.md:**
- Propuesta de valor por vertical
- Time-to-value (2 semanas)
- Casos de uso específicos
- North Star Metrics

---

## Para el Demo del Meetup

El demo debe mostrar:

1. `/context/domains/gobierno/DOMAIN.md` → "Esto es 'control' para gobierno"
2. `/specs/verticals/gobierno/cta-strategy.md` → "Esto quiero en el CTA"
3. `claude "genera landing gobierno"` → Sale CTA genérico
4. Validator: "FAIL - CTA no refleja driver"
5. Editar UNA línea en cta-strategy.md
6. `claude "itera"` → Sale CTA correcto
7. `/iterations/v001/learning.md` → Learning capturado
8. Cierre: "Nunca toqué código. El sistema ahora sabe algo nuevo."

---

## Mensaje para la Charla

"La mayoría trata a Claude como empleado nuevo cada vez. El approach outcome-driven construye un sistema que acumula conocimiento. Claude no empieza de cero - empieza desde todo lo que ya aprendiste."

"Edita el documento, no el código. El documento es donde vive tu conocimiento. El código es solo el output."

"Cuando el costo de construir tiende a cero, el costo de construir lo incorrecto se vuelve infinito."

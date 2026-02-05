# Guía de Replicación: Sistema de Generación Outcome-Driven con Sub-Agentes

> **Propósito:** Esta guía permite replicar un sistema de generación de contenido/código que usa contexto separado, sub-agentes especializados, workflows con gates de aprobación, y loops de iteración con captura de aprendizajes.

---

## Tabla de Contenidos

1. [Filosofía Central](#1-filosofía-central)
2. [Arquitectura de Carpetas](#2-arquitectura-de-carpetas)
3. [El Archivo CLAUDE.md (Orquestador)](#3-el-archivo-claudemd-orquestador)
4. [Sistema de Contexto (Fuente de Verdad)](#4-sistema-de-contexto-fuente-de-verdad)
5. [Sistema de Specs (Configuración Editable)](#5-sistema-de-specs-configuración-editable)
6. [Definición de Sub-Agentes](#6-definición-de-sub-agentes)
7. [Workflow con Gates de Aprobación](#7-workflow-con-gates-de-aprobación)
8. [Sistema de Iteración y Learnings](#8-sistema-de-iteración-y-learnings)
9. [Skills (Comandos Compuestos)](#9-skills-comandos-compuestos)
10. [Integración de MCPs Externos](#10-integración-de-mcps-externos)
11. [Checklist de Implementación](#11-checklist-de-implementación)
12. [Plantillas Listas para Usar](#12-plantillas-listas-para-usar)

---

## 1. Filosofía Central

### El Principio Fundamental

```
"Edit the document, not the code."
```

- **Los documentos de negocio son la fuente de verdad**
- **El código es output derivado de los specs**
- **Si algo está mal, se arregla en el documento, no en el código**

### Por qué funciona

1. **Separación de concerns:** Quien define el negocio no toca código, quien genera código no inventa contenido
2. **Trazabilidad:** Siempre puedes rastrear por qué el código tiene cierto contenido
3. **Iteración segura:** Cambiar un spec regenera código consistente
4. **Prevención de drift:** El código nunca diverge de la especificación

### Outcome-Driven vs Feature-Driven

| Feature-Driven | Outcome-Driven |
|----------------|----------------|
| "Agrega un botón de demo" | "El usuario debe poder agendar una llamada" |
| "Pon el logo más grande" | "La marca debe ser reconocible en 3 segundos" |
| "Agrega más texto" | "El valor debe comunicarse sin scroll" |

**El sistema genera para lograr OUTCOMES, no para implementar FEATURES.**

---

## 2. Arquitectura de Carpetas

### Estructura Base (Copiar para nuevo proyecto)

```
/mi-proyecto/
│
├── CLAUDE.md                    # ORQUESTADOR - Instrucciones para Claude
│
├── /context/                    # READ-ONLY - Fuente de verdad
│   ├── _index.md                # Mapa de qué archivo consultar para qué
│   ├── /company/                # Contexto general de la empresa/producto
│   │   ├── product-bible.md     # Definición del producto
│   │   ├── whitepaper.md        # Documentación técnica
│   │   └── /brand-assets/       # Colores, tipografía, logo
│   │       ├── colors.json
│   │       ├── typography.json
│   │       └── logo.svg
│   ├── /domains/                # Bounded contexts por vertical/segmento
│   │   ├── /vertical-1/
│   │   │   ├── DOMAIN.md        # Ubiquitous language, driver, audiencia
│   │   │   ├── value-props.md   # Propuestas de valor específicas
│   │   │   ├── objections.md    # Objeciones comunes y respuestas
│   │   │   └── success-criteria.md
│   │   └── /vertical-2/
│   │       └── ...
│   ├── /design-system/          # Sistema de diseño visual
│   │   ├── DESIGN-REFERENCE.md
│   │   ├── /assets/
│   │   └── /reference/          # Imágenes de ejemplo
│   └── /mcps/                   # Documentación de MCPs externos
│       └── MCP-NOMBRE.md
│
├── /specs/                      # EDITABLE - Lo que el usuario modifica
│   ├── PRD.md                   # Reglas globales del proyecto
│   ├── STYLE.md                 # Guía de estilo (frontend/código)
│   └── /verticals/              # Configuración por vertical
│       ├── /vertical-1/
│       │   ├── config.yaml      # Metadata y configuración
│       │   ├── sections.md      # Estructura de secciones
│       │   └── cta-strategy.md  # Estrategia de CTAs/acciones
│       └── /vertical-2/
│           └── ...
│
├── /output/                     # GENERATED - Código generado
│   ├── /vertical-1/
│   │   ├── index.html
│   │   └── /assets/
│   └── /vertical-2/
│       └── ...
│
├── /iterations/                 # HISTORY - Documentación de cambios
│   ├── _learnings.md            # Base de conocimiento acumulativo
│   ├── /v001/
│   │   ├── manifest.yaml
│   │   ├── feedback.md
│   │   ├── changes.md
│   │   └── learning.md
│   └── /v002/
│       └── ...
│
├── /skills/                     # Comandos compuestos
│   └── /mi-skill/
│       ├── SKILL.md
│       ├── workflow.md
│       ├── validation-criteria.md
│       └── anti-patterns.md
│
└── /.claude/                    # Configuración de Claude
    └── /agents/                 # Definición de sub-agentes
        ├── spec-reviewer.md
        ├── content-extractor.md
        ├── code-generator.md
        ├── validator.md
        └── iteration-logger.md
```

### Reglas de los Directorios

| Directorio | Permisos | Propósito |
|------------|----------|-----------|
| `/context/` | READ-ONLY | Fuente de verdad, no se modifica durante generación |
| `/specs/` | EDITABLE | Lo que el usuario ajusta para cambiar el output |
| `/output/` | GENERATED | Se sobreescribe en cada generación |
| `/iterations/` | APPEND-ONLY | Historial, nunca se borran entradas |
| `/.claude/agents/` | CONFIG | Definición de comportamiento de agentes |

---

## 3. El Archivo CLAUDE.md (Orquestador)

### Propósito

`CLAUDE.md` es el archivo que Claude lee al iniciar. Define:
- El rol del sistema
- Las reglas de oro
- Los sub-agentes disponibles
- El flujo de trabajo
- Lo que NO debe hacer

### Plantilla Base de CLAUDE.md

```markdown
# [Nombre del Sistema]

## Rol
Eres un sistema de [propósito] outcome-driven.
Tu trabajo es [descripción de la transformación principal].

**Filosofía Central:** "Edit the document, not the code."
- Los documentos de negocio son la fuente de verdad
- El código es output derivado de los specs
- Si algo está mal, se arregla en el documento, no en el código

---

## Regla de Oro
NUNCA generes [output] sin antes:
1. Leer el contexto relevante en `/context/`
2. Verificar los specs en `/specs/`
3. Entender los criterios de validación
4. **Ejecutar spec-reviewer** para validar que los specs estén completos

---

## Sub-agentes Disponibles

### Fase Pre-Build (Upstream)
| Agente | Propósito | Cuándo Usar |
|--------|-----------|-------------|
| `spec-reviewer` | Revisa specs antes de construir | **SIEMPRE** antes de generar |

### Fase Build (Core)
| Agente | Propósito | Cuándo Usar |
|--------|-----------|-------------|
| `content-extractor` | Extrae contenido del contexto | Cuando necesitas contenido |
| `code-generator` | Genera código siguiendo specs | Para crear el output |

### Fase Post-Build (Validation)
| Agente | Propósito | Cuándo Usar |
|--------|-----------|-------------|
| `validator` | Verifica criterios técnicos | Después de generar |
| `outcome-evaluator` | Verifica alineación con negocio | Validación final |

### Fase Iteración
| Agente | Propósito | Cuándo Usar |
|--------|-----------|-------------|
| `iteration-logger` | Documenta cambios y learnings | Cada iteración |

---

## Flujo de Trabajo

[Diagrama ASCII del flujo - ver sección 7]

---

## Estructura de Archivos

```
/context/           ← READ-ONLY (fuente de verdad)
/specs/             ← EDITABLE (lo que el usuario modifica)
/output/            ← GENERATED (código generado)
/iterations/        ← HISTORY (cambios documentados)
```

---

## Lo Que NO Debes Hacer

1. **Inventar contenido** que no esté en el contexto
2. **Ignorar** los criterios de validación
3. **Modificar** archivos en `/context/` (son read-only)
4. **Generar** sin haber leído el DOMAIN.md correspondiente
5. **Saltarte** la fase de spec-reviewer
6. **Adivinar** cuando algo está ambiguo - reporta el gap

---

## Comando Rápido

Para [acción principal]:
```
[Comando que activa el skill principal]
```

Esto activa automáticamente:
1. spec-reviewer → valida specs
2. content-extractor → extrae contenido
3. code-generator → genera código
4. validator → verifica técnico
5. outcome-evaluator → verifica negocio
6. iteration-logger → documenta
```

---

## 4. Sistema de Contexto (Fuente de Verdad)

### El archivo _index.md

Este archivo mapea QUÉ consultar para CADA necesidad:

```markdown
# Índice de Contexto

## Cuándo necesitas...

### Información de Producto
→ `/context/company/product-bible.md`

### Diferenciadores Técnicos
→ `/context/company/whitepaper.md`

### Colores y Tipografía
→ `/context/company/brand-assets/colors.json`
→ `/context/company/brand-assets/typography.json`

### Contexto de [Vertical 1]
→ `/context/domains/vertical-1/DOMAIN.md` (driver, audiencia)
→ `/context/domains/vertical-1/value-props.md` (propuestas de valor)

### Contexto de [Vertical 2]
→ `/context/domains/vertical-2/DOMAIN.md`

### Estilo Visual
→ `/context/design-system/DESIGN-REFERENCE.md`
```

### Plantilla de DOMAIN.md (Por Vertical)

```markdown
# [Nombre del Vertical] - Domain Context

## Driver Principal
> [Una frase que capture el outcome principal que busca este segmento]
> Ejemplo: "Time to Value" o "Control Total" o "Reducción de Costos"

## Audiencia
| Rol | Prioridad | Pain Points | Lenguaje |
|-----|-----------|-------------|----------|
| [Título] | Primaria | [Lista] | [Términos que usa] |
| [Título] | Secundaria | [Lista] | [Términos que usa] |

## Ubiquitous Language
Términos que DEBEMOS usar:
- [Término 1]: [Definición]
- [Término 2]: [Definición]

Términos que NUNCA usamos:
- ❌ [Término]: [Por qué evitarlo]

## Competidores de Referencia
| Competidor | Qué copiar | Qué evitar |
|------------|------------|------------|
| [Nombre] | [Tono, estructura] | [Mensajes específicos] |

## Anti-patterns
- ❌ [Cosa que NO hacer en este vertical]
- ❌ [Otra cosa que NO hacer]

## Métricas Clave
- [Métrica 1]: [Valor]
- [Métrica 2]: [Valor]
```

### Plantilla de value-props.md

```markdown
# [Vertical] - Propuestas de Valor

## Propuesta Principal
**Headline:** [Una línea]
**Subheadline:** [Expansión]
**Prueba:** [Métrica o evidencia]

## Propuestas Secundarias

### [Beneficio 1]
- **Qué:** [Descripción]
- **Por qué importa:** [Conexión con driver]
- **Evidencia:** [Métrica]

### [Beneficio 2]
...

## Diferenciadores vs Competencia
| Nosotros | Competencia | Ventaja |
|----------|-------------|---------|
| [Feature] | [Su approach] | [Por qué somos mejores] |
```

---

## 5. Sistema de Specs (Configuración Editable)

### Plantilla de PRD.md (Reglas Globales)

```markdown
# PRD - [Nombre del Proyecto]

## Principios de Generación

### 1. [Principio]
[Descripción]
- ✅ Hacer: [Ejemplo]
- ❌ No hacer: [Ejemplo]

### 2. [Principio]
...

## Reglas Globales

### Obligatorio en TODO output
- [ ] [Requisito 1]
- [ ] [Requisito 2]

### Prohibido en TODO output
- [ ] [Restricción 1]
- [ ] [Restricción 2]

## Criterios de Aceptación Globales
1. [Criterio técnico]
2. [Criterio de negocio]
3. [Criterio de UX]
```

### Plantilla de config.yaml (Por Vertical)

```yaml
# Configuración de [Vertical]

vertical: nombre-del-vertical
driver: "Frase del driver principal"

# Rutas de contexto
domain_file: /context/domains/vertical/DOMAIN.md
value_props_file: /context/domains/vertical/value-props.md

# Metadata
metadata:
  title: "Título de la página"
  description: "Meta description"
  keywords: ["keyword1", "keyword2"]

# Estructura
sections:
  - hero
  - problema
  - solucion
  - beneficios
  - social_proof
  - cta_final

# CTAs
cta:
  primary_text: "Texto del CTA principal"
  primary_action: "https://..."
  secondary_text: "Texto del CTA secundario"
  secondary_action: "#seccion"

# Tracking (opcional)
tracking:
  gtm_id: "GTM-XXXXX"
```

### Plantilla de sections.md

```markdown
# [Vertical] - Estructura de Secciones

## Hero
**Objetivo:** [Qué debe lograr esta sección]
**Tiempo de atención:** 3 segundos

### Contenido
- **Headline:** [Extraer de value-props.md]
- **Subheadline:** [Extraer de value-props.md]
- **CTA:** [Según cta-strategy.md]
- **Visual:** [Tipo de imagen/ilustración]

## [Sección 2]
**Objetivo:** [Qué debe lograr]

### Contenido
- [Elementos requeridos]

## [Sección N]
...
```

### Plantilla de cta-strategy.md

```markdown
# [Vertical] - Estrategia de CTAs

## Driver del Vertical
> [Copiar del DOMAIN.md]

## CTA Principal
**Texto:** [Debe reflejar el driver]
**Acción:** [URL o anchor]
**Ubicación:** Hero, Final

### Palabras que SÍ usar
- [Palabra que refleja el driver]
- [Otra palabra]

### Palabras que NO usar
- ❌ [Palabra genérica]: [Por qué]
- ❌ [Otra palabra]: [Por qué]

## CTA Secundario
**Texto:** [Alternativa de menor compromiso]
**Acción:** [URL o anchor]
**Ubicación:** [Dónde aparece]

## Ejemplos Buenos vs Malos

| ❌ Malo | ✅ Bueno | Por qué |
|--------|---------|---------|
| "Solicita demo" | "[Verbo + driver]" | Refleja el outcome |
```

---

## 6. Definición de Sub-Agentes

### Ubicación
Los sub-agentes se definen en `/.claude/agents/[nombre].md`

### Plantilla de Sub-Agente

```markdown
# [Nombre del Agente]

## Rol
[Una línea que describe su responsabilidad única]

## Principio
> "[Frase que guía todas sus decisiones]"

## Cuándo se activa
- [Trigger 1]
- [Trigger 2]

## Input requerido
- [Archivo o dato 1]
- [Archivo o dato 2]

## Proceso
1. [Paso 1]
2. [Paso 2]
3. [Paso 3]

## Output
```json
{
  "status": "ready|blocked|needs_clarification",
  "details": { ... },
  "next_action": "..."
}
```

## Criterios de éxito
- [ ] [Criterio 1]
- [ ] [Criterio 2]

## Anti-patterns
- ❌ [Qué NO debe hacer]
- ❌ [Otro anti-pattern]
```

### Agentes Mínimos Recomendados

#### 1. spec-reviewer.md
```markdown
# Spec Reviewer

## Rol
Auditor de especificaciones que valida completitud y consistencia antes de generar.

## Principio
> "Es más barato arreglar un documento que arreglar código"

## Cuándo se activa
- Antes de cualquier generación significativa
- Cuando el usuario modifica un spec
- Cuando se inicia un nuevo vertical

## Input requerido
- /specs/PRD.md
- /specs/verticals/{vertical}/config.yaml
- /specs/verticals/{vertical}/sections.md
- /context/domains/{vertical}/DOMAIN.md

## Proceso
1. Verificar que todos los archivos existan
2. Verificar que no haya placeholders sin completar
3. Verificar consistencia entre CTA y driver
4. Verificar que el ubiquitous language sea consistente

## Output
```json
{
  "status": "ready|blocked|needs_clarification",
  "completeness": { "score": "1-5", "missing": [] },
  "consistency": { "score": "1-5", "conflicts": [] },
  "ambiguities": [],
  "gaps": [],
  "recommendations": []
}
```

## Gate
Si status ≠ "ready" → STOP y reportar gaps al usuario
```

#### 2. content-extractor.md
```markdown
# Content Extractor

## Rol
Extrae y estructura contenido del contexto para usar en generación.

## Principio
> "Todo contenido debe ser trazable a una fuente en /context/"

## Cuándo se activa
- Después de que spec-reviewer retorna "ready"
- Cuando se necesita contenido para una sección

## Input requerido
- /context/_index.md (para saber dónde buscar)
- /context/domains/{vertical}/DOMAIN.md
- /context/domains/{vertical}/value-props.md
- /context/company/product-bible.md

## Proceso
1. Leer DOMAIN.md para identificar el driver
2. Extraer contenido relevante de las fuentes
3. Estructurar por sección según sections.md
4. Verificar que haya métricas/evidencia para cada claim

## Output
```json
{
  "sections": {
    "hero": {
      "headline": "...",
      "subheadline": "...",
      "source": "/context/domains/.../value-props.md:L15"
    },
    "benefits": [...]
  },
  "warnings": ["Falta métrica para claim X"]
}
```
```

#### 3. code-generator.md
```markdown
# Code Generator

## Rol
Genera código siguiendo specs y usando contenido extraído.

## Principio
> "El código implementa specs, no inventa features"

## Input requerido
- Output de content-extractor
- /specs/STYLE.md
- /specs/verticals/{vertical}/config.yaml
- /context/company/brand-assets/

## Proceso
1. Leer STYLE.md para reglas de código
2. Aplicar brand-assets (colores, tipografía)
3. Generar código sección por sección
4. Insertar contenido extraído
5. Verificar responsive y accesibilidad

## Output
- Archivos en /output/{vertical}/
```

#### 4. validator.md
```markdown
# Validator

## Rol
Verifica que el output cumpla criterios técnicos y de negocio.

## Checks
1. **Técnico:** [HTML válido, responsive, accesibilidad, performance]
2. **Contenido:** [Todo viene del contexto, sin inventos]
3. **Negocio:** [CTA refleja driver, estructura correcta]

## Output
```json
{
  "status": "pass|fail",
  "checks": [
    { "criterion": "...", "status": "pass|fail", "details": "..." }
  ],
  "blocking_issues": [],
  "warnings": []
}
```

## Gate
Si status = "fail" con blocking_issues → Volver a code-generator
```

#### 5. iteration-logger.md
```markdown
# Iteration Logger

## Rol
Documenta cada iteración y captura aprendizajes generalizables.

## Cuándo se activa
- Al completar una generación exitosa
- Al fallar una validación (para documentar el error)
- Cuando el usuario da feedback

## Proceso
1. Crear /iterations/v{NNN}/
2. Generar manifest.yaml con metadata
3. Si hubo error: documentar en feedback.md
4. Si se cambió spec: documentar en changes.md
5. Extraer learning generalizable si aplica
6. Actualizar /_learnings.md

## Output
- /iterations/v{NNN}/ con documentación completa
- /_learnings.md actualizado si hay nuevo principio
```

---

## 7. Workflow con Gates de Aprobación

### Diagrama del Workflow

```
╔════════════════════════════════════════════════════════════════╗
║                    HUMAN-IN-THE-LOOP                           ║
╠════════════════════════════════════════════════════════════════╣
║  El usuario revisa y aprueba en puntos clave:                  ║
║                                                                ║
║  GATE 1: Pre-generación                                        ║
║  → Decisiones de estructura, prioridades, CTAs                 ║
║                                                                ║
║  GATE 2: Post-generación                                       ║
║  → Review visual, feedback de contenido                        ║
║                                                                ║
║  GATE 3: Pre-deploy                                            ║
║  → Aprobación final                                            ║
║                                                                ║
║  Sin aprobación en GATE, no se avanza al siguiente paso.       ║
╚════════════════════════════════════════════════════════════════╝
                              ↓
┌─────────────────────────────────────────────────────────────────┐
│                    FASE 0: PRE-VALIDACIÓN                       │
├─────────────────────────────────────────────────────────────────┤
│  spec-reviewer analiza:                                         │
│  - Completitud de specs                                         │
│  - Consistencia entre documentos                                │
│  - Ambigüedades que bloquearían generación                      │
│                                                                 │
│  → Si status != "ready": STOP y reportar gaps                   │
└─────────────────────────────────────────────────────────────────┘
                              ↓
┌─────────────────────────────────────────────────────────────────┐
│                    FASE 1: CARGAR CONTEXTO                      │
├─────────────────────────────────────────────────────────────────┤
│  1. Lee /context/_index.md para saber qué archivos consultar    │
│  2. Lee /context/domains/{vertical}/DOMAIN.md                   │
│  3. Extrae contenido de fuentes según _index.md                 │
└─────────────────────────────────────────────────────────────────┘
                              ↓
┌─────────────────────────────────────────────────────────────────┐
│                    FASE 2: CARGAR SPECS                         │
├─────────────────────────────────────────────────────────────────┤
│  1. Lee /specs/PRD.md para reglas globales                      │
│  2. Lee /specs/verticals/{vertical}/ para config específica     │
│  3. Lee /specs/STYLE.md para guía de código                     │
└─────────────────────────────────────────────────────────────────┘
                              ↓
┌─────────────────────────────────────────────────────────────────┐
│                    FASE 3: EXTRACCIÓN DE CONTENIDO              │
├─────────────────────────────────────────────────────────────────┤
│  content-extractor:                                             │
│  - Extrae contenido del contexto                                │
│  - Estructura por sección                                       │
│  - Verifica métricas y evidencia                                │
└─────────────────────────────────────────────────────────────────┘
                              ↓
┌─────────────────────────────────────────────────────────────────┐
│                    FASE 4: GENERACIÓN                           │
├─────────────────────────────────────────────────────────────────┤
│  code-generator:                                                │
│  - Genera código siguiendo STYLE.md                             │
│  - Aplica brand-assets                                          │
│  - Output en /output/{vertical}/                                │
└─────────────────────────────────────────────────────────────────┘
                              ↓
╔════════════════════════════════════════════════════════════════╗
║         GATE 2: Output técnicamente válido                     ║
║              (validator)                                       ║
║         Si FAIL → Volver a Fase 4                              ║
╚════════════════════════════════════════════════════════════════╝
                              ↓
┌─────────────────────────────────────────────────────────────────┐
│                    FASE 5: VALIDACIÓN                           │
├─────────────────────────────────────────────────────────────────┤
│  validator verifica:                                            │
│  - Criterios técnicos                                           │
│  - Criterios de contenido                                       │
│  - Criterios de negocio                                         │
└─────────────────────────────────────────────────────────────────┘
                              ↓
╔════════════════════════════════════════════════════════════════╗
║         GATE 3: Output alineado con negocio                    ║
║              (outcome-evaluator)                               ║
║         Si MISALIGNED → ESCALAR al usuario                     ║
╚════════════════════════════════════════════════════════════════╝
                              ↓
┌─────────────────────────────────────────────────────────────────┐
│                    FASE 6: DOCUMENTACIÓN                        │
├─────────────────────────────────────────────────────────────────┤
│  iteration-logger:                                              │
│  - Crea /iterations/v{NNN}/                                     │
│  - Documenta cambios y decisiones                               │
│  - Captura learnings generalizables                             │
└─────────────────────────────────────────────────────────────────┘
```

### Implementación de Gates en CLAUDE.md

```markdown
## Gates de Aprobación

### GATE 1: Pre-generación
**Cuándo:** Después de spec-reviewer
**Bloqueante si:**
- status = "blocked"
- Hay ambigüedades críticas
- Faltan archivos requeridos

**Acción si bloqueado:** Reportar gaps específicos al usuario, NO continuar.

### GATE 2: Post-generación
**Cuándo:** Después de code-generator
**Bloqueante si:**
- validator retorna status = "fail" con blocking_issues
- Hay errores técnicos críticos

**Acción si bloqueado:** Iterar en code-generator hasta que pase.

### GATE 3: Pre-deploy
**Cuándo:** Después de validator
**Bloqueante si:**
- outcome-evaluator retorna status = "misaligned"
- Hay riesgos de negocio identificados

**Acción si bloqueado:** Escalar al usuario con opciones claras.
```

---

## 8. Sistema de Iteración y Learnings

### Estructura de /iterations/

```
/iterations/
├── _learnings.md              # Knowledge base acumulativo
├── v001/
│   ├── manifest.yaml          # Metadata de la iteración
│   ├── feedback.md            # Problemas encontrados
│   ├── changes.md             # Cambios realizados en specs
│   └── learning.md            # Principio extraído
├── v002/
│   └── ...
└── v003/
    └── ...
```

### Plantilla de manifest.yaml

```yaml
# Iteración v001
timestamp: 2024-01-15T10:30:00Z
vertical: nombre-del-vertical
triggered_by: user-request|iteration|fix

specs_used:
  - path: /specs/PRD.md
    hash: abc123
  - path: /specs/verticals/vertical/config.yaml
    hash: def456

context_used:
  - /context/domains/vertical/DOMAIN.md
  - /context/company/product-bible.md

validation_status: pass|fail
agents_executed:
  - spec-reviewer: ready
  - content-extractor: complete
  - code-generator: complete
  - validator: pass

output_files:
  - /output/vertical/index.html

notes: "Descripción breve de esta iteración"
```

### Plantilla de _learnings.md

```markdown
# Base de Conocimiento - Learnings Acumulados

> Principios extraídos de iteraciones para prevenir errores recurrentes.

---

## [YYYY-MM-DD] - [Título Corto]

**Contexto:** Qué se estaba haciendo
**Error:** Qué salió mal
**Causa:** Por qué ocurrió
**Principio:** Regla general extraída (generalizable)
**Acción:** Qué se agregó/cambió para prevenir

---

## [YYYY-MM-DD] - [Otro Learning]

...
```

### Proceso de Captura de Learnings

```markdown
## Cuándo capturar un learning

✅ CAPTURAR cuando:
- Validación falla por PRIMERA VEZ con un tipo de error nuevo
- Usuario corrige algo que no anticipamos
- Se descubre un anti-pattern no documentado

❌ NO capturar cuando:
- Error ya está documentado en anti-patterns
- Es un error trivial (typo, sintaxis)
- Es específico a una instancia, no generalizable

## Proceso de extracción

1. **Identificar el error específico**
   ¿Qué exactamente estuvo mal?

2. **Encontrar causa raíz**
   ¿Qué spec faltaba? ¿Qué regla no existía?

3. **Generalizar**
   ¿Podría ocurrir en otros verticales/contextos?

4. **Documentar**
   Agregar a _learnings.md con formato estándar

5. **Prevenir**
   ¿Qué check agregar a spec-reviewer o validator?
```

---

## 9. Skills (Comandos Compuestos)

### Propósito
Un skill es un "macro" que ejecuta múltiples agentes en secuencia para lograr un objetivo completo.

### Estructura de un Skill

```
/skills/
└── /mi-skill/
    ├── SKILL.md                 # Definición del skill
    ├── workflow.md              # Fases y agentes
    ├── validation-criteria.md   # Criterios de aceptación
    └── anti-patterns.md         # Errores comunes a evitar
```

### Plantilla de SKILL.md

```markdown
# Skill: [Nombre]

## Trigger
- Usuario dice: "[comando]"
- Usuario pide: "[descripción de la tarea]"

## Objetivo
[Qué logra este skill]

## Agentes Involucrados
1. spec-reviewer
2. content-extractor
3. code-generator
4. validator
5. iteration-logger

## Workflow
Ver: workflow.md

## Criterios de Aceptación
Ver: validation-criteria.md

## Anti-patterns
Ver: anti-patterns.md
```

### Plantilla de workflow.md

```markdown
# Workflow: [Nombre del Skill]

## Fases

### Fase 1: Pre-validación
**Agente:** spec-reviewer
**Input:** /specs/, /context/domains/
**Gate:** status = ready
**Si falla:** STOP, reportar gaps

### Fase 2: Extracción
**Agente:** content-extractor
**Input:** /context/
**Output:** JSON estructurado por sección

### Fase 3: Generación
**Agente:** code-generator
**Input:** Output Fase 2 + /specs/STYLE.md
**Output:** /output/{vertical}/

### Fase 4: Validación
**Agente:** validator
**Gate:** status = pass
**Si falla:** Volver a Fase 3

### Fase 5: Documentación
**Agente:** iteration-logger
**Output:** /iterations/v{NNN}/
```

---

## 10. Integración de MCPs Externos

### Documentación de MCPs

Cada MCP externo se documenta en `/context/mcps/MCP-[NOMBRE].md`:

```markdown
# MCP: [Nombre]

## Propósito
[Qué hace este MCP]

## Endpoint/Modelo
- Provider: [Nombre del servicio]
- Modelo: "[nombre-del-modelo]"

## Funciones Disponibles

### función_1()
**Descripción:** [Qué hace]
**Input:** [Parámetros]
**Output:** [Qué retorna]
**Ejemplo:**
```
[Ejemplo de uso]
```

### función_2()
...

## Cuándo Usar

| Necesidad | Usar MCP | Usar Manual |
|-----------|----------|-------------|
| [Caso 1] | ✅ | |
| [Caso 2] | | ✅ |

## Limitaciones
- [Limitación 1]
- [Limitación 2]
```

### Integración en Agentes

En el agente que usa el MCP:

```markdown
# [Agente]

## MCP Disponible
**MCP:** MCP-[NOMBRE]
**Cuándo usar:** [Descripción]

## Proceso con MCP
1. [Paso normal]
2. **Si necesita [capacidad]:** Llamar MCP.[función]()
3. [Paso siguiente]
```

---

## 11. Checklist de Implementación

### Para crear un nuevo proyecto con este sistema:

#### Fase 1: Estructura Base
- [ ] Crear carpeta del proyecto
- [ ] Crear `/context/` con subcarpetas
- [ ] Crear `/specs/` con subcarpetas
- [ ] Crear `/output/`
- [ ] Crear `/iterations/`
- [ ] Crear `/.claude/agents/`
- [ ] Crear `/skills/`

#### Fase 2: Contexto
- [ ] Escribir `/context/_index.md`
- [ ] Crear `/context/company/product-bible.md`
- [ ] Crear brand-assets (colors.json, typography.json)
- [ ] Crear al menos un `/context/domains/{vertical}/DOMAIN.md`
- [ ] Crear `/context/domains/{vertical}/value-props.md`

#### Fase 3: Specs
- [ ] Escribir `/specs/PRD.md` con reglas globales
- [ ] Escribir `/specs/STYLE.md` con guía de código
- [ ] Crear `/specs/verticals/{vertical}/config.yaml`
- [ ] Crear `/specs/verticals/{vertical}/sections.md`
- [ ] Crear `/specs/verticals/{vertical}/cta-strategy.md`

#### Fase 4: Agentes
- [ ] Crear `/.claude/agents/spec-reviewer.md`
- [ ] Crear `/.claude/agents/content-extractor.md`
- [ ] Crear `/.claude/agents/code-generator.md`
- [ ] Crear `/.claude/agents/validator.md`
- [ ] Crear `/.claude/agents/iteration-logger.md`

#### Fase 5: Orquestador
- [ ] Escribir `CLAUDE.md` con toda la configuración
- [ ] Definir el workflow completo
- [ ] Definir los gates
- [ ] Documentar comandos rápidos

#### Fase 6: Skills
- [ ] Crear `/skills/{skill-principal}/SKILL.md`
- [ ] Crear `workflow.md`
- [ ] Crear `validation-criteria.md`
- [ ] Crear `anti-patterns.md`

#### Fase 7: Iteraciones
- [ ] Crear `/iterations/_learnings.md` (vacío inicialmente)
- [ ] Crear plantilla para v001/

---

## 12. Plantillas Listas para Usar

### Plantilla Mínima de CLAUDE.md

```markdown
# [Nombre del Sistema]

## Rol
Eres un sistema de generación de [tipo de output] outcome-driven.

**Filosofía:** "Edit the document, not the code."

## Regla de Oro
NUNCA generes sin:
1. Leer `/context/`
2. Verificar `/specs/`
3. Ejecutar spec-reviewer

## Sub-agentes

| Agente | Propósito |
|--------|-----------|
| spec-reviewer | Valida specs antes de generar |
| content-extractor | Extrae contenido del contexto |
| code-generator | Genera código |
| validator | Valida output |
| iteration-logger | Documenta cambios |

## Flujo
1. spec-reviewer → ¿ready?
2. content-extractor → extraer
3. code-generator → generar
4. validator → ¿pass?
5. iteration-logger → documentar

## NO hacer
- Inventar contenido
- Modificar /context/
- Saltar spec-reviewer
- Adivinar si hay ambigüedad
```

### Plantilla Mínima de DOMAIN.md

```markdown
# [Vertical] - Domain

## Driver
> [Frase corta]

## Audiencia
- [Rol principal]
- [Rol secundario]

## Términos clave
- [Término]: [Definición]

## Anti-patterns
- ❌ [No hacer]
```

### Plantilla Mínima de config.yaml

```yaml
vertical: nombre
driver: "Frase del driver"
domain_file: /context/domains/vertical/DOMAIN.md

sections:
  - hero
  - contenido
  - cta

cta:
  primary_text: "Texto del CTA"
  primary_action: "https://..."
```

---

## Resumen

Este sistema funciona porque:

1. **Separa concerns:** Contexto (verdad) vs Specs (config) vs Output (código)
2. **Usa agentes especializados:** Cada uno con una responsabilidad clara
3. **Tiene gates de bloqueo:** Previene errores antes de que sean costosos
4. **Captura learnings:** Cada error mejora el sistema para el futuro
5. **Es trazable:** Todo output se puede rastrear a su fuente

Para replicar:
1. Copia la estructura de carpetas
2. Adapta las plantillas a tu dominio
3. Define tus agentes con sus responsabilidades
4. Escribe CLAUDE.md como orquestador
5. Itera y captura learnings

**Tiempo estimado de setup:** 2-4 horas para estructura base, luego iteración continua.

# Saptiva Landing Pages Generator

## Rol
Eres un sistema de generación de landing pages outcome-driven.
Tu trabajo es traducir documentos de negocio en código funcional.

**Filosofía Central:** "Edit the document, not the code."
- Los documentos de negocio son la fuente de verdad
- El código es output derivado de los specs
- Si algo está mal, se arregla en el documento, no en el código

---

## Regla de Oro
NUNCA generes código sin antes:
1. Leer el contexto relevante en `/context/`
2. Verificar los specs en `/specs/`
3. Entender los criterios de validación
4. **Ejecutar spec-reviewer** para validar que los specs estén completos

---

## Sub-agentes Disponibles (11)

### Fase Pre-Build (Upstream)
| Agente | Propósito | Cuándo Usar |
|--------|-----------|-------------|
| `spec-reviewer` | Revisa specs antes de construir. Detecta ambigüedades, gaps, contradicciones. | **SIEMPRE** antes de generar algo nuevo |

### Fase Build (Core)
| Agente | Propósito | Cuándo Usar |
|--------|-----------|-------------|
| `content-strategist` | Extrae y adapta copy del contexto | Cuando necesitas contenido textual |
| `copy-reviewer` | Mexicaniza copy y valida ortografía/gramática con KAL | **SIEMPRE** después de content-strategist |
| `graphic-designer` | Genera assets visuales con MCP-Asset | Cuando se necesitan ilustraciones/iconos |
| `frontend-builder` | Genera HTML/CSS/JS siguiendo STYLE.md | Para crear el código de la landing |

### Fase Post-Build (Validation)
| Agente | Propósito | Cuándo Usar |
|--------|-----------|-------------|
| `validator` | Verifica criterios técnicos (HTML, CSS, assets, accesibilidad) | Después de generar código |
| `ux-reviewer` | Evalúa experiencia de usuario y potencial de conversión | Después de validación técnica |
| `outcome-evaluator` | Verifica alineación con objetivos de negocio | Validación final antes de entregar |

### Fase Iteración
| Agente | Propósito | Cuándo Usar |
|--------|-----------|-------------|
| `iteration-logger` | Documenta cambios y captura learnings | Cada vez que se modifica algo |

### Estratégico (On-Demand)
| Agente | Propósito | Cuándo Usar |
|--------|-----------|-------------|
| `expert-panel` | Reúne expertos virtuales para resolver problemas complejos de forma colaborativa | Decisiones estratégicas, copy/messaging, problemas sin respuesta obvia |
| `decision-maker` | Heurísticas para tomar decisiones autónomas sin escalar al CPO | Internalizado - no se invoca explícitamente |

---

## Flujo de Trabajo Completo

```
╔═════════════════════════════════════════════════════════════════╗
║                    HUMAN-IN-THE-LOOP (CPO)                      ║
╠═════════════════════════════════════════════════════════════════╣
║  El CPO revisa y aprueba en puntos clave:                       ║
║                                                                 ║
║  GATE 1: Pre-generación                                         ║
║  → Decisiones de CTA, estructura, prioridades                   ║
║  → spec-reviewer presenta resumen para aprobación               ║
║                                                                 ║
║  GATE 2: Post-generación (AUTO-PREVIEW)                         ║
║  → Se abre automáticamente en Chrome via MCP                    ║
║  → CPO revisa visualmente en browser real                       ║
║  → Feedback directo en chat                                     ║
║                                                                 ║
║  GATE 3: Pre-deploy                                             ║
║  → Aprobación final después de fixes                            ║
║  → Snapshot guardado en /iterations/vXXX/                       ║
║                                                                 ║
║  Sin aprobación en GATE, no se avanza al siguiente paso.        ║
╚═════════════════════════════════════════════════════════════════╝
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
│                    FASE 1: CONTEXTO                             │
├─────────────────────────────────────────────────────────────────┤
│  1. Lee /context/_index.md para saber qué archivos consultar    │
│  2. Para Enterprise: /context/domains/enterprise/DOMAIN.md      │
│     Para Gobierno: /context/domains/gobierno/DOMAIN.md          │
│  3. Extrae copy de /context/company/ según el dominio           │
│  4. Lee /context/design-system/DESIGN-REFERENCE.md              │
└─────────────────────────────────────────────────────────────────┘
                              ↓
┌─────────────────────────────────────────────────────────────────┐
│                    FASE 2: ESPECIFICACIÓN                       │
├─────────────────────────────────────────────────────────────────┤
│  1. Lee /specs/PRD.md para reglas globales                      │
│  2. Lee /specs/verticals/{vertical}/ para config específica     │
│  3. Lee /specs/STYLE.md para guía de frontend                   │
└─────────────────────────────────────────────────────────────────┘
                              ↓
┌─────────────────────────────────────────────────────────────────┐
│                    FASE 3: GENERACIÓN                           │
├─────────────────────────────────────────────────────────────────┤
│  Pipeline secuencial:                                           │
│  1. content-strategist → extrae copy del contexto               │
│  2. copy-reviewer → mexicaniza y valida con KAL                 │
│                                                                 │
│  Pipeline paralelo:                                             │
│  3a. graphic-designer → genera assets con MCP-Asset             │
│  3b. frontend-builder → genera HTML/CSS/JS                      │
│                                                                 │
│  4. Output en /output/{vertical}/                               │
│     ├── index.html                                              │
│     └── assets/    ← assets generados localmente                │
└─────────────────────────────────────────────────────────────────┘
                              ↓
┌─────────────────────────────────────────────────────────────────┐
│                    FASE 4: VALIDACIÓN TÉCNICA                   │
├─────────────────────────────────────────────────────────────────┤
│  validator verifica:                                            │
│  - HTML válido (sintaxis, estructura)                           │
│  - CSS responsive (mobile-first, breakpoints)                   │
│  - Assets existen (todos los src= apuntan a archivos reales)    │
│  - Accesibilidad (alt tags, contraste, semántica)               │
│  - Performance (< 3s carga, assets optimizados)                 │
│                                                                 │
│  → Si falla: iteration-logger documenta, volver a Fase 3        │
└─────────────────────────────────────────────────────────────────┘
                              ↓
┌─────────────────────────────────────────────────────────────────┐
│                    GATE 2: AUTO-PREVIEW                         │
├─────────────────────────────────────────────────────────────────┤
│  1. Abrir Chrome con MCP: file:///output/{vertical}/index.html  │
│  2. Esperar feedback del CPO en chat                            │
│  3. Si hay cambios: volver a Fase 3                             │
│  4. Si aprobado: continuar a Fase 5                             │
└─────────────────────────────────────────────────────────────────┘
                              ↓
┌─────────────────────────────────────────────────────────────────┐
│                    FASE 5: VALIDACIÓN UX                        │
├─────────────────────────────────────────────────────────────────┤
│  ux-reviewer evalúa:                                            │
│  - Claridad en 3 segundos                                       │
│  - Flujo narrativo                                              │
│  - Fricción de conversión                                       │
│  - Elementos de confianza                                       │
│                                                                 │
│  → Si issues críticos: iteration-logger documenta               │
└─────────────────────────────────────────────────────────────────┘
                              ↓
┌─────────────────────────────────────────────────────────────────┐
│                    FASE 6: VALIDACIÓN OUTCOME                   │
├─────────────────────────────────────────────────────────────────┤
│  outcome-evaluator verifica:                                    │
│  - Alineación con driver del dominio                            │
│  - Potencial de conversión real                                 │
│  - Diferenciación vs competencia                                │
│  - Riesgos de negocio                                           │
│                                                                 │
│  → Si status = "aligned": ENTREGAR                              │
│  → Si status = "misaligned": Escalar a usuario                  │
└─────────────────────────────────────────────────────────────────┘
                              ↓
┌─────────────────────────────────────────────────────────────────┐
│                    FASE 7: DOCUMENTACIÓN                        │
├─────────────────────────────────────────────────────────────────┤
│  iteration-logger:                                              │
│  - Crea entrada en /iterations/vXXX/                            │
│  - Documenta qué se generó                                      │
│  - Captura learnings en /_learnings.md                          │
└─────────────────────────────────────────────────────────────────┘
```

---

## Skills Disponibles

### `landing-generation`
Genera una landing completa para un vertical específico.
- **Trigger:** Usuario pide generar landing
- **Workflow:** `/skills/landing-generation/workflow.md`
- **Validation:** `/skills/landing-generation/validation-criteria.md`

### `iteration-management`
Gestiona cambios y mejoras a landings existentes.
- **Trigger:** Usuario pide modificar algo
- **Workflow:** `/skills/iteration-management/`

---

## Estructura de Archivos

```
/context/           ← READ-ONLY (fuente de verdad)
  ├── company/      ← whitepaper.md, product-bible.md, brand-assets/
  ├── domains/      ← DOMAIN.md por vertical (ubiquitous language)
  └── design-system/← DESIGN-REFERENCE.md, assets/, reference/

/specs/             ← EDITABLE (lo que el usuario modifica)
  ├── PRD.md        ← Reglas globales
  ├── STYLE.md      ← Guía de frontend
  └── verticals/    ← Config por vertical (sections, cta-strategy)

/output/            ← GENERATED (código generado)
  ├── enterprise/
  └── gobierno/

/iterations/        ← HISTORY (cambios documentados)
  ├── _learnings.md
  └── vXXX/
```

---

## Lo Que NO Debes Hacer

1. **Inventar copy** que no esté en el contexto
2. **Ignorar** los criterios de validación
3. **Modificar** archivos en `/context/` (son read-only)
4. **Generar** sin haber leído el DOMAIN.md correspondiente
5. **Saltarte** la fase de spec-reviewer
6. **Adivinar** cuando algo está ambiguo - reporta el gap

---

## Comando Rápido

Para generar una landing completa:
```
Genera la landing de {financial-services|gobierno}
```

Esto activa automáticamente:

**Pre-Build:**
1. spec-reviewer → valida specs (GATE 1: espera aprobación)

**Build:**
2. content-strategist → extrae copy
3. copy-reviewer → mexicaniza con KAL
4. graphic-designer + frontend-builder → genera assets y código (paralelo)

**Validation:**
5. validator → verifica técnico + assets
6. **AUTO-PREVIEW** → abre en Chrome (GATE 2: espera feedback)
7. ux-reviewer → verifica UX
8. outcome-evaluator → verifica negocio (GATE 3: aprobación final)

**Post:**
9. iteration-logger → documenta en /iterations/

# Changelog Format

## Estructura de Versión

Cada iteración se documenta en `/iterations/v{NNN}/` con:

```
v{NNN}/
├── manifest.yaml      # Metadata de la iteración
├── output/            # Snapshot del output generado
├── feedback.md        # Qué estuvo mal (si aplica)
├── changes.md         # Qué se cambió en specs
└── learning.md        # Qué principio se extrajo
```

## manifest.yaml

```yaml
timestamp: 2026-01-18T14:30:00Z
vertical: gobierno|enterprise
specs_used:
  - specs/PRD.md@{git-hash}
  - specs/STYLE.md@{git-hash}
  - specs/verticals/{vertical}/config.yaml@{git-hash}
context_used:
  - context/domains/{vertical}/DOMAIN.md
  - context/company/whitepaper.md
validation_status: pass|fail
triggered_by: user-request|iteration
```

## feedback.md

```markdown
# Feedback v{NNN}

## Problema Detectado
[Descripción clara del problema]

## Evidencia
[Qué spec o contexto contradice el output]

## Impacto
[Por qué esto es un problema para el negocio/usuario]
```

## changes.md

```markdown
# Cambios v{NNN}

## Archivo Modificado
`specs/verticals/{vertical}/{file}.md`

## Cambio Realizado
[Descripción del cambio]

## Razón
[Por qué se hizo este cambio]

## Antes
[Contenido anterior relevante]

## Después
[Contenido nuevo]
```

## learning.md

```markdown
# Aprendizaje v{NNN}

## Principio Nuevo
[Regla generalizable extraída de este caso]

## Regla Agregada
[Dónde se documentó y qué dice]

## Prevención
[Cómo este aprendizaje previene errores futuros]
```

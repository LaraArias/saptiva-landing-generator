# Learning Capture Process

## Objetivo
Extraer principios generalizables de errores específicos para prevenir su recurrencia.

## Cuándo Capturar

### Siempre capturar cuando:
- Validación falla por primera vez con un tipo de error nuevo
- Usuario corrige algo que no anticipamos
- Se descubre un anti-pattern no documentado

### No capturar cuando:
- Error ya está documentado en anti-patterns
- Es un error de typo o sintaxis trivial
- Es específico a una instancia, no generalizable

## Proceso de Extracción

### Paso 1: Identificar el Error Específico
- ¿Qué exactamente estuvo mal?
- ¿Qué output se generó vs qué se esperaba?

### Paso 2: Encontrar la Causa Raíz
- ¿Qué spec faltaba o era ambiguo?
- ¿Qué contexto no se consultó?
- ¿Qué suposición incorrecta se hizo?

### Paso 3: Generalizar
- ¿Este error podría ocurrir en otros verticales?
- ¿Es un patrón que podría repetirse?
- ¿Qué regla general previene este tipo de error?

### Paso 4: Documentar
- Agregar a `/iterations/_learnings.md`
- Si aplica, agregar a `anti-patterns.md` del skill relevante
- Si requiere cambio de spec, documentar en `changes.md`

## Formato de Aprendizaje

```markdown
## [Fecha] - [Título Corto]

**Contexto**: [Qué se estaba haciendo]

**Error**: [Qué salió mal]

**Causa**: [Por qué ocurrió]

**Principio**: [Regla general extraída]

**Acción**: [Qué se agregó/cambió para prevenir]
```

## Ejemplos de Buenos Aprendizajes

### ✅ Bueno
"Los CTAs deben reflejar el driver principal del dominio, no usar CTAs genéricos de SaaS."

### ❌ Malo
"El botón de gobierno debería decir 'Control' en lugar de 'Demo'."

La diferencia: el bueno es generalizable, el malo es específico a una instancia.

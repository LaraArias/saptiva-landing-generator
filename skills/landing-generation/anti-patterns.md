# Anti-patterns - Landing Generation

## Copy

### ❌ Inventar copy
**Problema**: Generar texto que no existe en las fuentes de contexto.
**Por qué es malo**: Puede contradecir messaging oficial, crear inconsistencias.
**Solución**: SIEMPRE extraer de `/context/company/` o `/context/domains/`.

### ❌ Ignorar ubiquitous language
**Problema**: Usar términos genéricos en lugar del vocabulario del dominio.
**Por qué es malo**: No resuena con la audiencia específica.
**Solución**: Consultar tabla de términos en `DOMAIN.md` del vertical.

### ❌ CTA genérico
**Problema**: Usar "Solicita Demo" o "Contáctanos" para todos los segmentos.
**Por qué es malo**: No conecta con el driver principal del dominio.
**Solución**: Leer `cta-strategy.md` del vertical antes de generar CTA.

## Técnico

### ❌ CSS hardcodeado
**Problema**: Usar colores hex directos en lugar de variables.
**Por qué es malo**: Rompe consistencia de marca, dificulta cambios.
**Solución**: Usar variables de `/context/company/brand-assets/colors.json`.

### ❌ No testear responsive
**Problema**: Solo verificar en desktop.
**Por qué es malo**: Mayoría del tráfico es mobile.
**Solución**: Validar breakpoints definidos en `STYLE.md`.

### ❌ Imágenes pesadas
**Problema**: Usar imágenes sin optimizar.
**Por qué es malo**: Aumenta tiempo de carga > 3 segundos.
**Solución**: Comprimir y usar formatos modernos (WebP).

## Proceso

### ❌ Generar sin leer DOMAIN.md
**Problema**: Saltar directo a generación de código.
**Por qué es malo**: Se pierde contexto crítico del segmento.
**Solución**: SIEMPRE leer DOMAIN.md como primer paso.

### ❌ Ignorar validación fallida
**Problema**: Entregar output aunque validator reporte errores.
**Por qué es malo**: Acumula deuda técnica y de contenido.
**Solución**: Documentar fallo, solicitar cambio en specs, iterar.

### ❌ Modificar contexto
**Problema**: Editar archivos en `/context/`.
**Por qué es malo**: Contexto es fuente de verdad, debe ser read-only.
**Solución**: Si contexto está mal, escalar a owner del documento.

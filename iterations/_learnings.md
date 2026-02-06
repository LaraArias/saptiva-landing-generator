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

---

## [2026-01-14] - MCP-Asset acelera generación de assets visuales

**Contexto**: v002 tenía image paths rotos que causaban 404s
**Solución**: Usar MCP-Asset (Gemini) para generar assets on-demand
**Resultado**: 4 assets generados en <30 segundos, estilo consistente
**Principio**: No depender de assets externos con paths frágiles; generar assets locales en /output/{vertical}/assets/
**Acción**: Siempre guardar assets generados en directorio local del output

---

## [2026-01-14] - Saptiva KAL funciona para mexicanización de copy

**Contexto**: Copy de landing necesitaba sonar natural para C-level mexicano
**Solución**: Pasar copy por Saptiva KAL antes de implementar
**Resultado**: Cambios sutiles pero importantes ("IA a producción" → "IA en producción")
**Principio**: Siempre pasar copy final por KAL antes de commit
**Modelo correcto**: "Saptiva KAL" (no "saptiva-kal")

---

## [2026-01-14] - Mensajes de segmento deben ser puros

**Contexto**: Hero subtitle mezclaba drivers de Enterprise (velocidad) y Gobierno (cumplimiento)
**Error**: "Control total sobre datos con cumplimiento regulatorio" en landing Enterprise
**Causa**: DOMAIN.md de Enterprise dice explícitamente "NO enfatizar soberanía"
**Principio**: Un landing = un driver. No mezclar mensajes de diferentes segmentos.
**Acción**: Reemplazado por "Observabilidad completa con métricas directas a tus KPIs"

---

## [2026-01-17] - Navegación consistente es crítica en sitios multi-página

**Contexto**: v003 tenía páginas aisladas (Home, Financial Services, Gobierno) sin navegación entre ellas
**Error**: Usuario podía llegar a /financial-services/ pero no tenía forma de regresar a Home o explorar Gobierno
**Causa**: Specs no incluían requisito de navegación global; cada página se generó como entidad aislada
**Principio**: TODO sitio multi-página DEBE tener navegación global desde v1, no como afterthought
**Acción**:
- Agregar "Navegación Global" como sección obligatoria en PRD.md
- Validar existencia y consistencia de nav en ux-reviewer (nuevo criterio)
- Usar links relativos si no hay servidor (`../home/index.html` vs `/home/`)
- Estructura de directorios debe reflejar branding (enterprise → financial-services)

**Implementación en v004:**
```html
<!-- Nav idéntico en 3 páginas -->
<nav>
  <a href="../home/index.html">Logo → Home</a>
  <a href="../home/index.html">Home</a>
  <div class="dropdown">
    <button>Industrias ▼</button>
    <div>
      <a href="../financial-services/index.html">Financial Services</a>
      <a href="../gobierno/index.html">Gobierno</a>
    </div>
  </div>
  <a href="#" class="cta">Agenda demo</a>
</nav>
```

**Validación:** ux-reviewer ahora debe verificar:
- Nav presente en todas las páginas
- Links funcionan (relativos o absolutos según contexto)
- Dropdown accesible por teclado
- Active state visible en página actual

---

## [2026-02-06] - NUNCA inventar datos geográficos para mapas SVG

**Contexto**: Creando mapa interactivo de LATAM para landing de Gobierno
**Error**: Primer intento generó SVG paths "a mano" que produjeron polígonos irregulares sin parecido a LATAM
**Causa raíz**: Múltiples capas de fallo:
1. SVG paths fueron inventados basándose en descripción textual de geografía
2. ux-reviewer "aprobó" el mapa leyendo solo código SVG, sin renderizar visualmente
3. No hubo validación real hasta que el usuario vio el resultado en Chrome

**Principio 1**: NUNCA generar paths SVG geográficos sin datos reales
- Los mapas DEBEN construirse desde fuentes de datos verificables
- No importa qué tan precisa sea la descripción textual, paths inventados no funcionan

**Principio 2**: Reviewers que leen código NO pueden validar output visual
- Un agente leyendo SVG code no puede determinar si "parece LATAM"
- Validación visual REQUIERE renderizar en navegador o generar screenshot
- Si no hay capacidad de screenshot, ESCALAR al usuario para validación visual

**Principio 3**: Assets geográficos requieren pipeline especializado
- No son equivalentes a "generar un icono" o "crear una ilustración"
- Requieren datos científicos de proyección cartográfica

**Fuentes de datos confiables:**
```
Natural Earth (recomendado para ilustraciones):
https://raw.githubusercontent.com/nvkelso/natural-earth-vector/master/geojson/

Resoluciones disponibles:
- ne_110m = baja resolución (suficiente para landing pages)
- ne_50m = media resolución
- ne_10m = alta resolución (heavy, solo para apps especializadas)

Alternativas:
- OpenStreetMap (para mapas interactivos complejos)
- GeoJSON.xyz (simplified boundaries)
```

**Transformación correcta GeoJSON → SVG:**
```python
# 1. Definir bounds del área (ejemplo LATAM)
min_lon, max_lon = -120, -30
min_lat, max_lat = -56, 35

# 2. Convertir coordenadas geográficas a píxeles SVG
def geo_to_svg(lon, lat, svg_width, svg_height):
    x = (lon - min_lon) / (max_lon - min_lon) * svg_width
    y = (max_lat - lat) / (max_lat - min_lat) * svg_height  # Flip Y axis
    return x, y

# 3. Aplicar a cada coordenada del GeoJSON
# 4. Generar path string: "M x1,y1 L x2,y2 L x3,y3 Z"
```

**Proceso correcto para assets geográficos:**
1. Identificar fuente de datos confiable (Natural Earth, OSM)
2. Descargar GeoJSON real del área requerida
3. Transformar coordenadas a SVG con proyección adecuada
4. Generar archivo SVG
5. **RENDERIZAR en navegador y verificar visualmente**
6. Solo entonces declarar "aprobado"

**Acción implementada (v005 Gobierno):**
- Mapa LATAM construido desde `ne_110m_admin_0_countries.geojson`
- Script Python para extracción y transformación
- Validación visual en Chrome antes de aprobar
- Resultado: mapa geográficamente preciso de 19 países LATAM

**Actualización a specs:**
- Agregar a `graphic-designer` instructions: "Para mapas geográficos, SIEMPRE usar fuentes de datos reales"
- Agregar a `ux-reviewer` checklist: "¿El asset requiere validación visual? Si sí, escalar al usuario"
- Agregar a validation-criteria.md: "Assets geográficos deben incluir fuente de datos en comentario SVG"

**Regla general extraída:**
> Si un asset representa datos del mundo real (mapas, gráficos científicos, diagramas técnicos),
> DEBE generarse desde datos verificables, no desde conocimiento interno del LLM.

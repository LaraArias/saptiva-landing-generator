# MCP-Asset: AI Graphic Designer

## Ubicación
```
/Users/carloslara/Desktop/CODE/MCPs/MCP-Asset
```

## Ejecutable
```bash
node /Users/carloslara/Desktop/CODE/MCPs/MCP-Asset/dist/index.js
```

## Propósito
Genera iconos e ilustraciones ultra-minimalistas para presentaciones tech. Interpreta cualquier concepto y lo convierte en un visual profesional con estilo consistente (paleta teal, fondos claros u oscuros).

## Herramientas Disponibles

### `design`
Genera una imagen desde un concepto.

| Parámetro | Tipo | Descripción |
|-----------|------|-------------|
| `concept` | string | Lo que quieres visualizar ("security lock", "data flow", "API gateway") |
| `variant` | light/dark/auto | Estilo visual |
| `provider` | gemini/openai/auto | Motor de generación |
| `output` | image/svg/both | Formato de salida |

**Ejemplo:**
```javascript
design({ concept: "cloud security", variant: "dark", output: "both" })
```

### `convert_to_svg`
Convierte imagen existente a SVG.

| Parámetro | Tipo | Descripción |
|-----------|------|-------------|
| `image_path` | string | Ruta a la imagen |
| `image_base64` | string | Imagen en base64 (alternativa) |

### `save_svg`
Guarda SVG optimizado para PowerPoint.

## Variables de Entorno Requeridas

```env
GEMINI_API_KEY=xxx   # Para Imagen 3 (recomendado, mejor minimalismo)
OPENAI_API_KEY=xxx   # Para GPT-Image-1 (requiere org verificada)
```

## Cuándo Usar

| Necesidad | Tool |
|-----------|------|
| Generar ilustración para landing | `design` |
| Convertir PNG a SVG editable | `convert_to_svg` |
| Guardar para presentaciones | `save_svg` |

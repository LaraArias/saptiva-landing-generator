# MCP-Saptiva: Modelos de IA Saptiva

## Propósito
Acceso a los modelos de Saptiva AI: KAL (español mexicano), OCR, embeddings, y modelos de chat/razonamiento.

## Herramientas Disponibles

### `saptiva_chat`
Chat con modelos de Saptiva.

```json
{
  "model": "Saptiva Turbo",
  "messages": [
    {"role": "system", "content": "Instrucciones opcionales"},
    {"role": "user", "content": "Pregunta del usuario"}
  ],
  "max_tokens": 600,
  "temperature": 0.7
}
```

**Modelos disponibles:**
- `Saptiva Turbo` - Respuestas rápidas, uso general
- `Saptiva Cortex` - Razonamiento, matemáticas, lógica
- `Saptiva Ops` - RAG, casos complejos
- `Saptiva Legacy` - Compatibilidad con herramientas legacy
- `Saptiva KAL` - Contexto mexicano (Mistral-based)

### `saptiva_reason`
Razonamiento paso a paso (usa Saptiva Cortex).

```json
{
  "question": "Si tengo 5 manzanas y como 2, ¿cuántas quedan?",
  "context": "Contexto opcional",
  "max_tokens": 1000
}
```

Retorna el proceso de razonamiento Y la respuesta final.

### `saptiva_ocr`
Extraer texto de imágenes.

```json
{
  "image_url": "https://ejemplo.com/imagen.png",
  "prompt": "Extrae todo el texto de esta imagen"
}
```

Acepta URLs públicas o imágenes en base64 (`data:image/png;base64,...`).

### `saptiva_embed`
Generar embedding de un texto.

```json
{
  "text": "Texto para convertir a vector"
}
```

Retorna un vector de 4096 dimensiones.

### `saptiva_batch_embed`
Embeddings de múltiples textos.

```json
{
  "texts": ["Texto 1", "Texto 2", "Texto 3"]
}
```

### `saptiva_list_models`
Ver modelos disponibles con precios y capacidades.

```json
{}
```

### `saptiva_help`
Documentación y ejemplos.

```json
{
  "topic": "quick_start"
}
```

Topics: `quick_start`, `chat_example`, `reasoning_example`, `ocr_example`, `embedding_example`, `all_tools`, `curl_examples`, `agents_sdk`

## Modelos y Casos de Uso

| Modelo | Usar para |
|--------|-----------|
| Saptiva Turbo | Respuestas rápidas, uso general |
| Saptiva Cortex | Razonamiento, matemáticas, lógica |
| Saptiva Ops | RAG, casos complejos |
| Saptiva OCR | Extracción de texto de imágenes |
| Saptiva Embed | Generar embeddings |
| Saptiva KAL | **Mexicanización de copy**, contexto legal/fiscal MX |

## Uso en Landing Generator

### Mexicanización de Copy
```javascript
saptiva_chat({
  model: "Saptiva KAL",
  messages: [
    {role: "system", content: "Eres un copywriter mexicano para audiencia C-level en banca."},
    {role: "user", content: "Reescribe este copy para que suene natural: ..."}
  ]
})
```

## Referencias
- Documentación API: https://saptiva.gitbook.io/saptiva-docs
- Saptiva Agents SDK: https://saptiva.gitbook.io/saptiva-agents
- Obtener API Key: https://lab.saptiva.com/

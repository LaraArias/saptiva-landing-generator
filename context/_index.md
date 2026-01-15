# Context Index

Este archivo mapea qué fuente de contexto usar para cada propósito.

## Estructura

```
context/
├── _index.md                 # Este archivo
├── company/                  # Contexto general de Saptiva
│   ├── whitepaper.md         # Documento técnico/estratégico
│   ├── product-bible.md      # Definición de producto
│   └── brand-assets/         # Colores y tipografía
├── domains/                  # Contexto por vertical
│   ├── enterprise/           # Bounded context enterprise
│   └── gobierno/             # Bounded context gobierno
└── design-system/            # Sistema de diseño visual
    ├── DESIGN-REFERENCE.md   # Guía completa de diseño
    ├── assets/               # Logo y assets
    └── reference/            # Imágenes de referencia del sitio
```

## Cuándo Usar Cada Fuente

### Para Enterprise
| Necesidad | Archivo |
|-----------|---------|
| Ubiquitous language | `/context/domains/enterprise/DOMAIN.md` |
| Propuestas de valor | `/context/domains/enterprise/value-props.md` |
| Manejo de objeciones | `/context/domains/enterprise/objections.md` |
| Copy de producto | `/context/company/product-bible.md` |
| Colores y tipografía | `/context/company/brand-assets/` |

### Para Gobierno
| Necesidad | Archivo |
|-----------|---------|
| Ubiquitous language | `/context/domains/gobierno/DOMAIN.md` |
| Propuestas de valor | `/context/domains/gobierno/value-props.md` |
| Manejo de objeciones | `/context/domains/gobierno/objections.md` |
| Copy técnico/legal | `/context/company/whitepaper.md` |
| Colores y tipografía | `/context/company/brand-assets/` |

### Para Diseño Visual
| Necesidad | Archivo |
|-----------|---------|
| Guía completa de diseño | `/context/design-system/DESIGN-REFERENCE.md` |
| Logo | `/context/design-system/assets/logo-color.png` |
| Ejemplos visuales | `/context/design-system/reference/*.png` |

### Para MCPs (Herramientas Externas)
| Necesidad | Archivo |
|-----------|---------|
| Generar assets/ilustraciones | `/context/mcps/MCP-ASSET.md` |
| Mexicanizar copy con KAL | `/context/mcps/MCP-SAPTIVA.md` |
| OCR de documentos | `/context/mcps/MCP-SAPTIVA.md` |

## Reglas

1. **Read-only**: Nunca modificar archivos en `/context/`
2. **Fuente de verdad**: Si hay conflicto, `/context/` tiene precedencia
3. **Extraer, no inventar**: Todo copy debe venir de estas fuentes

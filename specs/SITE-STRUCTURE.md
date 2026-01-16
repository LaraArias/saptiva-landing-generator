# Estructura del Sitio Saptiva

## Navegación

```
NAVBAR: [Logo Saptiva] [Home] [Industria ▼] [CTA]
                              ├── Servicios Financieros
                              └── Gobierno
```

## Páginas

### 1. Home (`/`)
- **Propósito:** Qué es Saptiva (El sistema operativo de IA para LATAM)
- **Driver:** General - presentar la plataforma
- **Audiencia:** Todos los visitantes
- **Output:** `/output/home/index.html`

### 2. Servicios Financieros (`/financial-services`)
- **Propósito:** Landing específica para banca/fintech
- **Driver:** Time to Value
- **Audiencia:** CTOs, VPs Engineering, Heads of AI en instituciones financieras
- **Output:** `/output/financial-services/index.html`

### 3. Gobierno (`/gobierno`)
- **Propósito:** Landing específica para sector público
- **Driver:** IA Soberana
- **Audiencia:** Tomadores de decisión en gobierno, reguladores
- **Output:** `/output/gobierno/index.html`

## Specs por Página

```
/specs/verticals/
├── home/
│   ├── config.yaml
│   └── sections.md
├── financial-services/
│   ├── config.yaml
│   ├── sections.md
│   └── cta-strategy.md
└── gobierno/
    ├── config.yaml
    ├── sections.md
    └── cta-strategy.md
```

## Contexto por Página

```
/context/domains/
├── financial-services/
│   ├── DOMAIN.md      ← Driver: Time to Value
│   └── value-props.md
└── gobierno/
    ├── DOMAIN.md      ← Driver: IA Soberana
    └── value-props.md
```

## Diferenciación por Vertical

| Aspecto | Financial Services | Gobierno |
|---------|-------------------|----------|
| **Driver** | Time to Value | IA Soberana |
| **Métrica clave** | 2 semanas a producción | 7 requisitos de soberanía |
| **Tono** | Ejecutivo, ROI, board | Institucional, seguridad, control |
| **CTA** | "Acelera tu time-to-value" | "Agenda una sesión de arquitectura" |
| **Evitar** | Soberanía, jurisdicción | Velocidad como driver, jerga startup |

## Flujo de Generación

1. Usuario pide generar landing de `{vertical}`
2. Sistema lee `/specs/verticals/{vertical}/`
3. Sistema lee `/context/domains/{vertical}/`
4. Content-strategist extrae copy
5. Frontend-builder genera código
6. Output en `/output/{vertical}/`

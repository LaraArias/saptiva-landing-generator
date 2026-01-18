# Estructura del Sitio Saptiva

> Inspiración: [meetgail.com](https://www.meetgail.com/)

## Navegación

```
NAVBAR: [Logo Saptiva] [Home] [Industria ▼] [Agenda Demo]
                              ├── Servicios Financieros
                              └── Gobierno
```

---

## Páginas

### 1. Home (`/`)
- **Propósito:** Qué es Saptiva (El sistema operativo de IA para LATAM)
- **Driver:** Exploración → Conversión
- **Audiencia:** Todos los visitantes
- **Output:** `/output/home/index.html`

#### Secciones de Home
```
1. Hero            → Posicionamiento + verticales destacadas
2. Social Proof    → Logos de clientes/partners
3. Propuesta Valor → 3 pilares (Infraestructura, Modelos, Control)
4. Comparativa     → Saptiva vs IA Genérica
5. Casos de Uso    → Cards por industria (→ verticales)
6. Métricas        → Números de impacto
7. Testimonios     → Social proof con voz de clientes
8. CTA Final       → Conversión de cierre
9. Footer          → Navegación secundaria
```

#### Elementos Clave (inspirados en Gail)
| Elemento | Implementación |
|----------|----------------|
| Hero con verticales | [SERVICIOS FINANCIEROS] [GOBIERNO] como badges |
| Social proof inmediato | Logos después del hero |
| Comparativa explícita | Tabla "Saptiva vs IA Genérica" |
| Métricas cuantificadas | "2 semanas", "50%+", "99.9%", "100%" |
| CTAs duales | "Agenda demo" + "Descarga whitepaper" |

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
│   ├── sections.md      ← 9 secciones definidas
│   └── cta-strategy.md  ← Estrategia de conversión
├── financial-services/
│   ├── sections.md
│   └── cta-strategy.md
└── gobierno/
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

## Diferenciación por Página

| Aspecto | Home | Financial Services | Gobierno |
|---------|------|-------------------|----------|
| **Driver** | Exploración | Time to Value | IA Soberana |
| **Métrica clave** | - | 2 semanas a producción | 7 requisitos de soberanía |
| **Tono** | Accesible, general | Ejecutivo, ROI, board | Institucional, seguridad |
| **CTA Principal** | "Agenda una demo" | "Empieza en 2 semanas" | "Agenda sesión de arquitectura" |
| **Secciones** | 9 | 5 | 6 |
| **Enfoque** | Qué es Saptiva | Por qué Saptiva (velocidad) | Por qué Saptiva (control) |

## Flujo de Generación

1. Usuario pide generar landing de `{vertical}`
2. Sistema lee `/specs/verticals/{vertical}/`
3. Sistema lee `/context/domains/{vertical}/`
4. Content-strategist extrae copy
5. Frontend-builder genera código
6. Output en `/output/{vertical}/`

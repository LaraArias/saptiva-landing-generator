# Gobierno Domain - Bounded Context

## Ubiquitous Language

| Término | Significado en Gobierno | Fuente |
|---------|------------------------|--------|
| IA Soberana | Infraestructura que cumple 7 requisitos de control | Whitepaper |
| Control plane | El cerebro que decide dónde corren las cargas - debe estar bajo jurisdicción local | Whitepaper |
| CLOUD Act | Ley de EEUU que permite acceso a datos en servidores de empresas americanas | Whitepaper |
| Residencia de datos | Datos físicamente en la jurisdicción elegida | Whitepaper |
| Golden Copy | Copia maestra de datos que debe estar en México | Whitepaper |
| Compliance demostrable | Evidencia generada en horas, no semanas | Whitepaper |

## Audiencia Primaria

| Rol | Preocupación Principal |
|-----|------------------------|
| CTO Sector Público | Control jurisdiccional, no depender de hyperscalers extranjeros |
| Director de TI | Compliance con regulaciones locales, auditoría |
| Responsable de Seguridad | Cifrado, aislamiento, acceso a llaves |
| Tomador de decisiones | Independencia tecnológica, soberanía nacional |

## Driver Principal

**IA Soberana (Sovereign AI)**

> "Una plataforma que no cumpla estos siete requisitos puede ser útil, eficiente, o económica. No califica como IA Soberana."
> — Whitepaper Saptiva

### Los 7 Requisitos (no negociables):
1. Control plane bajo jurisdicción local
2. Data plane sin dependencia legal extranjera
3. Observabilidad auditable por el cliente
4. Portabilidad verificable
5. Capacidad de salida (data e inference exit)
6. Cifrado con control de llaves por el cliente
7. Aislamiento verificable entre clientes

### Lo que SÍ importa:
1. Jurisdicción legal de datos y control plane
2. Protección contra CLOUD Act
3. Compliance demostrable ante reguladores
4. Independencia de hyperscalers extranjeros

### Lo que NO importa (tanto):
1. Velocidad de implementación
2. Costo (seguridad > precio)
3. Features de producto

## Fuentes de Copy

| Fuente | Uso |
|--------|-----|
| `/context/company/whitepaper.md` | Los 7 requisitos, arquitectura, compliance |
| `/context/domains/gobierno/value-props.md` | Propuestas específicas |

## Anti-patterns

### NO hacer:
- Enfatizar velocidad o time-to-value como driver principal
- Usar lenguaje de startup o tech bro
- Minimizar la importancia de la jurisdicción
- Prometer sin explicar cómo se cumple

### SÍ hacer:
- Explicar cada requisito con detalle técnico
- Mencionar CLOUD Act y sus implicaciones
- Usar tono institucional y serio
- Ofrecer evidencia de compliance
- Mencionar certificaciones (ISO 27001, SOC 2)

## Mensajes Clave para Landing

### Hero
- "IA bajo tu jurisdicción"
- "Los 7 requisitos de IA Soberana"

### Diferenciadores
- Control plane local
- Sin dependencia de CLOUD Act
- Compliance demostrable en horas

### CTA
- "Agenda una sesión de arquitectura"
- "Descarga el whitepaper"

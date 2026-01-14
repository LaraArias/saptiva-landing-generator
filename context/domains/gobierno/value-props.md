# Gobierno Value Propositions

<!--
READ-ONLY: Fuente de verdad para copy de Gobierno.
Extraído de: whitepaper.md
Adaptado al driver: Soberanía + Compliance
Fecha: 2025-01-14
-->

## Propuesta de Valor Principal

**"Infraestructura de IA bajo jurisdicción nacional: control total sobre datos, modelos y operación sin dependencia de proveedores extranjeros."**

---

## Propuestas Secundarias

### 1. Soberanía de Datos y Jurisdicción Nacional

**Protección ante la CLOUD Act y legislaciones extraterritoriales**

Sus datos permanecen bajo jurisdicción mexicana. La CLOUD Act estadounidense (2018) faculta a tribunales de ese país a exigir datos de cualquier empresa americana, sin importar dónde estén los servidores. Con Saptiva:

- Control plane y data plane operan bajo jurisdicción local
- Residencia de datos en territorio nacional, verificable
- Independencia legal de entidades sujetas a legislación extranjera
- Protección contractual con procedimientos claros ante requerimientos externos

> **Referencia:** En 2025, Solvinity (Países Bajos) fue adquirida por entidad estadounidense, exponiendo infraestructura gubernamental europea a la CLOUD Act.

---

### 2. Compliance Normativo y Capacidad de Auditoría

**Cumplimiento demostrable, no declarativo**

La infraestructura está diseñada para que el cumplimiento sea verificable por auditores y reguladores:

- Audit trails inmutables con registro de cada operación
- Trazabilidad completa: quién accedió, cuándo, qué modelo, qué datos
- Observabilidad auditable por la institución
- Exportación de evidencia de cumplimiento en horas, no semanas
- Alineación con Ley Federal de Protección de Datos Personales
- Compatibilidad con estándares ISO 27001 y SOC 2 Type II

---

### 3. Independencia Tecnológica

**Operación sin hyperscalers extranjeros**

Eliminación de dependencias que comprometen la autonomía institucional:

- Despliegue en infraestructura nacional (on-premise, nube privada, air-gapped)
- Soporte nativo para modelos open source (sin licencias restrictivas)
- Protocolos abiertos (REST, gRPC, GraphQL) - sin APIs propietarias
- Portabilidad verificable: migración sin barreras técnicas artificiales
- Capacidad de salida garantizada: extracción total de datos, configuraciones y modelos

> **Cero vendor lock-in:** La institución mantiene control total sobre su inversión tecnológica.

---

### 4. Control Total y Trazabilidad

**Gobierno completo sobre la operación de IA**

Mecanismos técnicos que garantizan el control institucional:

- Cifrado AES-256 en reposo, TLS 1.3 en tránsito
- BYOK (Bring Your Own Key): gestión de llaves por la institución
- Aislamiento verificable entre dependencias/entidades
- Registro transaccional completo (timestamp, usuario, modelo, tokens, namespace)
- Alertas y detección de anomalías
- Retención configurable según normatividad aplicable

---

## Proof Points

### Referencias Legales
| Referencia | Aplicación |
|------------|------------|
| **CLOUD Act (2018)** | Ley estadounidense - requerimientos extraterritoriales |
| **LFPDPPP (México)** | Ley Federal de Protección de Datos Personales |
| **LGPD (Brasil)** | Ley General de Protección de Datos |
| **Regulaciones sectoriales** | CNBV, SBS (Perú), CMF (Chile) |

### 7 Requisitos de IA Soberana
1. Control plane bajo jurisdicción local
2. Data plane sin dependencia legal extranjera
3. Observabilidad auditable por el cliente
4. Portabilidad verificable
5. Capacidad de salida (data e inference exit)
6. Cifrado con control de llaves por el cliente
7. Aislamiento verificable entre clientes

### Estándares de Seguridad
- ISO 27001
- SOC 2 Type II
- Cifrado AES-256 / TLS 1.3

---

## Diferenciador Clave

**"Una plataforma que no cumpla los siete requisitos de IA Soberana puede ser útil, eficiente o económica. No otorga control real a la institución."**

Saptiva cumple los siete. Los opera en producción. Y publica el marco para que las instituciones tengan un estándar claro contra el cual evaluar alternativas.

---

## Anti-patterns (Lo que NO decimos)

- ~~Acelera~~ / ~~Rápido~~ → Velocidad no es su driver
- ~~Solicita demo~~ → Trivializa, parece producto de consumo
- ~~Prueba gratis~~ → Inapropiado para contexto institucional
- ~~Empieza hoy~~ → Gobierno no toma decisiones impulsivas

---

*Fuente: Whitepaper V3 | Driver: Soberanía + Compliance*

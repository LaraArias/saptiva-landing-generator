# Saptiva Whitepaper

> **Fuente**: _Whitepaper_ V3.pdf
> **Título**: Infraestructura de IA para América Latina

---

## Introducción

Este documento está dirigido a los responsables técnicos, institucionales y regulatorios que toman decisiones sobre cómo y dónde se despliega la inteligencia artificial en la región. Está orientado a CTOs y líderes de ingeniería de empresas reguladas, equipos de transformación digital del sector público, equipos de alianzas tecnológicas de NVIDIA y proveedores de nube, así como a actores de política pública y regulación, y propone un marco arquitectónico para evaluar, diseñar y operar infraestructuras de IA que permitan control sobre datos, modelos y ejecución en entornos híbridos y regulados.

---

## 1. Resumen Ejecutivo

América Latina enfrenta una ventana de oportunidad que no superará los siete años. El mercado regional de inteligencia artificial crecerá de $21 mil millones en 2024 a $368 mil millones para 2033. Más de 650 millones de personas adoptarán tecnologías de IA en la próxima década, y lo harán con la infraestructura que esté disponible cuando tomen esa decisión.

Hoy, esa infraestructura no existe en la región. El 80% de la capacidad global de IA corre fuera de América Latina. Las empresas que quieren adoptar inteligencia artificial enfrentan una elección imposible: enviar sus datos a servidores extranjeros bajo jurisdicciones que no controlan, o no adoptar IA en absoluto. Para industrias reguladas (finanzas, salud, gobierno), la segunda opción es frecuentemente la única viable.

**Saptiva AI existe para resolver este problema.** Construimos la capa de infraestructura que permite a las empresas latinoamericanas ejecutar IA en sus propios términos: segura, compliant, sin dependencias. Cualquier modelo, en cualquier entorno (nube pública, nube privada, on-premise, air-gapped), con control total sobre datos e infraestructura. Sin dependencia de hyperscalers extranjeros. Sin vendor lock-in.

Hace una década construimos Quiubas Mobile, la primera plataforma de mensajería carrier-grade en México. Twilio nos adquirió. Ahora construimos la infraestructura para la siguiente era.

La carrera global por la infraestructura de IA ya comenzó. India, Arabia Saudita y Europa están invirtiendo cientos de miles de millones en independencia tecnológica. América Latina no tiene un jugador comparable. Ese vacío es nuestra oportunidad.

---

## 2. El Momento Decisivo

Existen momentos en la historia donde la confluencia de factores tecnológicos, geopolíticos y de capital genera ventanas de oportunidad que, una vez cerradas, no vuelven a abrirse. La revolución industrial benefició a quienes controlaron el carbón y el acero; la era digital premió a quienes dominaron el software y las plataformas. La era de la inteligencia artificial está redefiniendo esas reglas, y la infraestructura computacional se ha convertido en el recurso estratégico que determinará quién participa como arquitecto de esta transformación y quién queda relegado al papel de consumidor dependiente.

El año 2025 marcó un punto de inflexión. Amazon, Microsoft, Google y Meta invirtieron combinados más de $370 mil millones en infraestructura de IA, un incremento del 60% respecto a 2024. OpenAI lideró el proyecto Stargate con $500 mil millones comprometidos. Los compromisos de inversión superaron $1 billón en solo ocho proyectos principales anunciados ese año.

América Latina observó esta transformación desde una posición paradójica. Poseía 650 millones de personas con creciente digitalización y talento técnico probado globalmente. Sin embargo, la región representaba apenas el 5% de la capacidad global de data centers. Las inversiones de Big Tech en la región, aproximadamente $12 mil millones distribuidos en 15 años, equivalían a menos de lo que Amazon invirtió globalmente en un solo trimestre de 2025.

Dos fuerzas opuestas definen la urgencia:
- Por un lado, el costo de usar IA se ha democratizado: la inferencia para sistemas equivalentes a GPT-3.5 se redujo más de 280 veces entre 2022 y 2024.
- Por otro, la capacidad para crear IA propia se ha concentrado: el procesamiento requerido para entrenar modelos de frontera se duplica cada cinco meses.

Esta paradoja (acceso barato a modelos existentes, costo prohibitivo para crear los propios) es precisamente lo que hace urgente la acción.

**La demora no resultará en un simple retraso tecnológico. Resultará en dependencia estructural permanente.**

---

## 3. Lo Que Está en Juego

La dependencia tecnológica no es una abstracción. Tiene consecuencias concretas que afectan la vida cotidiana de cientos de millones de personas.

### El sesgo de los modelos dominantes

Los modelos de lenguaje más utilizados no son neutrales. Una evaluación publicada en PNAS Nexus encontró que todos los modelos de OpenAI exhiben valores culturales que se asemejan a los de países anglófonos y europeos protestantes. El Centro Nacional de Inteligencia Artificial de Chile construyó un benchmark para medir qué tan bien los modelos representan conocimiento latinoamericano. Los resultados: todos los modelos identificaron en qué país está Buenos Aires, pero fallaron sistemáticamente en preguntas sobre cultura local.

### La vulnerabilidad de los datos (CLOUD Act)

La CLOUD Act estadounidense de 2018 permite a las autoridades de ese país exigir datos almacenados por empresas americanas sin importar la ubicación física de los servidores. Expedientes médicos, registros educativos y datos financieros de ciudadanos latinoamericanos en servidores de AWS, Microsoft o Google pueden ser requeridos por tribunales estadounidenses sin notificación al país de origen.

En 2025, la empresa holandesa Solvinity, elegida específicamente por el gobierno de Países Bajos para mitigar riesgos de la CLOUD Act, fue adquirida por una entidad estadounidense. De un día para otro, infraestructura crítica nacional quedó bajo alcance de autoridades extranjeras. **Si esto puede ocurrir en Europa, la vulnerabilidad de América Latina es mayor.**

### El sesgo en aplicaciones críticas

Más de la mitad de los datasets para entrenar IA provienen de Estados Unidos o China. Los modelos de diagnóstico y tratamiento están calibrados para poblaciones que no representan la diversidad de América Latina.

### La extracción de valor

El valor generado por los datos de 650 millones de latinoamericanos fluye hacia corporaciones extranjeras. Los trabajadores de la región participan en la economía de IA principalmente como proveedores de anotación de datos mal remunerada, no como creadores de los sistemas. La región exporta datos crudos e importa servicios procesados, replicando el patrón extractivo que ha caracterizado su inserción en la economía global durante siglos.

**La alternativa no es aislamiento tecnológico ni proteccionismo ingenuo. Es construir capacidad propia que permita a América Latina participar como creador, no solo como consumidor.**

---

## 4. La Tesis de Saptiva AI

Ejecutar IA en tus propios términos no significa desconexión del ecosistema global. Significa la capacidad de elegir: dónde corren los datos, qué modelos se usan, bajo qué jurisdicción opera la infraestructura. Significa independencia estratégica, no aislamiento.

> Silicon Valley optimiza para extracción de valor. Beijing optimiza para control. Nosotros optimizamos para empoderamiento: distribuir agencia en lugar de concentrarla.

El control opera en tres capas:
1. **Física** (infraestructura, centros de datos)
2. **Código** (modelos, estándares, diseño de sistemas)
3. **Datos** (propiedad, flujos, uso)

La debilidad en cualquiera compromete las demás. América Latina tiene déficits en las tres. Saptiva AI las aborda de manera integrada.

**Nuestra tesis es simple: quien controle la infraestructura de IA controlará las condiciones bajo las cuales opera la economía digital. América Latina puede construir esa infraestructura o puede alquilarla a quienes la construyen para otros propósitos.**

Elegimos construir.

---

## 5. Requisitos Mínimos de IA Soberana (Sovereign AI)

Definimos **IA Soberana (Sovereign AI)** como cualquier infraestructura de inteligencia artificial que cumpla los siguientes siete requisitos. **Estos criterios son no negociables.** Si una plataforma no los cumple, no permite control real sobre datos, modelos e infraestructura:

### 1. Control plane bajo jurisdicción local
El cerebro que decide dónde y cómo se ejecutan las cargas de trabajo debe operar bajo jurisdicción del país o región del cliente. Si el control plane está en Estados Unidos, la infraestructura está sujeta a la CLOUD Act, sin importar dónde residan los datos.

### 2. Data plane sin dependencia legal extranjera
Los datos en reposo y en tránsito deben estar protegidos de requerimientos legales extraterritoriales. Esto requiere que tanto el almacenamiento como el procesamiento ocurran en entidades legales no sujetas a jurisdicciones externas.

### 3. Observabilidad auditable por el cliente
El cliente debe poder verificar, de manera independiente, qué ocurre con sus datos: quién accedió, cuándo, qué modelos procesaron qué información. Sin observabilidad auditable, el control es una promesa no verificable.

### 4. Portabilidad verificable
El cliente debe poder migrar sus datos, configuraciones y cargas de trabajo a otro proveedor sin barreras técnicas artificiales. Formatos propietarios y dependencias de APIs no estándar son formas de lock-in que comprometen el control.

### 5. Capacidad de salida (data e inference exit)
En cualquier momento, el cliente debe poder extraer la totalidad de sus datos y dejar de usar el servicio. Esto incluye logs, configuraciones, modelos fine-tuneados, y cualquier artefacto generado en la plataforma.

### 6. Cifrado con control de llaves por el cliente
En despliegues de alta sensibilidad, el cliente debe poder gestionar sus propias llaves de cifrado. Si el proveedor controla las llaves, controla el acceso a los datos.

### 7. Aislamiento verificable entre clientes
En arquitecturas multi-tenant, debe existir segregación completa entre organizaciones, verificable mediante auditoría técnica. Un cliente no debe poder acceder, ni siquiera teóricamente, a datos de otro.

**Estos siete requisitos constituyen el estándar mínimo de IA Soberana. Una infraestructura que no los cumpla puede ser útil, eficiente, o económica, pero no otorga control real al cliente.**

**Saptiva AI ha sido diseñada para cumplir con los siete requisitos de IA Soberana y actualmente los opera en entornos de producción.**

---

## 6. Qué Construimos

Saptiva AI es la capa de infraestructura que permite a las empresas latinoamericanas ejecutar IA en sus propios términos. **En una oración: tu IA, tu stack, 100% bajo tu control.**

### El problema que resolvemos

Las empresas quieren implementar IA. No saben cómo. Y cuando intentan hacerlo, enfrentan obstáculos que los proveedores globales no resuelven:
- Modelos cerrados que operan como cajas negras en nubes extranjeras, creando riesgos de compliance
- Imposibilidad de trazar quién hizo qué, cuándo, con qué modelo y qué datos
- Dependencia total de proveedores externos sin control sobre dónde corren las cargas de trabajo
- Plataformas fragmentadas que hacen imposible gestionar seguridad, rendimiento y observabilidad de manera unificada

**El caso concreto:** un banco mexicano quería desplegar IA para clasificación de documentos. No podía enviar archivos a servidores de OpenAI o AWS en Estados Unidos. No existía opción compliant. Ese banco no es una excepción; es la norma en industrias reguladas.

### Nuestra solución

Saptiva AI permite correr cualquier modelo, abierto o propietario, en cualquier entorno: nube pública, nube privada, on-premise, o air-gapped. Ofrecemos control completo sobre datos, modelos e infraestructura, garantizando cumplimiento con regulación latinoamericana, sin vendor lock-in.

La plataforma opera en tres capas integradas:

**Capa Aplicativa (Business Layer):** Entrega valor inmediato a través de un constructor de agentes, recetas preconfiguradas para RAG (RAGster), agentes SQL (Bank Advisor), y casos de uso listos para producción.

**Capa de Orquestación (Platform Layer, frIdA):** El sistema operativo de IA que permite desplegar donde el cliente decida, con observabilidad, portabilidad y trazabilidad completas.

**Capa de Infraestructura (Infra Layer):** Instancias para el cerebro orquestador del clúster de cómputo y el cómputo de ejecución de cargas de trabajo bajo jurisdicción regional.

### La visión

Convertir a Saptiva AI en el sistema operativo estándar de IA en América Latina. Una red de infraestructura que permite a cualquier empresa ejecutar IA donde decida, sin ceder control, sin fricción, sin dependencia de hyperscalers extranjeros.

---

## 7. Arquitectura Soberana

### 7.1 frIdA: El Sistema Operativo de IA para América Latina

frIdA es el núcleo de la plataforma Saptiva AI. Opera como Sistema Operativo de IA, agnóstico al entorno computacional (nube pública, nube privada, on-premise o air-gapped) funcionando tanto como Platform as a Service (PaaS) como Infrastructure as a Service (IaaS) según el escenario de despliegue.

**Por qué frIdA existe:** Las herramientas de orquestación estándar resuelven cómo distribuir cargas de trabajo eficientemente entre recursos de cómputo. Pero no fueron diseñadas para resolver control jurisdiccional.

Un orquestador genérico decide dónde correr una carga basándose en disponibilidad de recursos. **frIdA decide basándose en políticas de control:** jurisdicción legal del dato, requisitos regulatorios del cliente, restricciones de localización, y nivel de aislamiento requerido.

### 7.2 Control del Dato: Mecanismos y Garantías

- **Residencia de datos regional:** Los datos permanecen físicamente en la jurisdicción elegida por el cliente
- **Cifrado por defecto:** AES-256 en reposo, TLS 1.3 en tránsito
- **Acceso y control del cliente:** Logs transaccionales, volcado completo, borrado seguro certificado
- **Aislamiento multi-tenant:** Segregación completa del tráfico entre organizaciones
- **Retención configurable:** 30 días por defecto, extensible según contrato
- **Garantías contractuales:** Jurisdicción, mecanismos de auditoría, procedimientos de respuesta ante requerimientos legales

### 7.3 Despliegues Multi-Entorno

- **Nube Pública:** AWS, Azure, GCP, OCI, o proveedores regionales
- **Nube Privada:** Infraestructura dedicada gestionada por Saptiva AI o el cliente
- **On-Premise:** Data centers del cliente con frIdA como licencia
- **Air-Gapped:** Completamente aislado de internet para máxima seguridad

### 7.4 Trazabilidad y Observabilidad

- Registro de entradas y salidas con timestamp, usuario, modelo, tokens, namespace
- Audit trails inmutables
- Compatibilidad con plataformas de monitoreo estándar
- Alerting y anomaly detection

**Qué ve un regulador:** La arquitectura está diseñada para que el cumplimiento sea demostrable, no declarativo. Un regulador puede solicitar exportación de logs, demostración de residencia de datos, evidencia de cifrado, registro de accesos, y prueba de controles activos. **frIdA puede generar esta evidencia en horas, no semanas.**

### 7.5 Mecanismos Anti Lock-in

- Protocolos abiertos (REST, gRPC, GraphQL)
- Arquitectura basada en estándares
- Soporte nativo para modelos open source (LLaMA, Mistral, Qwen)
- Portabilidad de workloads en formatos estándar
- Exportación de datos en cualquier momento

### 7.6 Cumplimiento Normativo

- Ley Federal de Protección de Datos Personales (México)
- LGPD (Brasil)
- Regulaciones sectoriales: CNBV (México), SBS (Perú), CMF (Chile)
- Estándares internacionales: ISO 27001, SOC 2 Type II

---

## 8. Modelo Económico

### 8.1 Capa Aplicativa (SaaS)
Suscripción mensual por usuario activo. Constructor de agentes, recetas RAG, agentes SQL, casos de uso preconfigurados.

### 8.2 Infraestructura (Consumo)
Pay-as-you-go: tokens procesados, horas de GPU, almacenamiento, transferencia de datos.

### 8.3 Licenciamiento de frIdA (On-Premise / Nube Privada)
Licencia anual por GPU gestionada. Incluye actualizaciones, parches de seguridad, soporte dedicado.

### 8.4 Servicios de Optimización (Fine-tuning)
Fine-tuning de LLMs y Guardrails con datos específicos del cliente.

---

## 9. Por Qué Nosotros

### Experiencia en infraestructura regional
Construimos Quiubas Mobile, primera plataforma de mensajería carrier-grade en México. Twilio nos adquirió.

### Conocimiento profundo de IA
Lanzamos KAL, el primer LLM mexicanizado. No somos integradores revendiendo APIs.

### Densidad de talento
El 50% de nuestro headcount ha sido fundador. Ronald Escalona (SVP of Engineering) fue VP de Ingeniería en Platzi. Carlos Lara (CPO) fundó Point CRM. Cris Huertas (CRO) fundó Morgana.

### Tracción temprana
Nueve clientes pagando. Pilotos con instituciones financieras, intermediarios regulatorios, contratistas de seguridad nacional.

### First mover en el espacio correcto
Nadie combina infraestructura + control jurisdiccional + localización regional + cero lock-in.

---

## 10. El Camino Adelante

La carrera global ya comenzó. India entrena modelos soberanos con 4,000 GPUs H100 del gobierno. Arabia Saudita comprometió $100 mil millones. Europa respalda a Mistral con €1.3 mil millones.

**América Latina no tiene un proyecto comparable. Todavía.**

Creemos que:
- América Latina merece infraestructura de IA construida para sus necesidades
- La soberanía tecnológica no es un lujo de países ricos
- La ventana de oportunidad es real, finita, y se está cerrando
- Este equipo puede construir la infraestructura que América Latina necesita

**Conectamos a Latinoamérica a través de mensajería móvil. Ahora vamos a potenciar su inteligencia.**

---

## 11. Marco de Referencia

Este documento establece el **estándar de IA Soberana (Sovereign AI) para América Latina.**

Los siete requisitos mínimos definidos en la Sección 5 no son solo características de producto de Saptiva AI. **Son el criterio objetivo contra el cual debe evaluarse cualquier solución que pretenda ofrecer control real:**

1. Control plane bajo jurisdicción local
2. Data plane sin dependencia legal extranjera
3. Observabilidad auditable por el cliente
4. Portabilidad verificable
5. Capacidad de salida (data e inference exit)
6. Cifrado con control de llaves por el cliente
7. Aislamiento verificable entre clientes

**Una plataforma que no cumpla estos siete requisitos puede ser útil, eficiente, o económica. No califica como IA Soberana.**

**Saptiva AI cumple los siete. Los opera en producción con nueve clientes. Y publica este marco para que la región tenga un estándar claro contra el cual medir alternativas.**

---

## Glosario Técnico

| Término | Definición |
|---------|------------|
| Air-gapped | Entorno de cómputo completamente aislado de internet |
| BYOK | Bring Your Own Key - cliente gestiona sus propias llaves de cifrado |
| CLOUD Act | Ley estadounidense (2018) que permite exigir datos de empresas americanas sin importar ubicación física |
| Compliance | Cumplimiento de regulaciones y estándares aplicables |
| Data Plane | Componente donde se procesan y almacenan los datos |
| Fine-tuning | Ajustar un modelo pre-entrenado con datos específicos |
| frIdA | Sistema Operativo de IA de Saptiva |
| GPU | Procesador especializado para cargas de trabajo de IA |
| Guardrails | Sistemas de seguridad y filtrado para entradas/salidas de modelos |
| Hyperscaler | Proveedor de nube a escala masiva (AWS, Azure, GCP, OCI) |
| IaaS | Infrastructure as a Service |
| Inferencia | Usar un modelo entrenado para generar respuestas |
| LLM | Large Language Model |
| Multi-tenant | Múltiples clientes comparten infraestructura con aislamiento |
| On-premise | Infraestructura en instalaciones de la organización |
| PaaS | Platform as a Service |
| RAG | Retrieval-Augmented Generation |
| Token | Unidad básica de texto procesada por LLMs (~3/4 de palabra) |
| Zero-trust | Modelo de seguridad que requiere verificación continua |

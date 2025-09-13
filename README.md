# ApiRest Automation Karate TDD

## ¿Qué es una API?

Una API (Interfaz de Programación de Aplicaciones) permite la comunicación entre diferentes sistemas, facilitando el
intercambio de datos y funcionalidades de manera segura y estandarizada.

## ¿Qué es Karate?

Karate es un framework open source para pruebas automatizadas de APIs REST. Permite escribir pruebas en un lenguaje
sencillo, soporta validaciones complejas y facilita la integración con otros sistemas. Es útil porque simplifica la
automatización, reduce el tiempo de desarrollo y mejora la calidad del software.

## Reportería profesional con Cucumber

Karate integra Cucumber para generar reportes detallados y legibles, facilitando el análisis de resultados y la
trazabilidad de las pruebas. Los reportes permiten identificar rápidamente errores y asegurar la calidad continua.

## TDD y manejo de datos

El proyecto implementa TDD (Desarrollo guiado por pruebas) y Data Driven Testing (DDT), permitiendo ejecutar pruebas con
diferentes conjuntos de datos para validar múltiples escenarios y asegurar la robustez de la API.

## Estructura y patrón de diseño

El framework está estructurado siguiendo buenas prácticas de diseño, separando la lógica de pruebas, datos y utilidades.
Esto facilita el mantenimiento, escalabilidad y reutilización del código, permitiendo agregar nuevas pruebas y
funcionalidades de forma sencilla.

## Ejecución en pipelines

Las pruebas se ejecutan automáticamente en pipelines de Jenkins, asegurando la integración continua y despliegues
confiables.

## Tecnologías utilizadas

- Java
- Karate
- Cucumber
- Gradle
- Jenkins

## Cómo ejecutar

1. Clona el repositorio.
2. Ejecuta `gradle test` para correr las pruebas.
3. Revisa los reportes generados en la carpeta `build/reports`.

---
Este proyecto está diseñado para ser mantenible, escalable y fácil de entender, asegurando la calidad de las APIs REST
mediante automatización profesional.# apis-rest-automation-karate-cucumber
Framework de automatización de APIs REST con Karate + Cucumber, implementando Data Driven Testing (DDT) y ejecutado en
pipelines de Jenkins para asegurar calidad continua, reportes detallados y despliegues confiables.

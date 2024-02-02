# Practica1
                    #Contador App
Esta aplicación es un ejemplo de cómo implementar un estado compartido entre múltiples pantallas en Flutter. Permite incrementar un contador y ver su valor actualizado en tres pantallas distintas.

                    Propósito
El propósito principal de esta app es servir como un ejemplo simple para aprender conceptos importantes de Flutter:

State Management
Lógica de Negocio compartida
Navegación y Paso de Parámetros
Reuso de Widgets
Arquitectura Limpia y Mantenible
Al ser una aplicación trivial de un solo contador, nos permite enfocarnos en la estructura y organización más que en una lógica compleja.

Se implementaron características típicas como navegación, actualización de estado, reusabilidad y separación de responsabilidades.  Pero manteniendo un alcance pequeño lo suficiente para entenderlo fácilmente y sacar aprendizajes.

                      #Funcionalidades
Las pantallas actuales que incluye son:

Home: Muestra el valor actual del contador, permite incrementarlo y navegar a otras pantallas.
Pantalla A: Muestra el contador e incrementarlo. El valor se comparte con las otras pantallas.
Pantalla B: Similar a la A, muestra y puede incrementar el mismo estado global del contador.
Al presionar los botones flotantes en cualquiera de las pantallas, se incrementa el contador y se ve reflejado en todas.

Esto demuestra cómo compartir un estado de manera efectiva entre múltiples Widgets en Flutter a través de una clase de modelo separada.

                    #Arquitectura
Para mantener el código organizado, limpio y fácil de mantener, se implementó una arquitectura robusta desde el inicio que cumple con principios de desarrollo efectivos.

Entre los puntos más importantes:

Separación de Responsabilidades: Cada clase tiene una única razón para cambiar, haciendo fácil entender y modificar el código.
Única Fuente de Verdad: El contador es manejado por una sola clase Counter que funciona como “Store” global.
Inyección de Dependencias: El Counter se pasa a los widgets que lo necesitan en lugar de Singletons. Esto facilita testear en aislado cada pieza.
Widgets Reutilizables: Se parametrizaron widgets comunes como el Texto y Botón de incremento para reusarse fácilmente.
Alto Cohesion / Bajo Acoplamiento: Cada clase está auto-contenida y con responsabilidades claras. El cambio en un módulo no afecta el resto del sistema.
Esta base sólida es fundamental para escalar la complejidad de la app en el futuro sin que se vuelva ingobernable.

                #State Management
Un punto crítico de cualquier app es cómo gestionar efectivamente el estado global y la comunicación entre componentes.

Aquí se implementó un enfoque simple y efectivo:

La clase Counter sirve como “Store” único de la verdad, maneja todo lo relacionado al contador actual. Tiene las funciones para incrementar su valor y notificar a los widgets cuando cambia.

Los widgets reciben una instancia de Counter y la usan para representar su valor o disparar actualizaciones. Pero nunca modifican ese estado directamente.

De esta manera se centraliza toda la lógica critica, aislando el estado de la interfaz de usuario. Esto simplifica el diseño y reduce errores.

               #Dependencias
No hay librerías externas utilizadas, solo paquetes nativos de Flutter:

material: Define los widgets comunes de Material Design para Android y iOS
cupertino_icons: Provee los icnonos estándar de Apple para iOS.
            #Instalación y Ejecución
Los pasos básicos para correr esta aplicación son:

Clonar este repositorio
Abrir el proyecto con un IDE como VSCode o Android Studio
Obtener los paquetes de Flutter con flutter pub get
Conectar un dispositivo móvil Android / iOS o iniciar un emulador
Presionar F5 o Run para compilar e instalar la app
También es posible ejecutarla desde la linea de comandos:


Copy code
flutter run --release
Esto construirá e instalará una versión release lista para producción, habilitando las optimizaciones de Dart.

Testing
Para testear la aplicación se incluye un conjunto básico de pruebas unitarias.

Unit Tests
Las pruebas unitarias viven en el directorio test/unit. Allí validamos comportamientos aislados de las diferentes clases como Counter y CounterText.

Estas pruebas son rápidas de ejecutar y nos dan feeback muy rápido cuando rompemos alguna funcionalidad básica. Complementan bien a los widget y end-to-end tests.

Pueden correrse fácilmente desde Android Studio seleccionando el caso de prueba y presionando el botón verde de Run.

También desde la terminal:


Copy code
flutter test test/unit/counter_test.dart
Widget Tests
Estas pruebas verifican que los widgets se construyan correctamente y sin errores.

Las widgets tests viven dentro de test/widgets para mantenerlas separadas de la lógica de unidad.

Pueden ayudar a detectar problemas relacionados con el ciclo de vida de Flutter, rebuild de widgets, serialización, optimizaciones, etc.

Se ejecutan igual que las unitarias:


Copy code
flutter test test/widgets/counter_text_test.dart
Integration & End-to-End
Las pruebas de integración verifican el flujo completo entre varios módulos en conjunto.

Mientras que los end-to-end testing prueban la aplicación de principio a fin, similar a como lo haría el usuario.

Ayudan a detectar problemas difíciles de reproducir con testing aislado, especialmente de UI y UX.

Todavía no hemos agregado estos tests pero sería el siguiente paso para completar nuestra batería de testing. Algunas librerías populares son Flutter Driver y integration_test.

Una alternativa es utilizar un servicio de automatización visual como Flutter Testify que no requiere escribir los tests manualmente.

Próximos Pasos
Esta aplicación actualmente se enfoca en los conceptos base de State Managament y Clean Architecture.

Algunas mejoras y funcionalidades que se podrian agregar a futuro son:

Implementación de RiverPod / Hooks como alternativa a la clase contador
Agregar CI/CD pipelines para automatizar test, builds, y deployments
Publicar en Play Store para instalación directa en Android
Internacionalización y soporte a múltiples lenguajes
Agregar analíticas y alertas
Widget tests más exhaustivos con cobertura al 100%
Modo offline y sincronización con backend
Al mantener una base de código modular y bien estructurada, tareas complejas como estas se vuelven más simples de agregar incrementalmente sin comprometer la estabilidad y mantenibilidad existentes.

Conclusiones
En resumen esta aplicación es una plantilla perfecta para ver en acción las mejores prácticas de desarrollo en Flutter con Dart.

Entre los puntos claves:

Arquitectura limpia y escalable, basada en principios sólidos
Estado comaprtido entre múltiples pantallas de manera simple
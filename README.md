<!--
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages).

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages).
-->

Un paquete en Flutter que facilita la conexión con la API de fakestoreapi.com. Expone casos de uso que, en el contexto de una arquitectura limpia, se utilizan para encapsular la conexión y gestión de los datos proporcionados por la API de fakestoreapi.

## Características

- Provee un acceso fácil, robusto y centralizado para consumo de los siguientes endpoint por medio de la instancia de la clase `PracticalGrowthRouteNetworkPackage`:
  - El método `getProducts()` consume el endpoint https://fakestoreapi.com/products.
  - El método `getCategories()` consume el endpoint https://fakestoreapi.com//products/categories.
  - El método `getProductsByCategory()` recibe una categoría y consume el endpoint https://fakestoreapi.com//products/category.

### Requisitos

- Cualquier sistema operativo (por ejemplo, MacOS X, Linux, Windows)
- Cualquier IDE con Flutter SDK instalado (por ejemplo, IntelliJ, Android Studio, VSCode, etc.)
- Un poco de conocimiento de Dart y Flutter
- Resumen de versiones:

    ```plain
    Flutter 3.22.3 • channel stable • https://github.com/flutter/flutter.git
    Framework • revision b0850beeb2 (hace 3 semanas) • 2024-07-16 21:43:41 -0700
    Engine • revision 235db911ba
    Tools • Dart 3.4.4 • DevTools 2.34.3
    ```

### Paquetes

| Nombre                                                                           | Uso                                                |
| -------------------------------------------------------------------------------- | -------------------------------------------------- |
| [**Dartz**](https://pub.dev/packages/dartz)                                      | Manejo funcional de errores                        |
| [**Http**](https://pub.dev/packages/http)                                        | Una API basada en Future, multi-plataforma y componible para solicitudes HTTP. |

## Ejemplo de uso

```dart
/// Crear instancia del paquete
final PracticalGrowthRouteNetworkPackage package = PracticalGrowthRouteNetworkPackage();

/// Llama el método que obtiene una lista de categorías
final result = await package.getCategories();
result.fold(
 (failure) => log('Error: $failure'),
 (categories) => log('Categories: $categories'),
);
```

### Manejo de errores

Internamente, el paquete trabaja con una asignación de un `Failure` basado en el error o excepción que se desea manejar. La asignación de un `Failure` se realiza de la siguiente manera:

Ejemplo:

| Error   | Exception          | Failure              |
|---------|--------------------|----------------------|
| `Error` | x                  | `ErrorFailure`       |
| x       | `Exception`        | `ExceptionFailure`   |
| x       | `ClientException`  | `ClientFailure`      |

## Información adicional

[**Jorge A. Mogotocoro F.**](https://www.linkedin.com/in/jorgemogotocoro/)

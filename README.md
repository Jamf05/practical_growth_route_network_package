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

A package in flutter that makes it easy to connect to the fakestoreapi.com API. It exposes use cases that, in the context of a clean architecture, are used to encapsulate the connection and management of the data provided by the fakestoreapi API.

## Features

- The `GetCategoriesUseCase` class connects to `https://fakestoreapi.com/products`
- The `GetProductsByCategoryUseCase` class connects to `https://fakestoreapi.com/products/categories`
- The `GetProductsUseCase` class connects to `https://fakestoreapi.com/products/category`

## Getting started

### Requirements

- Any Operating System (ie. MacOS X, Linux, Windows)
- Any IDE with Flutter SDK installed (ie. IntelliJ, Android Studio, VSCode etc)
- A little knowledge of Dart and Flutter
- Version summary:

    ```plain
    Flutter 3.22.3 • channel stable • https://github.com/flutter/flutter.git
    Framework • revision b0850beeb2 (hace 3 semanas) • 2024-07-16 21:43:41 -0700
    Engine • revision 235db911ba
    Tools • Dart 3.4.4 • DevTools 2.34.3
    ```

### Packages

| Name                                                                              | Usage                                               |
| --------------------------------------------------------------------------------- | --------------------------------------------------- |
| [**Dartz**](https://pub.dev/packages/dartz)                                       | Functional Error Handling                           |
| [**Equatable**](https://pub.dev/packages/equatable)                               | A Dart package that helps to implement value based equality without needing to explicitly override == and hashCode. |
| [**Http**](https://pub.dev/packages/http)                                         | A composable, multi-platform, Future-based API for HTTP requests. |

## Usage

### Build Dependencies

```dart
final http.Client client = http.Client();
final ProductDataSource dataSource = ProductDataSourceImpl(client: client);
final ProductRepository repository = ProductRepositoryImpl(productDataSource: dataSource);
final GetProductsUseCase getProductsUseCase = GetProductsUseCase(productRepository: repository);
```

### Call the use case

```dart
final result = await getProductsUseCase.call(const NoParams());
result.fold(
  (failure) {
    // TODO: handle error
  },
  (products) {
    // TODO: handle response
  },
);
```

### Error handling

Internally, the package works with an assignment of Failures based on the error or exception that you want to handle. The assignment of Failures is done like this:

Example:

| Error   | Exception          | Failure              |
|---------|--------------------|----------------------|
| `Error` | x                  | `ErrorFailure`       |
| x       | `Exception`        | `ExceptionFailure`   |
| x       | `ClientException`  | `ClientFailure`      |

## Additional information

[**Jorge A. Mogotocoro F.**](https://www.linkedin.com/in/jorgemogotocoro/)

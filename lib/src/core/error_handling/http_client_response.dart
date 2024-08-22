import 'package:http/http.dart' as http;

/// Una clase que proporciona métodos de utilidad para manejar respuestas de clientes HTTP.
final class HttpClientResponse {
  /// Valida la respuesta HTTP proporcionada.
  ///
  /// Lanza una [http.ClientException] si el código de estado de respuesta no está en el rango 200-299.
  ///
  /// Toma una [http.Response] como entrada y valida que el código de estado de respuesta no esté en el rango 200-299.
  ///
  /// - Ejemplo:
  ///
  ///  ```
  ///  final response = await client.get(Uri.parse(uri));
  ///  HttpClientResponse.validate(response);
  ///  ```
  static void validate(http.Response response) {
    if (response.statusCode < 200 || response.statusCode >= 300) {
      throw http.ClientException(
        'Status code: ${response.statusCode}',
        response.request?.url,
      );
    }
  }
}

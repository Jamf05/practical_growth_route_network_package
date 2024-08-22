import 'dart:io';

final class JsonHelpers {
  static String readJson(String path) {
    String dir = Directory.current.path;
    return File('$dir/$path').readAsStringSync();
  }
}

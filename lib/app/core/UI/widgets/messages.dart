import 'package:asuka/asuka.dart';

class Messages {
  Messages._();
  static void error(String message) {
    AsukaSnackbar.alert(message).show();
  }

  static void info(String message) {
    AsukaSnackbar.info(message).show();
  }

  static void warning(String message) {
    AsukaSnackbar.warning(message).show();
  }

  static void success(String message) {
    AsukaSnackbar.success(message).show();
  }
}

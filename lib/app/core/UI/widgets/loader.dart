import 'package:asuka/asuka.dart';
import 'package:cuidapet/app/core/UI/extensions/theme_extensions.dart';
import 'package:flutter/material.dart';

class Loader {
  static OverlayEntry? _entry;
  static bool _open = false;
  Loader._();

  static void show() {
    _entry ??= OverlayEntry(
      builder: (context) {
        return Container(
          color: Colors.black54,
          child: Center(
            child: CircularProgressIndicator(
              color: context.primaryColor,
            ),
          ),
        );
      },
    );
    if (!_open) {
      _open = true;
      Asuka.addOverlay(_entry!);
    }
  }

  static void hide() {
    if (_open) {
      _open = false;
      _entry?.remove();
    }
  }
}

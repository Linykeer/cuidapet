import 'package:cuidapet/app/core/UI/extensions/theme_extensions.dart';
import 'package:flutter/material.dart';

class CuidapetTextformfield extends StatelessWidget {
  final String label;
  final bool obscureText;
  final ValueNotifier<bool> _obscureTextVN;
  final TextEditingController? controller;
  final FormFieldValidator<String>? validator;
  CuidapetTextformfield({
    Key? key,
    required this.label,
    this.obscureText = false,
    this.controller,
    this.validator,
  })  : _obscureTextVN = ValueNotifier<bool>(obscureText),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: _obscureTextVN,
      builder: (_, value, child) {
        return TextFormField(
          controller: controller,
          validator: validator,
          obscureText: value,
          decoration: InputDecoration(
            labelText: label,
            labelStyle: const TextStyle(
              color: Colors.black,
              fontSize: 15,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: const BorderSide(color: Colors.black),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: const BorderSide(color: Colors.grey),
            ),
            suffixIcon: obscureText
                ? IconButton(
                    onPressed: () {
                      _obscureTextVN.value = !value;
                    },
                    icon: Icon(
                      value ? Icons.lock : Icons.lock_open,
                      color: context.primaryColor,
                    ))
                : null,
          ),
        );
      },
    );
  }
}

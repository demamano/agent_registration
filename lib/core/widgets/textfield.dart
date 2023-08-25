import 'package:flutter/material.dart';

import '../constant.dart';

class TextFormInputField extends StatelessWidget {
  final String hint;
  final bool filled;
  final Color painted;
  void Function(String value)? func;
  TextFormInputField({
    super.key,
    required this.hint,
    required this.filled,
    required this.painted,
    required this.func,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: const TextStyle(color: Colors.white),
      textAlign: TextAlign.center,
      maxLines: 1,
      expands: false,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(
          4.0,
        ),
        hintText: hint,
        hintStyle: const TextStyle(color: Constants.hintstyling),
        fillColor: painted,
        filled: filled,
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Constants.hintstyling),
          borderRadius: BorderRadius.all(
            Radius.circular(12.0),
          ),
        ),
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(12.0),
          ),
        ),
        border: const OutlineInputBorder(
          borderSide: BorderSide(color: Constants.hintstyling),
        ),
      ),
      onChanged: (value) => func!(value),
    );
  }
}

import 'package:flutter/material.dart';

import '../constant.dart';

class TextFormInputField extends StatefulWidget {
  final String hint;

  final void Function(String value)? func;
  const TextFormInputField({
    super.key,
    required this.hint,
    required this.func,
  });

  @override
  State<TextFormInputField> createState() => _TextFormInputFieldState();
}

class _TextFormInputFieldState extends State<TextFormInputField> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.only(
        left: size.height * 0.09,
        right: size.height * 0.09,
        top: size.height * 0.009,
      ),
      child: TextFormField(
        style: const TextStyle(color: Colors.white),
        textAlign: TextAlign.center,
        maxLines: 1,
        expands: false,
        decoration: Constants().decorate(widget.hint),
        onChanged: (value) => widget.func!(value),
      ),
    );
  }
}

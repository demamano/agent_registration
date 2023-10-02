import 'package:agent_registration/core/constant.dart';
import 'package:flutter/material.dart';

class CustomDropdownButtonFormField extends StatefulWidget {
  final String decorationText;
  final List<String> options;
  final Function(String) onChanged;
  final String initialValue;

  const CustomDropdownButtonFormField({
    super.key,
    required this.decorationText,
    required this.options,
    required this.onChanged,
    required this.initialValue,
  });

  @override
  _CustomDropdownButtonFormFieldState createState() =>
      _CustomDropdownButtonFormFieldState();
}

class _CustomDropdownButtonFormFieldState
    extends State<CustomDropdownButtonFormField> {
  String? _selectedValue;

  @override
  void initState() {
    super.initState();
    _selectedValue = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      decoration: Constants().decorate('hint'),
      dropdownColor: Colors.blue,
      value: _selectedValue,
      hint: const Text('Select an option'),
      items: widget.options.map((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
      onChanged: (newValue) {
        setState(() {
          _selectedValue = newValue;
        });
        widget.onChanged(newValue!);
      },
    );
  }
}

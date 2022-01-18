import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
    this.label = '',
    this.maxLines = 1,
    this.onTap,
    this.controller,
    this.onChanged,
    this.readOnly = false,
  }) : super(key: key);
  final String label;
  final Function()? onTap;
  final Function(String)? onChanged;
  final int maxLines;
  final bool readOnly;
  final TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    return TextField(
      onTap: onTap,
      controller: controller,
      readOnly: readOnly,
      cursorColor: Colors.black26,
      maxLines: maxLines,
      onChanged: onChanged,
      decoration: InputDecoration(
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black26,
          ),
        ),
        labelStyle: const TextStyle(
          color: Colors.black54,
          fontSize: 15,
        ),
        labelText: label,
        contentPadding: const EdgeInsets.all(15),
      ),
    );
  }
}

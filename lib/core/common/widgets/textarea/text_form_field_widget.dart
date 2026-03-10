import 'package:flutter/material.dart';

class TextFormFieldWidget extends StatelessWidget {
  final TextEditingController controller;
  final String hint;
  final int maxlines;
  final ValueChanged<String>? onchanged;
  final FormFieldValidator<String?>? validator;
  const TextFormFieldWidget({
    super.key,
    required this.controller,
    required this.hint,
    this.maxlines = 1,
    this.onchanged,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.text,
      controller: controller,
      cursorColor: Colors.blueAccent,
      maxLines: maxlines,
      validator: validator,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        hintText: hint,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.blueAccent, width: 1),
          borderRadius: BorderRadius.circular(10),
        ),
        disabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.blueAccent, width: 1),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.blueAccent, width: 1),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.blueAccent, width: 1),
          borderRadius: BorderRadius.circular(10),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.blueAccent, width: 1),
          borderRadius: BorderRadius.circular(10),
        ),
        errorStyle: TextStyle(fontSize: 10, height: 1),
        hintStyle: TextStyle(color: Colors.blueAccent, fontSize: 14),
        labelStyle: TextStyle(color: Colors.blueAccent, fontSize: 14),
        prefixIconColor: Colors.blueAccent,
        suffixIconColor: Colors.blueAccent,
        fillColor: Colors.white,
        filled: true,
      ),
      onChanged: onchanged,
    );
  }
}

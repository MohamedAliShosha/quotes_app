import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomTextFormField extends StatelessWidget {
  CustomTextFormField(
      {super.key,
      this.onChanged,
      this.hintText,
      this.obscuredText = false,
      required this.labelText});

  final String labelText;
  Function(String)? onChanged;
  String? hintText;
  bool? obscuredText; // I gave  it a default value of false

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: TextFormField(
        cursorColor: Colors.black,
        obscureText: obscuredText!,
        validator: (data) {
          if (data!.isEmpty) {
            return 'this field is required';
          }
        },
        onChanged: onChanged,
        decoration: InputDecoration(
          labelText: labelText,
          labelStyle: const TextStyle(fontSize: 16, color: Colors.grey),
          hintText: hintText,
          hintStyle: const TextStyle(
            color: Colors.black,
          ),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.black,
            ),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}

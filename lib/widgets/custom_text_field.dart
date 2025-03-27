import 'package:flutter/material.dart';

class CustomTextFormField1 extends StatelessWidget {
  const CustomTextFormField1(
      {super.key,
      required this.hintText,
      this.maxLines = 1,
      this.onSaved,
      this.onChanged});

  final String hintText;
  final int maxLines;
  final void Function(String?)? onSaved;
  final void Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      onSaved: onSaved,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'this field is required';
        } else {
          return null;
        }
      },
      cursorColor: Colors.black,
      maxLines: maxLines,
      decoration: InputDecoration(
        hintText: hintText,
        border: buildBorder(),
        enabledBorder: buildBorder(Colors
            .black), // for unfocused => The user is not interacting with the TextField.
        focusedBorder: buildBorder(Colors
            .black), // for focused => The user is interacting with the TextField.
      ),
    );
  }

  OutlineInputBorder buildBorder([color]) {
    return OutlineInputBorder(
        borderRadius: const BorderRadius.all(
          Radius.circular(8),
        ),
        borderSide: BorderSide(
          color: color ?? Colors.white,
        ));
  }
}

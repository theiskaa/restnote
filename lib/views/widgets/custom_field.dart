import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomField extends StatelessWidget {
  final String hint;
  final Function(String) validation;
  final void Function(String) onChanged;
  final int maxLines;
  const CustomField({
    Key key,
    this.hint,
    this.validation,
    this.onChanged,
    this.maxLines,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: buildInputDecoration(),
      maxLines: maxLines,
      cursorColor: Colors.black,
      validator: validation,
      onChanged: onChanged,
      style: GoogleFonts.indieFlower(fontSize: 20),
    );
  }

  InputDecoration buildInputDecoration() {
    return InputDecoration(
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(25),
        borderSide: BorderSide(width: 2, color: Colors.black),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(25),
        borderSide: BorderSide(width: 1.8, color: Colors.black),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(25),
        borderSide: BorderSide(width: 1.8, color: Colors.black),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(25),
        borderSide: BorderSide(width: 2, color: Colors.black),
      ),
      hintText: hint,
      hintStyle: GoogleFonts.indieFlower(
        fontSize: 17,
        color: Colors.black.withOpacity(.8),
      ),
      enabled: true,
    );
  }
}

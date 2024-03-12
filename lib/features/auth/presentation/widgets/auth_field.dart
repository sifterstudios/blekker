import 'package:flutter/material.dart';

class AuthField extends StatelessWidget {
  const AuthField({required this.hintText, super.key});
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
     decoration: InputDecoration(
       hintText: hintText,
     ),
    );
  }
}

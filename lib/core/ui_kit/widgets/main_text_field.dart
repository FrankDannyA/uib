import 'package:flutter/material.dart';

class MainTextField extends StatelessWidget {
  const MainTextField({
    super.key,
    required this.textEditingController,
    required this.title,
    this.isPass = false,
  });

  final bool isPass;
  final String title;
  final TextEditingController textEditingController;

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: isPass,
      controller: textEditingController,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.grey[200],
        hintText: title,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}

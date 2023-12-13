import 'package:flutter/material.dart';

class HBox extends StatelessWidget {
  const HBox({super.key, required this.height});

  final double height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: height);
  }
}

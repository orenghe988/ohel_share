import "package:flutter/material.dart";
import 'package:flutter/services.dart';

class OurTextInput extends StatelessWidget {
  final double? width;
  final double? height;
  final TextEditingController? _controller;
  final bool isLtr;
  final Widget? icon;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;

  const OurTextInput({
    super.key,
    this.width,
    this.height,
    this.isLtr = false,
    this.icon,
    this.keyboardType,
    this.inputFormatters,
    controller,
  }) : _controller = controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceVariant,
        borderRadius: BorderRadius.circular(12),
      ),
      child: TextField(
        controller: _controller,
        keyboardType: keyboardType,
        inputFormatters: inputFormatters,
        textDirection: isLtr ? TextDirection.ltr : TextDirection.rtl,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(10.2),
          border: InputBorder.none,
          suffixIcon: icon,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(
              width: 1.75,
            ),
          ),
        ),
      ),
    );
  }
}

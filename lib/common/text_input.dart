import "package:flutter/material.dart";
import 'package:flutter/services.dart';

class OurTextInput extends StatefulWidget {
  final double? width;
  final double? height;
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
  });

  @override
  State<OurTextInput> createState() => _OurTextInputState();
}

class _OurTextInputState extends State<OurTextInput> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
    _controller.text = "05";
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceVariant,
        borderRadius: BorderRadius.circular(12),
      ),
      child: TextField(
        controller: _controller,
        keyboardType: widget.keyboardType,
        inputFormatters: widget.inputFormatters,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(10.2),
          border: InputBorder.none,
          suffixIcon: widget.icon,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(
              width: 1.75,
            ),
          ),
        ),
        textDirection: widget.isLtr ? TextDirection.ltr : TextDirection.rtl,
      ),
    );
  }
}

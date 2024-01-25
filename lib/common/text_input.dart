import "package:flutter/material.dart";

class OurTextInput extends StatelessWidget {
  final double? width;
  final double? height;
  final TextEditingController? _controller;

  OurTextInput({super.key, this.width, this.height, controller}) : _controller = controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceVariant,
        borderRadius: BorderRadius.circular(12),
      ),
      child: TextField(
          controller: _controller,
          decoration: const InputDecoration(
            border: InputBorder.none,
          )
      ),
    );
  }
}
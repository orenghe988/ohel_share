import "package:flutter/material.dart";

class OurTextInput extends StatefulWidget {
  final double? width;
  final double? height;

  const OurTextInput({super.key, this.width, this.height});

  @override
  State<OurTextInput> createState() => _OurTextInputState();
}

class _OurTextInputState extends State<OurTextInput> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
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
        decoration: const InputDecoration(
          border: InputBorder.none,
        )
      ),
    );
  }
}
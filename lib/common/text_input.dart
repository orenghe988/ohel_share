import "package:flutter/material.dart";
import 'package:flutter/services.dart';

class OurTextInput extends StatefulWidget {
  final double? width;
  final double? height;
  final bool isLtr;
  final Widget? icon;

  const OurTextInput(
      {super.key, this.width, this.height, this.isLtr = false, this.icon});

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
        keyboardType: TextInputType.number,
        inputFormatters: <TextInputFormatter>[
          FilteringTextInputFormatter.digitsOnly,
          LengthLimitingTextInputFormatter(10),
        ],
        decoration: InputDecoration(
            contentPadding: const EdgeInsets.all(10.0),
            border: InputBorder.none,
            suffixIcon: widget.icon,
            focusedBorder:
                OutlineInputBorder(borderRadius: BorderRadius.circular(12))),
        textDirection: widget.isLtr ? TextDirection.ltr : TextDirection.rtl,
      ),
    );
  }
}

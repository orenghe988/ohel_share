import "package:flutter/material.dart";

class ExpandedButton extends StatelessWidget {
  final double? height;
  final double? width;
  final String text;
  final MaterialColor? color;
  final void Function()? onPressed;

  const ExpandedButton({
    super.key,
    required this.text,
    this.onPressed,
    this.color,
    this.height = 53,
    this.width = double.infinity,
  });

  @override
  Widget build(BuildContext context) {
    final color = this.color ?? Theme.of(context).colorScheme.primary;

    return SizedBox(
      height: height,
      width: width,
      child: FilledButton(
        onPressed: onPressed ?? () {},
        style: FilledButton.styleFrom(
          backgroundColor: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: Text(
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w500,
          ),
          text,
        ),
      ),
    );
  }
}

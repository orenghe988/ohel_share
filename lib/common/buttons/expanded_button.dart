import "package:flutter/material.dart";

class ExpandedButton extends StatelessWidget {
  final String text;
  final MaterialColor? color;
  final void Function()? onPressed;

  const ExpandedButton(
      {super.key, required this.text, this.color, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45,
      width: double.infinity,
      child: FilledButton(
        style: FilledButton.styleFrom(
          backgroundColor: color ?? Theme.of(context).colorScheme.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        onPressed: onPressed ?? () {},
        child: Text(text),
      ),
    );
  }
}

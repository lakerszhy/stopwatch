import 'package:flutter/material.dart';

class ActionButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String text;
  final Color textColor;

  const ActionButton({
    Key? key,
    required this.text,
    required this.textColor,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      customBorder: const CircleBorder(),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: textColor.withOpacity(0.3), width: 2),
          shape: BoxShape.circle,
        ),
        child: Container(
          margin: const EdgeInsets.all(2),
          padding: const EdgeInsets.all(18),
          decoration: BoxDecoration(
            color: textColor.withOpacity(0.3),
            shape: BoxShape.circle,
          ),
          child: Text(text, style: TextStyle(color: textColor)),
        ),
      ),
    );
  }
}

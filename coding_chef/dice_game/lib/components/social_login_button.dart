import 'package:flutter/material.dart';

class SocialLogInButton extends StatelessWidget {
  final String imagePath;
  final String text;
  final Color textColor;
  final Color color;
  final double borderRadius;
  final VoidCallback onPressed;

  const SocialLogInButton({
    super.key,
    required this.imagePath,
    required this.text,
    required this.textColor,
    required this.color,
    required this.borderRadius,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          backgroundColor: color,
          foregroundColor: textColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          )),
      onPressed: onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(imagePath),
          const SizedBox(
            width: 10.0,
          ),
          Text(text),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  final String text;
  final Color color;
  final VoidCallback onpressed;
  const PrimaryButton({
    super.key,
    required this.text,
    this.color = Colors.blueAccent,
    required this.onpressed
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onpressed,

      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all<Color>(color),
      ),
      child: Text(text, style: TextStyle(color: Colors.white)),
    );
  }
}

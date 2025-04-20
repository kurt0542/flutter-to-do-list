import 'package:flutter/material.dart';

class DialogButton extends StatelessWidget {
  final String text;
  VoidCallback onPressed;
  DialogButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
        onPressed: onPressed,
      child: Text(text),
      color: Colors.lightBlue,
    );
  }
}

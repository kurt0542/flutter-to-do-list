import 'package:flutter/material.dart';

class ErrorDialog extends StatelessWidget {
  final String content;

  ErrorDialog({super.key, required this.content});

  @override
  Widget build(BuildContext context) {
    return Container();
  }

  static Future<void> showErrorDialog(BuildContext context, String content) {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Error"),
        content: Text(content),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text("OK"),
          ),
        ],
      ),
    );
  }
}

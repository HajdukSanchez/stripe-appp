import 'package:flutter/material.dart';

showLoading(BuildContext context, String text) {
  showDialog(
      context: context,
      barrierDismissible: false, // User can't dismiss dialog by tapping outside
      builder: (_) => AlertDialog(
            title: Text(text),
            content: const LinearProgressIndicator(),
          ));
}

showAlert(BuildContext context, String title, String message) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (_) => AlertDialog(
      title: Text(title),
      content: Text(message),
      actions: [
        MaterialButton(onPressed: () => Navigator.of(context).pop(), child: const Text('OK'))
      ],
    ),
  );
}

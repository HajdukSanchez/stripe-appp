import 'package:flutter/material.dart';

showLoading(BuildContext context, String text) {
  showDialog(
      context: context,
      barrierDismissible: false, // User can't dismiss dialog by tapping outside
      builder: (_) => AlertDialog(
            title: Text(text),
            content: const LinearProgressIndicator(),
            backgroundColor: const Color(0xff284879),
            titleTextStyle: const TextStyle(color: Colors.white, fontSize: 20),
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
        MaterialButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text(
            'OK',
            style: TextStyle(
              color: Colors.black,
              fontSize: 16,
            ),
          ),
          color: Colors.white,
          shape: const StadiumBorder(),
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        )
      ],
      backgroundColor: const Color(0xff284879),
      titleTextStyle: const TextStyle(color: Colors.white, fontSize: 20),
      contentTextStyle: const TextStyle(color: Colors.white, fontSize: 18),
    ),
  );
}

import 'dart:io' show Platform;
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class PlatformButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;

  PlatformButton({required this.label, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    if (Platform.isIOS) {
      return CupertinoButton(
        child: Text(label),
        onPressed: onPressed,
      );
    } else {
      return ElevatedButton(
        child: Text(label),
        onPressed: onPressed,
      );
    }
  }
}

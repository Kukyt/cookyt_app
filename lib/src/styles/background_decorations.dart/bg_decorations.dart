import 'package:flutter/material.dart';

class BgDecorations {
  static final tealDecoration = BoxDecoration(
    gradient: LinearGradient(
      begin: Alignment.topRight,
      end: Alignment.bottomLeft,
      colors: [
        Colors.greenAccent,
        Colors.teal.withOpacity(0.6),
        Colors.tealAccent,
      ],
    ),
  );
}

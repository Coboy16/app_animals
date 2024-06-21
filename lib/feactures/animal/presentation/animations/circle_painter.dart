import 'package:flutter/material.dart';

class CirclePainter extends CustomPainter {
  final double progress;
  final Offset buttonPosition;
  final Size screenSize;
  final Color? color;

  CirclePainter({
    required this.progress,
    required this.buttonPosition,
    required this.screenSize,
     this.color = Colors.red,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color!
      ..style = PaintingStyle.fill;

    // Ajuste el radio para asegurarse de que cubra toda la pantalla.
    final maxRadius = (screenSize.width + screenSize.height) * 1.5;
    final radius = progress * maxRadius;

    canvas.drawCircle(
      buttonPosition,
      radius,
      paint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

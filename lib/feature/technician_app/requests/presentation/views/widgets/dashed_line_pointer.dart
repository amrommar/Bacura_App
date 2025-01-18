import 'package:bacura_app/core/utils/index.dart';
import 'package:flutter/material.dart';

class DashPainter extends CustomPainter {
  final double dashHeight;
  final double dashSpace;
  final Color color;

  DashPainter({
    this.dashHeight = 5,
    this.dashSpace = 5,
    this.color = Colors.grey,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = 2;

    double startY = 0;
    while (startY < size.height) {
      canvas.drawLine(
        Offset(0, startY),
        Offset(0, startY + dashHeight),
        paint,
      );
      startY += dashHeight + dashSpace;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

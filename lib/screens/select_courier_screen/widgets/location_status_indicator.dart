import 'package:flutter/material.dart';

class LocationStatusIndicator extends StatelessWidget {
  const LocationStatusIndicator({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        children: [
          getCirularContainer(color: const Color(0xff28C928)),
          const VerticalDashedLine(
            height: 50,
          ),
          getCirularContainer(color: const Color(0xffFA5025))
        ],
      ),
    );
  }

  Container getCirularContainer({required Color color}) {
    return Container(
      width: 15.4,
      height: 15.4,
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        border: Border.all(
          color: color,
          width: 1.0,
        ),
      ),
    );
  }
}

class VerticalDashedLine extends StatelessWidget {
  const VerticalDashedLine({super.key, required this.height});

  final double height;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: CustomPaint(
        painter: _VerticalDashedLinePainter(),
      ),
    );
  }
}

class _VerticalDashedLinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    double dashHeight = 4, dashSpace = 2;
    final paint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.stroke;

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

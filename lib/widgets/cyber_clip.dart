import 'package:flutter/material.dart';


class CyberClip extends CustomClipper<Path> {
  final double cut;

  CyberClip({this.cut = 12});

  @override
  Path getClip(Size size) {
    final path = Path();
    path.moveTo(0, 0);
    path.lineTo(size.width - cut, 0);
    path.lineTo(size.width, cut);
    path.lineTo(size.width, size.height);
    path.lineTo(cut, size.height);
    path.lineTo(0, size.height - cut);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}

class CyberBox extends StatelessWidget {
  final Widget child;
  final Color color;
  final Color borderColor;
  final double cut;
  final double borderWidth;

  const CyberBox({
    super.key,
    required this.child,
    this.color = Colors.transparent,
    this.borderColor = Colors.black,
    this.cut = 12,
    this.borderWidth = 2,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _BorderPainter(
        color: borderColor,
        cut: cut,
        strokeWidth: borderWidth,
      ),
      child: ClipPath(
        clipper: CyberClip(cut: cut),
        child: Container(color: color, child: child),
      ),
    );
  }
}

class _BorderPainter extends CustomPainter {
  final Color color;
  final double cut;
  final double strokeWidth;

  _BorderPainter({
    required this.color,
    required this.cut,
    required this.strokeWidth,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth;

    final path = Path();
    path.moveTo(0, 0);
    path.lineTo(size.width - cut, 0);
    path.lineTo(size.width, cut);
    path.lineTo(size.width, size.height);
    path.lineTo(cut, size.height);
    path.lineTo(0, size.height - cut);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant _BorderPainter old) =>
      old.color != color || old.cut != cut || old.strokeWidth != strokeWidth;
}
import 'package:flutter/material.dart';

class NicelyPaintedAppber extends CustomPainter {
  final Color lineColor;

  const NicelyPaintedAppber({this.lineColor});

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint();

    Path path = Path();
    Rect pathGradientRect = new Rect.fromCircle(
      center: new Offset(size.width / 5, 0),
      radius: size.width / 1.5,
    );

    Gradient gradient = new LinearGradient(
      colors: <Color>[
        Colors.red[700],
        Colors.red[800],
      ],
      stops: [
        0.3,
        1.0,
      ],
    );

    path.lineTo(-size.width / 1.4, 0);
    path.quadraticBezierTo(
        size.width / 2, size.height * 2, size.width + size.width / 1.4, 0);
    paint.color = Colors.red[800];
    paint.shader = gradient.createShader(pathGradientRect);
    paint.strokeWidth = 40;
    path.close();

    canvas.drawPath(path, paint);

    Rect secondOvalRect = new Rect.fromPoints(
      Offset(-size.width / 2.5, -size.height),
      Offset(size.width * 1.5, size.height / 1.5),
    );

    gradient = new LinearGradient(
      colors: <Color>[
        Colors.red[800],
        Colors.red[700],
      ],
      stops: [
        0.0,
        1.0,
      ],
    );
    Paint secondOvalPaint = Paint()
      ..color = Colors.red[800]
      ..color = Colors.red[600]
      ..shader = gradient.createShader(secondOvalRect);

    canvas.drawOval(secondOvalRect, secondOvalPaint);

//Third oval
    Rect thirdOvalRect = new Rect.fromPoints(
      Offset(-size.width / 2.5, -size.height),
      Offset(size.width * 1.4, size.height / 2.7),
    );

    gradient = new LinearGradient(
      colors: <Color>[
        Colors.red[800],
        Colors.red[700],
      ],
      stops: [
        0.0,
        1.0,
      ],
    );
    Paint thirdOvalPaint = Paint()
      ..color = Colors.red[800]
      ..shader = gradient.createShader(thirdOvalRect);

    canvas.drawOval(thirdOvalRect, thirdOvalPaint);

    Rect fourthOvalRect = new Rect.fromPoints(
      Offset(-size.width / 2.6, -size.width / 1.875),
      Offset(size.width / 1.15, size.height / 1.14),
    );

    gradient = new LinearGradient(
      colors: <Color>[
        Colors.red[500].withOpacity(0.9),
        Colors.red[600].withOpacity(0.8),
      ],
      stops: [
        0.3,
        1.0,
      ],
    );
    Paint fourthOvalPaint = Paint()
      ..color = Colors.red[900]
      ..shader = gradient.createShader(fourthOvalRect);

    canvas.drawOval(fourthOvalRect, fourthOvalPaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

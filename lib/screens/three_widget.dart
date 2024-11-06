import 'package:flutter/material.dart';

class ThreeWidget extends StatelessWidget {
  const ThreeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 400,
        height: 400,
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 38, 44, 52),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(100),
            child: Container(
              width: 200,
              height: 200,
              color: const Color.fromARGB(255, 65, 209, 251),
              child: Stack(
                children: [
                  Positioned(
                    top: 0,
                    left: 90,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                        width: 20,
                        height: 20,
                        color: Colors.yellow,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 50,
                    left: (200-150)/2,
                    child: CustomPaint(
                      painter: TrianglePainter(),
                      child: const SizedBox(
                        width: 150,
                        height: 90,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    child: Container(
                      color: Colors.amberAccent,
                      width: 200,
                      height: 50,
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    left: (200-150)/2,
                    child: CustomPaint(
                      painter: ShadowPainter(),
                      child: const SizedBox(
                        width: 150,
                        height: 50,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class TrianglePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {

    // 绘制金字塔
    final whitePaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;
    final whitePath = Path();
    whitePath.moveTo(size.width * 1 / 2, 0);
    whitePath.lineTo(0, size.height);
    whitePath.lineTo(size.width * 3 / 4, size.height);
    whitePath.close();
    canvas.drawPath(whitePath, whitePaint);

    final greyPaint = Paint()
      ..color = Colors.grey
      ..style = PaintingStyle.fill;
    final greyPath = Path();
    greyPath.moveTo(size.width * 1 / 2, 0);
    greyPath.lineTo(size.width * 3 / 4, size.height);
    greyPath.lineTo(size.width, size.height);
    greyPath.close();
    canvas.drawPath(greyPath, greyPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

class ShadowPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final shadowPaint = Paint()
      ..color = Colors.black.withOpacity(0.3)
      ..style = PaintingStyle.fill;

    final shadowPath = Path()
    ..moveTo(0, 0)
    ..lineTo(size.width, 0)
    ..lineTo(size.width * 2 / 3, size.height)
    ..close();

    canvas.drawPath(shadowPath, shadowPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}



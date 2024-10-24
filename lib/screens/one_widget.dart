import 'package:flutter/material.dart';

class OneWidget extends StatefulWidget {
  const OneWidget({super.key});

  @override
  State<OneWidget> createState() => _OneWidgetState();
}

class _OneWidgetState extends State<OneWidget> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        decoration: BoxDecoration(
            color: Colors.blue,
            border: Border.all(
                color: Colors.grey,
                width: 2
            ),
            borderRadius: BorderRadius.circular(10),
            boxShadow: const [
              BoxShadow(
                color: Colors.grey,
                offset: Offset(2, 2),
                blurRadius: 3,
              ),
            ],
            gradient: const LinearGradient(
              colors: [Colors.purple, Colors.blue],
              begin: Alignment.bottomLeft,
              end: Alignment.topRight,
            )
        ),
        width: 400,
        height: 400,
        child: const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "100",
                style: MainTextStyle(fontSize: 128),
              ),
              Text(
                "DAYS",
                style: MainTextStyle(fontSize: 68),
              ),
              Text(
                "flutter challenges",
                style: MainTextStyle(fontSize: 36),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MainTextStyle extends TextStyle {
  const MainTextStyle({
    required double fontSize,
  }): super(
      fontSize: fontSize,
      color: Colors.white,
      fontWeight: FontWeight.bold
  );
}

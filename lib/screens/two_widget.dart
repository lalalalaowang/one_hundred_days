import 'package:flutter/material.dart';

class TwoWidget extends StatefulWidget {
  const TwoWidget({super.key});

  @override
  State<TwoWidget> createState() => _TwoWidgetState();
}

class _TwoWidgetState extends State<TwoWidget> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 400,
        height: 400,
        decoration: BoxDecoration(
          color: Colors.pinkAccent,
          border: Border.all(
            width: 2,
            color: Colors.purpleAccent,
          ),
          borderRadius: BorderRadius.circular(2),
          boxShadow: const [
            BoxShadow(
              color:Colors.greenAccent,
              offset: Offset(2, 2),
              blurRadius: 3,
            ),
          ],
        ),
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            WhiteBar(Location.top),
            WhiteBar(),
            WhiteBar(),
          ],
        ),
      ),
    );
  }
}

class WhiteBar extends StatefulWidget {
  const WhiteBar(Location top, {super.key, required this.location});
  final Location location;
  
  @override
  State<WhiteBar> createState() => _WhiteBarState();
}

class _WhiteBarState extends State<WhiteBar> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30, bottom: 30),
      child: Container(
        width: 300,
        height: 30,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(2),
        ),
      ),
    );
  }
}

enum Location {
  top,
  mid,
  bottom,
}

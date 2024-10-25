import 'dart:async';

import 'package:flutter/material.dart';

class TwoWidget extends StatefulWidget {
  const TwoWidget({super.key});

  @override
  State<TwoWidget> createState() => _TwoWidgetState();
}

class _TwoWidgetState extends State<TwoWidget> {
  bool _isHovered = false;
  bool _isMidShow = true;
  Timer? _timer;

  @override
  Widget build(BuildContext context) {
    return Center(
        child:MouseRegion(
          onEnter: (_) => {
            setState(() {
              _isHovered = true;
              _isMidShow = false;
              _timer?.cancel();
            }),
          },
          onExit: (_) => {
            setState(() {
              _isHovered = false;
            }),
          _timer = Timer(const Duration(microseconds: 800), () {
            if (mounted && !_isHovered) {
              setState(() => _isMidShow = true);
            }
          }),
          },
          child:  Container(
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AnimatedRotation(
                turns: _isHovered? 0.125:0,
                duration: const Duration(seconds: 1),
                child: Padding(
                  padding: EdgeInsets.only(top: _isHovered?0:30, bottom: _isHovered?0:30),
                  child: const WhiteBar(),
                )
              ),
              Visibility(
                visible: _isMidShow,
                child: const WhiteBar()
              ),
              AnimatedRotation(
                turns: _isHovered? -0.125:0,
                  duration: const Duration(seconds: 1),
                  child: Padding(
                    padding: EdgeInsets.only(top: _isHovered?0:30, bottom: _isHovered?0:30),
                    child: const WhiteBar(),
                  )
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}

class WhiteBar extends StatefulWidget {
  const WhiteBar({super.key});

  @override
  State<WhiteBar> createState() => _WhiteBarState();
}

class _WhiteBarState extends State<WhiteBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: 300,
        height: 30,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(2),
        ),
    );
  }
}

enum Location {
  top,
  mid,
  bottom,
}

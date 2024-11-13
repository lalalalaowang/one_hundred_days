import 'dart:async';

import 'package:flutter/material.dart';
import 'dart:math' as math;

class FourWidget extends StatefulWidget {
  const FourWidget({super.key});

  @override
  State<FourWidget> createState() => _FourWidgetState();
}

class _FourWidgetState extends State<FourWidget> with SingleTickerProviderStateMixin {

  int _count = 0;
  late bool _isClickTextShow;
  Timer? _showTimer;
  Timer? _cancelTimer;
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _isClickTextShow = false;
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    _animation = Tween<double>(begin: 0, end: math.pi / 4).animate(_controller);
  }


  @override
  void dispose() {
    _controller.dispose();
    _showTimer?.cancel();
    _cancelTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        _controller.forward().then((_) {
          _controller.reverse();
        });

        if (!_isClickTextShow) {
          _startShowTimer();
          _startCancelTimer();
        }
      },
      child: Center(
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: const Color.fromARGB(255, 38, 38, 38),
          ),
          width: 400,
          height: 400,
          child: Stack(
            children: [
              Positioned(
                top: 40,
                left: 100,
                child: Container(
                  width: 200,
                  height: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: Colors.amber,
                      width: 5
                    ),
                  ),
                  child: Center(
                    child: Text(
                      _count.toString(),
                      style: const TextStyle(
                        fontSize: 48,
                        fontWeight: FontWeight.w900,
                        color: Colors.amber,
                      ),
                    ),
                  ),
                )
              ),
              Positioned(
                top: 130,
                left: 150,
                child: Visibility(
                  visible: _isClickTextShow,
                  child: const SizedBox(
                    width: 100,
                    height: 100,
                    child: Center(
                      child: Text(
                        "+1",
                        style: TextStyle(
                          color: Colors.amber,
                          fontSize: 36,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                )
              ),
              Positioned(
                top: 200,
                left: 30,
                child: SizedBox(
                  width: 200,
                  height: 200,
                  child: AnimatedBuilder(
                    animation: _animation,
                    builder: (BuildContext context, Widget? child) {
                     return Transform.rotate(
                       angle: _animation.value,
                       child: Column(
                         children: [
                           SizedBox(
                             height:100,
                             child: Image.asset("images/mallet.png")),
                         ],
                       ),
                     );
                    },
                  ),
                ),
              ),
              Positioned(
                top: 270,
                left: 160,
                child: SizedBox(
                  width: 100,
                  height: 100,
                  child: Image.asset("images/mokugyo.png")
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void _startShowTimer() {
    _showTimer = Timer(const Duration(seconds: 1), () {
      setState(() {
        _count++;
        _isClickTextShow = true;
      });
    });
  }

  void _startCancelTimer() {
    _cancelTimer = Timer(const Duration(seconds: 2), () {
      setState(() {
        _isClickTextShow = false;
      });
    });
  }
}

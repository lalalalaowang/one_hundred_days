import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '100days',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: '100days'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Container(
          decoration: BoxDecoration(
            color: Colors.blue,
            border: Border.all(
              color: Colors.grey,
              width: 2.0
            ),
            borderRadius: BorderRadius.circular(10.0),
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

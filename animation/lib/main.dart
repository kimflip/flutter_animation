import 'dart:ui';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  static const _alignments = [
    Alignment.bottomCenter,
    Alignment.topCenter,
  ];

  static const _alignments2 = [
    Alignment.topLeft,
    Alignment.topRight,
  ];

  bool flag1 = false;
  bool flag2 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          children: [
            Container(
                width: 100,
                height: 80,
                child: ShaderMask(
                  shaderCallback: (bounds) {
                    return LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        stops: [
                          0,
                          0.5,
                          0.5,
                          1
                        ],
                        colors: [
                          Colors.white,
                          Colors.white,
                          Colors.transparent,
                          Colors.transparent,
                        ]).createShader(bounds);
                  },
                  // blendMode: BlendMode.dst,
                  blendMode: BlendMode.dstIn,
                  child: AnimatedAlign(
                    duration: const Duration(milliseconds: 250),
                    alignment: _alignments[flag1 ? 1 : 0],
                    curve: Curves.easeInOutCirc,
                    child: Stack(
                      children: [
                        const Text(
                          "Hello",
                          style: TextStyle(fontSize: 40),
                        )
                      ],
                    ),
                  ),
                )),
            Container(
                width: 210,
                height: 120,
                child: ShaderMask(
                  shaderCallback: (bounds) {
                    return LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        stops: [
                          0,
                          0.5,
                          0.5,
                          1
                        ],
                        colors: [
                          Colors.transparent,
                          Colors.transparent,
                          Colors.white,
                          Colors.white,
                        ]).createShader(bounds);
                  },
                  // blendMode: BlendMode.dst,
                  blendMode: BlendMode.dstIn,
                  child: AnimatedAlign(
                    duration: const Duration(milliseconds: 500),
                    alignment: _alignments2[flag2 ? 1 : 0],
                    curve: Curves.easeInOutCirc,
                    child: Stack(
                      children: [
                        const Text(
                          "World",
                          style: TextStyle(fontSize: 40),
                        )
                      ],
                    ),
                  ),
                )),
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    getLoad();
  }

  Future<void> getLoad() async {
    await Future.delayed(const Duration(milliseconds: 2000));
    setState(() {
      flag1 = true;
    });
    await Future.delayed(const Duration(milliseconds: 250));
    setState(() {
      flag2 = true;
    });
  }
}

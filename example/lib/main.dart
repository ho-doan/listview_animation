import 'dart:math';

import 'package:flutter/material.dart';
import 'package:listview_animation/listview_animation.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class WItem extends TItem {
  final Color color;
  final double height;

  WItem({
    required this.color,
    required this.height,
  }) : super(
          key: GlobalKey(),
        );
}

class _MyHomePageState extends State<MyHomePage> {
  final colors = [
    Colors.green,
    Colors.red,
    Colors.yellow,
    Colors.red,
    Colors.green,
    Colors.yellow,
    Colors.green,
    Colors.red,
    Colors.yellow,
  ]
      .map(
        (e) => WItem(
          color: e,
          height: (Random.secure().nextInt(6) + 1) * 50,
        ),
      )
      .toList();

  final controller = ListViewScrollNextController<WItem>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListViewScrollNext<WItem>(
        controller: controller,
        childrens: colors,
        itemBuilder: (item) => GestureDetector(
          onTap: () {
            controller.scrollNext(item);
          },
          child: Container(
            color: item.color,
            height: item.height,
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:vitalmox/src/config.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.config});

  final AppConfig config;

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'MyApp',
      home: Material(
        child: Padding(
          padding: EdgeInsets.all(32),
          child: FittedBox(
            child: Text('Hello World'),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:vitalmox/src/app.dart';
import 'package:vitalmox/src/config.dart';

void main() {
  runApp(MyApp(
    config: AppConfig(env: AppEnv.dev),
  ));
}

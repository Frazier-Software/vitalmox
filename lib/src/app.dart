import 'package:flutter/material.dart';
import 'package:vitalmox/src/common.dart';
import 'package:vitalmox/src/config.dart';
import 'package:vitalmox/src/widgets/lifetracker_tile.dart';
import 'package:vitalmox/src/widgets/reset_button.dart';

class VitalMox extends StatelessWidget {
  const VitalMox({
    super.key,
    required this.config,
  });

  final AppConfig config;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Vital Mox',
      theme: ThemeData(canvasColor: Colors.black),
      home: Material(
        child: Stack(
          alignment: Alignment.center,
          children: [
            OrientationBuilder(
              builder: (context, orientation) =>
                  orientation == Orientation.portrait
                      ? const Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            LifeTrackerTile(color: Colors.red, flip: true),
                            verticalMargin12,
                            LifeTrackerTile(color: Colors.blue),
                          ],
                        )
                      : const Row(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            LifeTrackerTile(color: Colors.red),
                            horizontalMargin12,
                            LifeTrackerTile(color: Colors.blue),
                          ],
                        ),
            ),
            const ResetButton(),
          ],
        ),
      ),
    );
  }
}

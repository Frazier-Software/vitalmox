import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vitalmox/src/common.dart';
import 'package:vitalmox/src/config.dart';
import 'package:vitalmox/src/models/player_model.dart';
import 'package:vitalmox/src/widgets/tracker_tile.dart';
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
        child: ChangeNotifierProvider(
          create: (context) => PlayerModel(),
          child: Stack(
            alignment: Alignment.center,
            children: [
              OrientationBuilder(
                builder: (context, orientation) => orientation == Orientation.portrait
                    ? const Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          TrackerTile(playerId: 1, flip: true),
                          verticalMargin12,
                          TrackerTile(playerId: 2),
                        ],
                      )
                    : const Row(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          TrackerTile(playerId: 1),
                          horizontalMargin12,
                          TrackerTile(playerId: 2),
                        ],
                      ),
              ),
              const ResetButton(),
            ],
          ),
        ),
      ),
    );
  }
}

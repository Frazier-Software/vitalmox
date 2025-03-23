import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vitalmox/src/common.dart';
import 'package:vitalmox/src/config.dart';
import 'package:vitalmox/src/domain/player.dart';
import 'package:vitalmox/src/widgets/reset_button.dart';
import 'package:vitalmox/src/widgets/tracker_tile.dart';

class VitalMox extends StatefulWidget {
  const VitalMox({
    super.key,
    required this.config,
  });

  final AppConfig config;

  @override
  State<VitalMox> createState() => _VitalMoxState();
}

class _VitalMoxState extends State<VitalMox> {
  late final Map<Key, Player> _players;

  @override
  void initState() {
    super.initState();

    var colors = List.from(Colors.primaries);
    colors.shuffle();
    _players = {
      GlobalKey(): Player(color: colors[0]),
      GlobalKey(): Player(color: colors[1]),
    };
  }

  @override
  Widget build(BuildContext context) {
    return Provider.value(
      value: widget.config,
      child: MaterialApp(
        title: 'Vital Mox',
        theme: ThemeData(canvasColor: Colors.black),
        home: Material(
          child: Stack(
            alignment: Alignment.center,
            children: [
              OrientationBuilder(
                builder: (context, orientation) {
                  if (orientation == Orientation.portrait) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        TrackerTile(
                          key: _players.keys.elementAt(0),
                          player: _players.values.elementAt(0),
                          flip: true,
                        ),
                        verticalMargin12,
                        TrackerTile(
                          key: _players.keys.elementAt(1),
                          player: _players.values.elementAt(1),
                        ),
                      ],
                    );
                  } else {
                    return Row(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        TrackerTile(
                          key: _players.keys.elementAt(0),
                          player: _players.values.elementAt(0),
                        ),
                        horizontalMargin12,
                        TrackerTile(
                          key: _players.keys.elementAt(1),
                          player: _players.values.elementAt(1),
                        ),
                      ],
                    );
                  }
                },
              ),
              ResetButton(players: _players.values.toList()),
            ],
          ),
        ),
      ),
    );
  }
}

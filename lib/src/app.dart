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
  final _numPlayers = 3;
  late final Map<Key, Player> _players;

  @override
  void initState() {
    super.initState();

    var colors = List.from(Colors.primaries)..shuffle();
    _players = Map.fromEntries(
      List.generate(
        _numPlayers,
        (index) => MapEntry(GlobalKey(), Player(color: colors[index])),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Provider.value(
      value: widget.config,
      child: MaterialApp(
        title: 'Vital Mox | MTG Life Counter',
        theme: ThemeData(canvasColor: Colors.black),
        home: Material(
          child: Stack(
            alignment: Alignment.center,
            children: [
              OrientationBuilder(builder: (context, orientation) {
                final outerWidget = orientation == Orientation.portrait ? Column.new : Row.new;
                final innerWidget = orientation == Orientation.portrait ? Row.new : Column.new;
                final spacing =
                    orientation == Orientation.portrait ? verticalMargin12 : horizontalMargin12;

                // maintain spacial layout by ordering entries with respect to orientation
                final entries = _getOrderedPlayerEntries(orientation);
                final topRowCount = _players.length ~/ 2;
                final topRowItems = entries.sublist(0, topRowCount);
                final bottomRowItems = entries.sublist(topRowCount);

                return outerWidget(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                      child: innerWidget(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: _buildChildren(orientation, topRowItems),
                      ),
                    ),
                    spacing,
                    Expanded(
                      child: innerWidget(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: _buildChildren(orientation, bottomRowItems),
                      ),
                    ),
                  ],
                );
              }),
              ResetButton(players: _players.values.toList()),
            ],
          ),
        ),
      ),
    );
  }

  List<MapEntry<Key, Player>> _getOrderedPlayerEntries(Orientation orientation) {
    final entries = _players.entries.toList();
    if (orientation == Orientation.portrait) {
      // Row-major order: left-to-right, top-to-bottom
      return entries;
    }

    // Column-major order: top-to-bottom, left-to-right
    final colCount = (_players.length / 2).ceil();
    final reordered = <MapEntry<Key, Player>>[];

    for (int row = 0; row < 2; row++) {
      for (int col = 0; col < colCount; col++) {
        int index = row + col * 2;
        if (index < _players.length) {
          reordered.add(entries[index]);
        }
      }
    }
    return reordered;
  }

  List<Widget> _buildChildren(Orientation orientation, List<MapEntry<Key, Player>> rowItems) {
    final children = <Widget>[];
    for (int i = 0; i < rowItems.length; i++) {
      children.add(TrackerTile(
        key: rowItems[i].key,
        player: rowItems[i].value,
      ));
      if (i < rowItems.length - 1) {
        children.add(orientation == Orientation.portrait ? horizontalMargin12 : verticalMargin12);
      }
    }
    return children;
  }
}

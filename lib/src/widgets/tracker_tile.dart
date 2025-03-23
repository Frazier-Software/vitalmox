import 'package:flutter/material.dart';
import 'package:vitalmox/src/common.dart';
import 'package:vitalmox/src/domain/player.dart';
import 'package:vitalmox/src/widgets/tracker_text.dart';

class TrackerTile extends StatefulWidget {
  const TrackerTile({
    super.key,
    bool? flip,
    required Player player,
  })  : _flip = flip ?? false,
        _player = player;

  final bool _flip;
  final Player _player;

  @override
  State<TrackerTile> createState() => _TrackerTileState();
}

class _TrackerTileState extends State<TrackerTile> {
  var _activeCounterIndex = 0;

  void _switchCounterCallback() {
    setState(() {
      _activeCounterIndex = _activeCounterIndex == 0 ? 1 : 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    var activeCounter = widget._player.counters[_activeCounterIndex];

    return Expanded(
      child: ListenableBuilder(
        listenable: widget._player,
        builder: (context, child) => RotatedBox(
          quarterTurns: widget._flip ? 2 : 0,
          child: Material(
            color: widget._player.color,
            borderRadius: borderRadius16,
            child: Stack(
              fit: StackFit.passthrough,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: activeCounter.decrement,
                        splashColor: Colors.black12,
                        customBorder: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(16),
                            bottomLeft: Radius.circular(16),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: InkWell(
                        onTap: activeCounter.increment,
                        splashColor: Colors.black12,
                        customBorder: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(16),
                            bottomRight: Radius.circular(16),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                TrackerText(
                  counter: activeCounter,
                  switchCounter: _switchCounterCallback,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

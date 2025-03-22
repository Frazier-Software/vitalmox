import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vitalmox/src/common.dart';
import 'package:vitalmox/src/models/player_model.dart';
import 'package:vitalmox/src/widgets/tracker_text.dart';

class TrackerTile extends StatelessWidget {
  const TrackerTile({
    super.key,
    required int playerId,
    bool? flip,
  })  : _playerId = playerId,
        _flip = flip ?? false;

  final int _playerId;
  final bool _flip;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: RotatedBox(
        quarterTurns: _flip ? 2 : 0,
        child: Consumer<PlayerModel>(
          builder: (context, model, child) => Material(
            color: model.getColor(_playerId),
            borderRadius: borderRadius16,
            child: Stack(
              fit: StackFit.passthrough,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: () => model.decrementCounter(_playerId),
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
                        onTap: () => model.incrementCounter(_playerId),
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
                TrackerText(playerId: _playerId),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vitalmox/src/common.dart';
import 'package:vitalmox/src/models/lifetracker_model.dart';
import 'package:vitalmox/src/widgets/lifetotal_text.dart';

class LifeTrackerTile extends StatelessWidget {
  const LifeTrackerTile({
    super.key,
    required int playerId,
    required Color color,
    bool? flip,
  })  : _playerId = playerId,
        _color = color,
        _flip = flip ?? false;

  final int _playerId;
  final Color _color;
  final bool _flip;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: RotatedBox(
        quarterTurns: _flip ? 2 : 0,
        child: Material(
          color: _color,
          borderRadius: borderRadius16,
          child: Consumer<LifeTrackerModel>(
            builder: (context, model, child) => Stack(
              fit: StackFit.passthrough,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: () => model.decrement(_playerId),
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
                        onTap: () => model.increment(_playerId),
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
                IgnorePointer(
                  child: LifeTotalText(
                    model.healthFor(_playerId),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

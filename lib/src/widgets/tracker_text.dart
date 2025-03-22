import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vitalmox/src/common.dart';
import 'package:vitalmox/src/models/player_model.dart';

const _counterSymbols = {
  CounterType.health: '\u2665',
  CounterType.infect: '\u03C6',
  CounterType.miscA: 'A',
  CounterType.miscB: 'B',
  CounterType.miscC: 'C',
  CounterType.miscD: 'D',
};

class TrackerText extends StatelessWidget {
  const TrackerText({
    super.key,
    required int playerId,
  }) : _playerId = playerId;

  final int _playerId;

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: Consumer<PlayerModel>(
        builder: (context, model, child) => Padding(
          padding: horizontalPadding20 +
              ((model.getActiveValue(_playerId) < 10 && model.getActiveValue(_playerId) >= 0)
                  ? bottomPadding8 + bottomPadding2
                  : bottomPadding12),
          child: Stack(
            alignment: Alignment.center,
            children: [
              IgnorePointer(
                child: Text(
                  model.getActiveValue(_playerId).toString(),
                  style: TextStyle(
                    fontSize:
                        model.getActiveValue(_playerId) < 10 && model.getActiveValue(_playerId) >= 0
                            ? 40
                            : 72,
                    fontWeight: FontWeight.w500,
                    height: 1.3,
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                child: GestureDetector(
                  onTap: () => model.setActiveCounter(
                    playerId: _playerId,
                    type: model.getActiveCounter(_playerId) != CounterType.health
                        ? CounterType.health
                        : CounterType.infect,
                  ),
                  child: Text(
                    _counterSymbols[model.getActiveCounter(_playerId)]!,
                    style: TextStyle(
                      fontSize: model.getActiveValue(_playerId) < 10 &&
                              model.getActiveValue(_playerId) >= 0
                          ? 5
                          : 10,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

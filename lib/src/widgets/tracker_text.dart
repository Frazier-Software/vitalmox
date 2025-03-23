import 'package:flutter/material.dart';
import 'package:vitalmox/src/common.dart';
import 'package:vitalmox/src/domain/counter.dart';

class TrackerText extends StatelessWidget {
  const TrackerText({
    super.key,
    required Counter counter,
    required VoidCallback switchCounter,
  })  : _counter = counter,
        _switchCounter = switchCounter;

  final Counter _counter;
  final VoidCallback _switchCounter;

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: _counter,
      builder: (context, child) {
        var isSingleDigit = _counter.value >= 0 && _counter.value < 10;
        return FittedBox(
          child: Padding(
            padding: horizontalPadding20 +
                (isSingleDigit ? bottomPadding8 + bottomPadding2 : bottomPadding12),
            child: Stack(
              alignment: Alignment.center,
              children: [
                IgnorePointer(
                  child: Text(
                    _counter.value.toString(),
                    style: TextStyle(
                      fontSize: isSingleDigit ? 40 : 72,
                      fontWeight: FontWeight.w500,
                      height: 1.3,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  child: GestureDetector(
                    onTap: () => _switchCounter(),
                    child: Text(
                      _counter.symbol,
                      style: TextStyle(
                        fontSize: isSingleDigit ? 5 : 10,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:vitalmox/src/common.dart';

class LifeTotalText extends StatelessWidget {
  const LifeTotalText(
    int health, {
    super.key,
  }) : _health = health;

  final int _health;

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: Padding(
        padding: allPadding20,
        child: Text.rich(
          textAlign: TextAlign.center,
          TextSpan(
            children: [
              TextSpan(
                text: _health.toString(),
                style: const TextStyle(
                  fontSize: 72,
                  height: 0.9,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const TextSpan(
                text: '\n\u2665',
                style: TextStyle(
                  fontSize: 11,
                  height: 0.6,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:vitalmox/src/common.dart';
import 'package:vitalmox/src/domain/player.dart';

class ResetButton extends StatefulWidget {
  const ResetButton({
    super.key,
    required List<Player> players,
  }) : _players = players;

  final List<Player> _players;

  @override
  State<ResetButton> createState() => _ResetButtonState();
}

class _ResetButtonState extends State<ResetButton> {
  double _turns = 0;

  @override
  Widget build(BuildContext context) {
    return AnimatedRotation(
      turns: _turns,
      duration: const Duration(milliseconds: 750),
      curve: Curves.fastOutSlowIn,
      child: IconButton(
        onPressed: () {
          setState(() => _turns += 1);
          var colors = List.from(Colors.primaries);
          colors.shuffle();
          widget._players.asMap().forEach((index, player) {
            player.resetCounters();
            player.color = colors[index];
          });
        },
        icon: const Icon(Icons.refresh),
        iconSize: 38,
        padding: allPadding8,
        color: Colors.white,
        style: const ButtonStyle(
          backgroundColor: WidgetStatePropertyAll(Colors.black),
        ),
      ),
    );
  }
}

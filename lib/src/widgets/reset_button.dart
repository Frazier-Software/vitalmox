import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vitalmox/src/common.dart';
import 'package:vitalmox/src/models/player_model.dart';

class ResetButton extends StatefulWidget {
  const ResetButton({
    super.key,
  });

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
          context.read<PlayerModel>().reset();
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

import 'package:flutter/material.dart';
import 'package:vitalmox/src/common.dart';
import 'package:vitalmox/src/layout.dart';

class SettingsOverlay extends StatelessWidget {
  const SettingsOverlay({
    super.key,
    required LayoutSettings layout,
    required Widget child,
  })  : _layout = layout,
        _child = child;

  final LayoutSettings _layout;
  final Widget _child;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _child,
        Positioned(
          top: 8,
          right: 12,
          child: SafeArea(
            child: GestureDetector(
              onTap: () => _showOverlay(context),
              child: Container(
                padding: allPadding8,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.grey.withOpacity(0.3),
                ),
                child: const Icon(
                  Icons.settings,
                  color: Colors.white70,
                  size: 24,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  void _showOverlay(BuildContext context) {
    const whiteText = TextStyle(fontSize: 18, color: Colors.white);
    const boldText = TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold);

    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.grey[900],
      builder: (BuildContext context) {
        return Container(
          height: 300,
          padding: allPadding16,
          child: SingleChildScrollView(
            child: Column(
              children: [
                const Text(
                  'How many players?',
                  style: boldText,
                ),
                verticalMargin16,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: List.generate(4, (index) {
                    final number = index + 2; // Creates buttons 2-5
                    return ElevatedButton(
                      onPressed: () => _layout.numOfPlayers = number,
                      style: ElevatedButton.styleFrom(
                        shape: const CircleBorder(),
                        padding: allPadding16,
                        backgroundColor:
                            _layout.numOfPlayers == number ? Colors.blue[700] : Colors.grey[800],
                      ),
                      child: Text(
                        '$number',
                        style: whiteText,
                      ),
                    );
                  }),
                ),
                verticalMargin32,
                const Text(
                  'Flip Top Row?',
                  style: boldText,
                ),
                verticalMargin16,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () => _layout.flipTopRow = true,
                      style: ElevatedButton.styleFrom(
                        shape: const CircleBorder(),
                        padding: allPadding16,
                        backgroundColor: _layout.flipTopRow ? Colors.blue[700] : Colors.grey[800],
                      ),
                      child: const Text(
                        'Yes',
                        style: whiteText,
                      ),
                    ),
                    horizontalMargin28,
                    ElevatedButton(
                      onPressed: () => _layout.flipTopRow = false,
                      style: ElevatedButton.styleFrom(
                        shape: const CircleBorder(),
                        padding: allPadding16,
                        backgroundColor: !_layout.flipTopRow ? Colors.blue[700] : Colors.grey[800],
                      ),
                      child: const Text(
                        'No',
                        style: whiteText,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

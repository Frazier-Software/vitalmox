import 'package:flutter/material.dart';
import 'package:vitalmox/src/app.dart';
import 'package:vitalmox/src/common.dart';

class SettingsOverlay extends StatefulWidget {
  const SettingsOverlay({
    super.key,
    required Widget child,
  }) : _child = child;

  final Widget _child;

  @override
  State<SettingsOverlay> createState() => _SettingsOverlayState();
}

class _SettingsOverlayState extends State<SettingsOverlay> {
  late final VitalMoxState app;

  @override
  void initState() {
    super.initState();
    app = context.findAncestorStateOfType<VitalMoxState>()!;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        widget._child,
        Positioned(
          top: 8,
          right: 12,
          child: SafeArea(
            child: GestureDetector(
              onTap: _showOverlay,
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

  void _showOverlay() {
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
                      onPressed: () => app.setNumPlayers(number),
                      style: ElevatedButton.styleFrom(
                        shape: const CircleBorder(),
                        padding: allPadding16,
                        backgroundColor:
                            app.numPlayers == number ? Colors.blue[700] : Colors.grey[800],
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
                      onPressed: () => app.setFlipTopRow(true),
                      style: ElevatedButton.styleFrom(
                        shape: const CircleBorder(),
                        padding: allPadding16,
                        backgroundColor: app.flipTopRow ? Colors.blue[700] : Colors.grey[800],
                      ),
                      child: const Text(
                        'Yes',
                        style: whiteText,
                      ),
                    ),
                    horizontalMargin28,
                    ElevatedButton(
                      onPressed: () => app.setFlipTopRow(false),
                      style: ElevatedButton.styleFrom(
                        shape: const CircleBorder(),
                        padding: allPadding16,
                        backgroundColor: !app.flipTopRow ? Colors.blue[700] : Colors.grey[800],
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

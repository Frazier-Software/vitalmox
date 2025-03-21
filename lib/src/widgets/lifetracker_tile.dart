import 'package:flutter/material.dart';
import 'package:vitalmox/src/common.dart';
import 'package:vitalmox/src/widgets/lifetotal_text.dart';

class LifeTrackerTile extends StatelessWidget {
  const LifeTrackerTile({
    super.key,
    required Color color,
    bool? flip,
  })  : _color = color,
        _flip = flip ?? false;

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
          child: Stack(
            fit: StackFit.passthrough,
            children: [
              Row(
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () {},
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
                      onTap: () {},
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
              const IgnorePointer(child: LifeTotalText()),
            ],
          ),
        ),
      ),
    );
  }
}

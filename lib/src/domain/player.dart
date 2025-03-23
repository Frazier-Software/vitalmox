import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:vitalmox/src/domain/counter.dart';

var _idPool = 0;

class Player extends ChangeNotifier {
  Player({
    required Color color,
  })  : id = _idPool++,
        _color = color,
        _counters = [
          Counter(name: 'health', symbol: '\u2665', initialValue: 20),
          Counter(name: 'infect', symbol: '\u03C6', min: 0),
        ];

  final int id;
  final List<Counter> _counters;

  Color _color;

  UnmodifiableListView<Counter> get counters => UnmodifiableListView(_counters);

  Color get color => _color;

  set color(Color value) {
    _color = value;
    notifyListeners();
  }

  void resetCounters() {
    for (var counter in _counters) {
      counter.reset();
    }
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Player && other.id == id;
  }

  @override
  int get hashCode => id.hashCode;
}

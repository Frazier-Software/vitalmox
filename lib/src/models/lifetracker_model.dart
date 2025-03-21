import 'dart:collection';

import 'package:flutter/material.dart';

class LifeTrackerModel extends ChangeNotifier {
  final Map<int, int> _players = {};

  UnmodifiableMapView<int, int> get players => UnmodifiableMapView(_players);

  int healthFor(int playerId) {
    if (_players[playerId] == null) {
      _players[playerId] = 20;
    }
    return _players[playerId]!;
  }

  void increment(int playerId) {
    _players[playerId] = (_players[playerId] ?? 20) + 1;
    notifyListeners();
  }

  void decrement(int playerId) {
    _players[playerId] = (_players[playerId] ?? 20) - 1;
    notifyListeners();
  }

  void reset() {
    _players.forEach((key, value) => _players[key] = 20);
    notifyListeners();
  }
}

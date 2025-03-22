import 'dart:math';

import 'package:flutter/material.dart';

enum CounterType {
  health,
  infect,
  miscA,
  miscB,
  miscC,
  miscD,
}

class PlayerModel extends ChangeNotifier {
  // map player IDs to player data objects
  final _players = <int, Player>{};

  Player _newPlayer() {
    final rand = Random();
    Color? color;
    while (color == null || _players.values.any((value) => value.color == color)) {
      color = Colors.primaries[rand.nextInt(Colors.primaries.length)];
    }
    return Player(color: color);
  }

  Color getColor(int playerId) {
    _players[playerId] ??= _newPlayer();
    return _players[playerId]!.color;
  }

  void setColor({required int playerId, required Color color}) {
    _players[playerId] ??= _newPlayer();
    _players[playerId]!.color = color;
    notifyListeners();
  }

  CounterType getActiveCounter(int playerId) {
    _players[playerId] ??= _newPlayer();
    return _players[playerId]!.activeCounter;
  }

  int getActiveValue(int playerId) {
    _players[playerId] ??= _newPlayer();
    final type = _players[playerId]!.activeCounter;
    return _players[playerId]!.data[type]!;
  }

  void setActiveCounter({required int playerId, required CounterType type}) {
    _players[playerId] ??= _newPlayer();
    _players[playerId]!.activeCounter = type;
    notifyListeners();
  }

  void incrementCounter(int playerId) {
    _players[playerId] ??= _newPlayer();
    final type = _players[playerId]!.activeCounter;
    _players[playerId]!.data[type] = _players[playerId]!.data[type]! + 1;
    notifyListeners();
  }

  void decrementCounter(int playerId) {
    _players[playerId] ??= _newPlayer();
    final type = _players[playerId]!.activeCounter;
    _players[playerId]!.data[type] = _players[playerId]!.data[type]! - 1;
    notifyListeners();
  }

  void reset() {
    _players.forEach((key, value) => _players[key] = _newPlayer());
    notifyListeners();
  }
}

class Player {
  Player({required this.color});

  Color color;

  final data = {
    CounterType.health: 20,
    CounterType.infect: 0,
    CounterType.miscA: 0,
    CounterType.miscB: 0,
    CounterType.miscC: 0,
    CounterType.miscD: 0,
  };

  var activeCounter = CounterType.health;
}

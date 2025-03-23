import 'package:flutter/material.dart';

class LayoutSettings extends ChangeNotifier {
  var _numOfPlayers = 2;
  var _flipTopRow = false;

  int get numOfPlayers => _numOfPlayers;

  set numOfPlayers(int value) {
    _numOfPlayers = value;
    notifyListeners();
  }

  bool get flipTopRow => _flipTopRow;

  set flipTopRow(bool value) {
    _flipTopRow = value;
    notifyListeners();
  }
}

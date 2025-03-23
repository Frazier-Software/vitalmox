import 'dart:math' as math;

import 'package:flutter/material.dart';

class Counter extends ChangeNotifier {
  Counter({
    required this.name,
    required this.symbol,
    this.min,
    this.max,
    int? initialValue,
  }) {
    _initialValue = initialValue ?? 0;
    _setValueAndClamp(_initialValue);
  }

  String name;
  String symbol;

  final int? min;
  final int? max;

  late int _initialValue;
  late int _value;

  int get value => _value;

  void _setValueAndClamp(int newValue) {
    _value = newValue;
    if (min != null) _value = math.max(_value, min!);
    if (max != null) _value = math.min(_value, max!);
  }

  void increment() {
    _setValueAndClamp(_value + 1);
    notifyListeners();
  }

  void decrement() {
    _setValueAndClamp(_value - 1);
    notifyListeners();
  }

  void reset() {
    _setValueAndClamp(_initialValue);
    notifyListeners();
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Counter &&
        other.name == name &&
        other.symbol == symbol &&
        other.min == min &&
        other.max == max &&
        other._initialValue == _initialValue &&
        other.value == _value;
  }

  @override
  int get hashCode => Object.hash(
        name,
        symbol,
        min,
        max,
        _initialValue,
        _value,
      );
}

import 'package:flutter/material.dart';

class BoardTile {
  late final int id;
  late String symbol;
  late Color color;
  late bool enable;

  BoardTile(
    this.id, {
    this.symbol = '',
    this.color = Colors.black38,
    this.enable = true,
  });
}

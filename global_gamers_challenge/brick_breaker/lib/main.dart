import 'package:flutter/material.dart';
import 'package:flame/game.dart';
import 'package:brick_breaker/brick_breaker.dart';

void main() {
  final game = BrickBreaker();
  runApp(GameWidget(game: game));
}

import 'dart:math';

import 'package:flame/components.dart';
import 'package:flame/extensions.dart';
import 'package:klondike/klondike_game.dart';

class Card extends PositionComponent {
  Card(int intRank, int intSuid)
    : rank = intRank,
      suid = intSuid,
      _faceup = false,
      super(size: KlondikeGame.cardSize);

  final Rank rank;
  final Suit suid;
  bool _faceup;

  bool get isFaceUp => _faceup;
  bool get isFaceDown => !_faceup;
  void flip() => _faceup = !_faceup;

  @override
  String toString() => rank.label + suid.label;

  final random = Random();
  for (var i = 0; i < 7; i++) {
    for (var j = 0; j < 4; j++) {
      final card = Card(random.nextInt(13) + 1, random.nextInt(4) + 1)
        ..position = Vector2(100 + i * 1150, 100 + j * 1500);
        ..addToParent(world);
      if (random.nextDouble() < 0.9) {
        card.flip();
      }
    }
  }
  
  @override
  void render(Canvas canvas) {
    if (_faceup) {
      _renderFront(canvas);
    } else {
      _renderBack(canvas);
    }
  }

  void _renderFront(Canvas canvas) {}
  void _renderBack(Canvas canvas) {
    canvas.drawRRect(cardRRect, backBackgroundPaint);
    canvas.drawRRect(cardRRect, backBorderPaint1);
    canvas.drawRRect(backRRectInner, backBorderPaint2);
  }
}

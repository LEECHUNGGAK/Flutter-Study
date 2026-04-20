import 'dart:async';
import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flame/widgets.dart';
import 'package:klondike/components/Pile.dart';
import 'package:klondike/components/foundation.dart';
import 'package:klondike/components/waste.dart';
import 'package:klondike/components/stock.dart';

class KlondikeGame extends FlameGame {
  static const double cardWidth = 1000.0;
  static const double cardHeight = 1000.0;
  static const double cardGap = 175.0;
  static const double cardRadius = 100.0;
  static final Vector2 cardSize = Vector2(cardWidth, cardHeight);

  @override
  FutureOr<void> onLoad() async {
    await Flame.images.load('klondike-sprites.png');

    final stock = Stock()
      ..size = cardSize
      ..position = Vector2(cardGap, cardGap);
    final waste = Waste()
      ..size = cardSize
      ..position = Vector2(cardWidth + cardGap * 2, cardGap);
    final foundations = List.generate(
      4,
      (index) => Foundation()
        ..size = cardSize
        ..position = Vector2(
          (cardWidth + cardGap) * (index + 3) + cardGap,
          cardGap,
        ),
    );
    final piles = List.generate(
      7,
      (index) => Pile()
        ..size = cardSize
        ..position = Vector2(
          cardGap + (cardWidth + cardGap) * index,
          cardHeight + cardGap * 2,
        ),
    );

    world.add(stock);
    world.add(waste);
    world.addAll(foundations);
    world.addAll(piles);

    camera.viewfinder.visibleGameSize = Vector2(
      cardWidth * 7 + cardGap * 8,
      cardHeight * 4 + cardGap * 3,
    );
    camera.viewfinder.position = Vector2(cardWidth * 3.5 + cardGap * 4, 0);
    camera.viewfinder.anchor = Anchor.topCenter;

    return super.onLoad();
  }
}

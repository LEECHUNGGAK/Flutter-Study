import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flutter/material.dart';
import 'package:flame/effects.dart';

import '../brick_breaker.dart';
import 'play_area.dart';
import 'bat.dart';
import 'brick.dart';

class Ball extends CircleComponent
    with CollisionCallbacks, HasGameReference<BrickBreaker> {
  final Vector2 velocity;
  final double difficultyModifier;

  Ball({
    required this.velocity,
    required this.difficultyModifier,
    required super.position,
    required double radius,
  }) : super(
         radius: radius,
         anchor: Anchor.center,
         paint: Paint()
           ..color = const Color(0xff1e6091)
           ..style = PaintingStyle.fill,
         children: [CircleHitbox()],
       );

  @override
  void update(double dt) {
    super.update(dt);
    position += velocity * dt;
  }

  @override
  void onCollisionStart(
    Set<Vector2> intersectionPoints,
    PositionComponent other,
  ) {
    super.onCollisionStart(intersectionPoints, other);
    if (other is PlayArea) {
      if (intersectionPoints.first.x <= 0) {
        velocity.x = -velocity.x;
      } else if (intersectionPoints.first.x >= game.width) {
        velocity.x = -velocity.x;
      } else if (intersectionPoints.first.y <= 0) {
        velocity.y = -velocity.y;
        // 공이 화면 하단에 닿으면 삭제합니다.
      } else if (intersectionPoints.first.y >= game.height) {
        add(
          RemoveEffect(
            delay: 0.35,
            onComplete: () {
              game.playState = PlayState.gameOver;
            },
          ),
        );
      }
    } else if (other is Bat) {
      velocity.y = -velocity.y;
      // 공과 배트가 접촉할 때 상대적 위치에 따라 수평 방향을 갱신합니다.
      velocity.x =
          velocity.x +
          (position.x - other.position.x) / other.size.x * game.width * 0.3;
    } else if (other is Brick) {
      // 공이 벽돌 위에 닿을 때
      if (position.y < other.position.y - other.size.y / 2) {
        velocity.y = -velocity.y;
        // 공이 벽돌 아래에 닿을 때
      } else if (position.y > other.position.y + other.size.y / 2) {
        velocity.y = -velocity.y;
        // 공이 벽돌 왼쪽에 닿을 때
      } else if (position.x < other.position.x) {
        velocity.x = -velocity.x;
        // 공이 벽돌 오른쪽에 닿을 때
      } else if (position.x > other.position.x) {
        velocity.x = -velocity.x;
      }
      velocity.setFrom(velocity * difficultyModifier);
    } else {
      debugPrint('collision with $other');
    }
  }
}

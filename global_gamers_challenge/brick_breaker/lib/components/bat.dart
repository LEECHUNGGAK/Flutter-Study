import 'package:flutter/material.dart';
import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/effects.dart';
import 'package:flame/events.dart';

import '../brick_breaker.dart';

// 이 구성 요소를 드래그할 수 있도록
// 1. DragCallbacks 믹스인을 추가합니다.
class Bat extends PositionComponent
    with DragCallbacks, HasGameReference<BrickBreaker> {
  final Radius cornerRadius;
  final Paint _paint = Paint()
    ..color = const Color(0xff1e6091)
    ..style = PaintingStyle.fill;

  Bat({
    required this.cornerRadius,
    required super.position,
    required super.size,
  }) : super(anchor: Anchor.center, children: [RectangleHitbox()]);

  // PositionComponent를 화면에 연출하려면 render 회답 함수를 재정의해야 합니다.
  @override
  void render(Canvas canvas) {
    super.render(canvas);
    // drawRRect는 둥근 사각형을 그립니다.
    canvas.drawRRect(
      RRect.fromRectAndRadius(Offset.zero & size.toSize(), cornerRadius),
      _paint,
    );
  }

  // 이 구성 요소를 드래그할 수 있도록
  // 2. onDragUpdate 회답 함수를 재정의합니다.
  @override
  void onDragUpdate(DragUpdateEvent event) {
    super.onDragUpdate(event);
    position.x = (position.x + event.localDelta.x).clamp(0, game.width);
  }

  // 키보드의 입력에 응답하는 함수입니다.
  void moveBy(double dx) {
    add(
      // 이 구성 요소가 새로운 위치로 이동할 때 애니메이션 효과를 줍니다.
      MoveToEffect(
        Vector2((position.x + dx).clamp(0, game.width), position.y),
        EffectController(duration: 0.1),
      ),
    );
  }
}

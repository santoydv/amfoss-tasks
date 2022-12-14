import 'package:flame/components.dart';
import 'directions.dart';

class Bunny extends SpriteComponent with HasGameRef {
  Bunny() : super(size: Vector2.all(150.0));

  @override
  Future<void> onLoad() async {
    super.onLoad();
    sprite = await gameRef.loadSprite('bunny.png');
    position = gameRef.size / 2;
  }

  Direction direction = Direction.none;

  @override
  void update(double dt) {
    super.update(dt);
    updatePosition(dt);
  }

  updatePosition(double dt) {
    switch (direction) {
      case Direction.up:
        if (position.y > 0) {
          position.y--;
        }
        break;

      case Direction.down:
        if (position.y < 930) {
          position.y++;
        }
        break;

      case Direction.left:
        if (position.x > -28) {
          position.x--;
        }
        break;

      case Direction.right:
        if (position.x < 1796.0) {
          position.x++;
        }
        break;
      case Direction.none:
        break;
    }
  }
}
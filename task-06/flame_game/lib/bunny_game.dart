import 'dart:ui';

import 'package:flame/game.dart';
import 'package:flame/text.dart';
import 'bunny.dart';
import 'house.dart';
import 'directions.dart';

class BunnyGame extends FlameGame {
  Bunny bunny = Bunny();
  House house = House();
  @override
  Future<void> onLoad() async {
    super.onLoad();
    await add(house);
    await add(bunny);
    bunny.position = house.size / 1.2;
    camera.followComponent(bunny,
        worldBounds: Rect.fromLTRB(0, 0, house.size.x, house.size.y));
  }

  onArrowKeyChanged(Direction direction) {
    bunny.direction = direction;
  }
}

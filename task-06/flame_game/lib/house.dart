    import 'package:flame/components.dart';
    
    class House extends SpriteComponent with HasGameRef {
      @override
      Future<void> onLoad() async {
        super.onLoad();
        sprite = await gameRef.loadSprite('background.png');
        size = sprite!.originalSize;
      }
    }

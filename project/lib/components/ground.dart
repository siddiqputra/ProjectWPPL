import 'dart:async';
import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:project/constants.dart';
import '../game.dart';

class Ground extends SpriteComponent with HasGameRef<FlappyBirdGame>, CollisionCallbacks {
  //init background position and size
  Ground() : super();

  /*

  LOAD

  */

  @override
  Future<void> onLoad() async {
    //load background sprite image
    size = Vector2 (2 * gameRef.size.x, groundHeight);
    position = Vector2(0, gameRef.size.y - groundHeight);

    //load Ground sprite image
    sprite = await Sprite.load('ground.png');

    //add a collision box
    add(RectangleHitbox());
  }
  
  /*
  
  UPDATE

  */

  @override
  void update(double dt) {
    //move ground to left
    position.x -= groundScrollingSpeed * dt;

    //resert ground if it goes off screen for infinite scroll
    //if half has been passed
    if (position.x + size.x / 2 <= 0 ){
      position.x = 0 ; 
    }

  }
}

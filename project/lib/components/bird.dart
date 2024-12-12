import 'dart:async';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:project/components/ground.dart';
import 'package:project/game.dart';

import '../constants.dart';

class Bird extends SpriteComponent with CollisionCallbacks{
  /*
   
  INIT BIRD

   */
  //initialialize bird position and size
  Bird()
      : super(
            position: Vector2(birdStartX, birdStartY),
            size: Vector2(birdWidth, birdHeight));

  //physically world properties
  double velocity = 0;

  /* 
    LOAD   
   */
  @override
  FutureOr<void> onLoad() async {
    sprite = await Sprite.load('bird.png');

    //add hit box
    add(RectangleHitbox());
  }

  /* 

  JUMP/FLAP

   */
  void flap() {
    velocity = jumpStrength;
  }

  /* 
  UPDATE EVERY SECOND
   */

  @override
  void update(double dt) {
    //apply gravity
    velocity += gravity * dt;

    //UPADTE BIRD POSITION BASED ON CURRENT VELOCITY
    position.y += velocity * dt;
  }

  /*

  COLLISION -> with another object

  */

  @override
  void onCollision(Set<Vector2> intersectionPoints, PositionComponent other){
    super .onCollision(intersectionPoints, other);

    //check if bird collide with ground
    if (other is Ground){
      (parent as FlappyBirdGame).gameOver();
    }
  }
}

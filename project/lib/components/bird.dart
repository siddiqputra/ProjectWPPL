import 'dart:async';

import 'package:flame/components.dart';

import '../constants.dart';

class Bird extends SpriteComponent {
  /*
   
  INIT BIRD

   */
  //initialialize bird position and size
  Bird():super(
    position: Vector2(BirdStartX, BirdStartY),
    size: Vector2(birdWidth,birdHeight));

  //physically world properties
  double velocity = 0;


  /* 
    LOAD   
   */
  @override
  FutureOr<void> onLoad() async {
    sprite = await Sprite.load('bird.png');
}

  /* 

  JUMP/FLAP

   */
  void flap(){
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


}}
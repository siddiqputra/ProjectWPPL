import 'dart:async';

import 'package:flame/components.dart';

class Bird extends SpriteComponent {
  /*
   
  INIT BIRD

   */
  //initialialize bird position and size
  Bird():super(position: Vector2(100, 100),size: Vector2(60,40));

  //physically world properties
  double velocity = 0;
  final double gravity = 800;
  final double jumpStrength = -300;


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
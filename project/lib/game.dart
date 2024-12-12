import 'dart:async';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:project/components/bird.dart';

class FlappyBirdGame extends FlameGame with TapDetector{
  /*
  Basic Game Componponets
  -bird
  -backgroud
  -ground
  -pipes
  -score

 */

  late Bird bird;

  /* 
    LOAD
   */

  @override
  FutureOr<void> onload(){
    //load bird
    bird = Bird();
    add(bird);
  }

  /*

    TAP

  */

  @override
  void onTap() {
    bird.flap();
  }
}
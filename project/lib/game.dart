import 'dart:async';

import 'package:flame/game.dart';
import 'package:project/components/bird.dart';

class FlappyBirdGame extends FlameGame{
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
}
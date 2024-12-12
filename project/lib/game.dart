import 'dart:async';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:project/components/background.dart';
import 'package:project/components/bird.dart';
import 'package:project/components/ground.dart';
import 'package:project/constants.dart';

class FlappyBirdGame extends FlameGame with TapDetector, HasCollisionDetection {
  /*
  Basic Game Componponets
  -bird
  -backgroud
  -ground
  -pipes
  -score

 */

  late Bird bird;
  late Background background;
  late Ground ground;
  /* 
    LOAD
   */

  @override
  FutureOr<void> onLoad() {
    //load background
    background = Background(size);
    add(background);

    //load bird
    bird = Bird();
    add(bird);

    //load Ground
    ground = Ground();
    add(ground);
  }

  /*

    TAP

  */

  @override
  void onTap() {
    bird.flap();
  }

  /*

  GAME OVER

  */

  bool isGameOver = false;

  void gameOver(){
    //prevent multiple game over trigger
    if (isGameOver) return;

    isGameOver = true;
    pauseEngine();

    // show dialog box for user
showDialog(
  context: buildContext!,
  builder: (context) => AlertDialog(
      title: const Text("Game Over"),
      actions: [
        TextButton(
          onPressed: () {
            // pop context
            Navigator.pop(context);

            //reset Game
            resetGame();
          },
          child: const Text("Restart")
        )
      ],
    ),
);
}

  void resetGame() {
    bird.position = Vector2(birdStartX, birdStartY);
    bird.velocity = 0;
    isGameOver = false;
    resumeEngine();
  }
}
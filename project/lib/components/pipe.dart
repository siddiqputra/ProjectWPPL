import 'dart:async';
import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:project/constants.dart';
import '../game.dart';

class Pipe extends SpriteComponent
    with CollisionCallbacks, HasGameRef<FlappyBirdGame> {
  // determine if the pipe is top or bottom
  final bool isTopPipe;

  bool scored = false;

  // init
  Pipe(Vector2 position, Vector2 size, {required this.isTopPipe})
      : super(position: position, size: size);

  /*

  LOAD

  */

  @override
  FutureOr<void> onLoad() async {
    // load sprite image
    sprite = await Sprite.load(isTopPipe ? 'pipe2.png' : 'pipeup.png');

    // add hit box for collision
    add(RectangleHitbox());

    /*

    UPDATE

    */
  }

  @override
  void update(double dt) {
    // scroll pipe to left
    position.x -= groundScrollingSpeed * dt;

    //check bird has passed the pipe
    if (!scored && position.x + size.x < gameRef.bird.position.x) {
      scored = true;

      //only increment
      if (isTopPipe) {
        gameRef.incrementScore();
      }
    }

    // remove pipe if it goes off the screen
    if (position.x + size.x <= 0) {
      removeFromParent();
    }
  }
}

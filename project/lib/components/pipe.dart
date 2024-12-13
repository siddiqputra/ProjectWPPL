import 'dart:async';
import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:project/constants.dart';
import '../game.dart';

class Pipe extends SpriteComponent
    with CollisionCallbacks, HasGameRef<FlappyBirdGame> {
  // tentukan apakah pipanya atas atau bawah
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
    // memuat gambar sprite
    sprite = await Sprite.load(isTopPipe ? 'pipe2.png' : 'pipeup.png');

    // tambahkan kotak hit untuk tabrakan
    add(RectangleHitbox());

    /*

    UPDATE

    */
  }

  @override
  void update(double dt) {
   // gulir pipa ke kiri
    position.x -= groundScrollingSpeed * dt;

    //periksa burung telah melewati pipa
    if (!scored && position.x + size.x < gameRef.bird.position.x) {
      scored = true;

      //only increment
      if (isTopPipe) {
        gameRef.incrementScore();
      }
    }

    // hapus pipa jika keluar dari layar
    if (position.x + size.x <= 0) {
      removeFromParent();
    }
  }
}

// Mengimpor pustaka Dart untuk operasi asynchronous dan timer.
import 'dart:async';
// Mengimpor komponen dari Flame untuk membuat objek game.
import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:project/components/ground.dart';
import 'package:project/components/pipe.dart';
import 'package:project/game.dart';
import '../constants.dart';

class Bird extends SpriteComponent with CollisionCallbacks {
  /*
   
  INIT BIRD

   */
  // Inisialisasi posisi awal dan ukuran burung.
  Bird()
      : super(
            position: Vector2(birdStartX, birdStartY),
            size: Vector2(birdWidth, birdHeight));

  // Properti untuk mendefinisikan dunia fisik burung.
  double velocity = 0;

  /*
    LOAD
  */
  @override
  FutureOr<void> onLoad() async {
    // Memuat sprite burung dari file gambar.
    sprite = await Sprite.load('bird2.png');

    //tambahkan kotak tabrakan
    add(RectangleHitbox());
  }

  /*

    LOMPAT / KEPERKAN SAYAP (FLAP)

   */
  void flap() {
    velocity = jumpStrength;
  }

  /*
    PEMBARUAN TIAP FRAME
  */

  @override
  void update(double dt) {
    // Menerapkan gravitasi ke kecepatan burung.
    velocity += gravity * dt;

    // Memperbarui posisi burung berdasarkan kecepatan saat ini.
    position.y += velocity * dt;
  }

  /*

  TABRAKAN -> dengan objek lain

*/

  @override
  void onCollision(Set<Vector2> intersectionPoints, PositionComponent other) {
    super.onCollision(intersectionPoints, other);

    //periksa apakah burung bertabrakan dengan tanah
    if (other is Ground) {
      (parent as FlappyBirdGame).gameOver();
    }

    //periksa apakah burung bertabrakan dengan pipa
    if (other is Pipe) {
      (parent as FlappyBirdGame).gameOver();
    }
  }
}

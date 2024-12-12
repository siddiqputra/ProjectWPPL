// Mengimpor pustaka Dart untuk operasi asynchronous dan timer.
import 'dart:async';

// Mengimpor komponen dari Flame untuk membuat objek game.
import 'package:flame/components.dart';

<<<<<<< HEAD
// Mendefinisikan kelas Bird yang merupakan subclass dari SpriteComponent.
// SpriteComponent digunakan untuk menampilkan gambar sebagai elemen dalam game.
=======
import '../constants.dart';

>>>>>>> 2d5595c8838bfa7332e170da5e6f357631aac882
class Bird extends SpriteComponent {
  /*
    INISIALISASI BURUNG
  */

<<<<<<< HEAD
  // Inisialisasi posisi awal dan ukuran burung.
  Bird() : super(
          position: Vector2(100, 100), // Posisi awal burung (x, y).
          size: Vector2(60, 40),       // Ukuran burung (lebar x tinggi).
        );

  // Properti untuk mendefinisikan dunia fisik burung.
  double velocity = 0; // Kecepatan vertikal burung.
  final double gravity = 200; // Gaya gravitasi yang diterapkan ke burung.
  final double jumpStrength = -300; // Kekuatan lompatan burung (negatif ke atas).
=======
   */
  //initialialize bird position and size
  Bird():super(
    position: Vector2(BirdStartX, BirdStartY),
    size: Vector2(birdWidth,birdHeight));

  //physically world properties
  double velocity = 0;
>>>>>>> 2d5595c8838bfa7332e170da5e6f357631aac882

  /*
    MEMUAT SPRITE BURUNG
  */
  @override
  FutureOr<void> onLoad() async {
<<<<<<< HEAD
    // Memuat sprite burung dari file gambar.
    sprite = await Sprite.load('bird.png');
  }
=======
    sprite = await Sprite.load('/aasets/images/bird.png');
}
>>>>>>> 2d5595c8838bfa7332e170da5e6f357631aac882

  /*
    LOMPAT / KEPERKAN SAYAP (FLAP)
  */
  void flap() {
    // Mengatur kecepatan vertikal menjadi nilai kekuatan lompatan.
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
}

// Mengimpor pustaka Dart untuk operasi asynchronous dan timer.
import 'dart:async';

// Mengimpor komponen dari Flame untuk membuat objek game.
import 'package:flame/components.dart';

// Mendefinisikan kelas Bird yang merupakan subclass dari SpriteComponent.
// SpriteComponent digunakan untuk menampilkan gambar sebagai elemen dalam game.
class Bird extends SpriteComponent {
  /*
    INISIALISASI BURUNG
  */

  // Inisialisasi posisi awal dan ukuran burung.
  Bird() : super(
          position: Vector2(100, 100), // Posisi awal burung (x, y).
          size: Vector2(60, 40),       // Ukuran burung (lebar x tinggi).
        );

  // Properti untuk mendefinisikan dunia fisik burung.
  double velocity = 0; // Kecepatan vertikal burung.
  final double gravity = 200; // Gaya gravitasi yang diterapkan ke burung.
  final double jumpStrength = -300; // Kekuatan lompatan burung (negatif ke atas).

  /*
    MEMUAT SPRITE BURUNG
  */
  @override
  FutureOr<void> onLoad() async {
    // Memuat sprite burung dari file gambar.
    sprite = await Sprite.load('bird.png');
  }

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

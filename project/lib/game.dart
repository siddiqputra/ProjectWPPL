// Mengimpor pustaka Dart untuk menangani operasi asynchronous dan timer.
import 'dart:async';
<<<<<<< HEAD

// Mengimpor paket Flame untuk pengembangan game.
=======
import 'package:flame/events.dart';
>>>>>>> 2d5595c8838bfa7332e170da5e6f357631aac882
import 'package:flame/game.dart';
// Mengimpor kelas Bird dari file komponen dalam proyek.
import 'package:project/components/bird.dart';

<<<<<<< HEAD
// Mendefinisikan kelas FlappyBirdGame yang merupakan subclass dari FlameGame.
// FlameGame menyediakan kerangka kerja dasar untuk pengembangan game.
class FlappyBirdGame extends FlameGame {
=======
class FlappyBirdGame extends FlameGame with TapDetector{
>>>>>>> 2d5595c8838bfa7332e170da5e6f357631aac882
  /*
   Komponen dasar game:
   - bird: Objek burung yang dikendalikan pemain.
   - background: Latar belakang permainan.
   - ground: Tanah tempat burung jatuh.
   - pipes: Rintangan berbentuk pipa yang harus dilewati burung.
   - score: Skor pemain selama permainan.
  */

  // Deklarasi variabel `bird` untuk menyimpan instance dari komponen Bird.
  late Bird bird;

  /*
    Metode onload dipanggil saat game dimuat.
    Digunakan untuk menginisialisasi komponen yang akan ditambahkan ke game.
  */
  FutureOr<void> onload() {
    // Memuat objek burung.
    bird = Bird();
    // Menambahkan burung ke dalam daftar komponen game.
    add(bird);
  }
<<<<<<< HEAD
}
=======

  /*

    TAP

  */

  @override
  void onTap() {
    bird.flap();
  }
}
>>>>>>> 2d5595c8838bfa7332e170da5e6f357631aac882

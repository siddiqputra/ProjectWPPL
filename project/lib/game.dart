// Mengimpor pustaka Dart untuk menangani operasi asynchronous dan timer.
import 'dart:async';
// Mengimpor paket Flame untuk pengembangan game.
import 'package:flame/events.dart';
import 'package:flame/game.dart';
// Mengimpor kelas Bird dari file komponen dalam proyek.
import 'package:project/components/bird.dart';

class FlappyBirdGame extends FlameGame with TapDetector {
}
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
}
  
/*

  TAP

*/

@Override
void onTap() {
  bird.flap();
}
}

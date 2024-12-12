// Mengimpor pustaka Dart untuk menangani operasi asynchronous dan timer.
import 'dart:async';
// Mengimpor paket Flame untuk pengembangan game.
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:project/components/background.dart';
// Mengimpor kelas Bird dari file komponen dalam proyek.
import 'package:project/components/bird.dart';
import 'package:project/components/ground.dart';
import 'package:project/components/pipe.dart';
import 'package:project/components/pipe_manager.dart';
import 'package:project/constants.dart';

class FlappyBirdGame extends FlameGame with TapDetector, HasCollisionDetection {
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
  late Background background;
  late Ground ground;
  late PipeManager pipeManager;

  /*
    Metode onload dipanggil saat game dimuat.
    Digunakan untuk menginisialisasi komponen yang akan ditambahkan ke game.
  */
  @override
  FutureOr<void> onLoad() {
    // Memuat latar belakang
    background = Background(size);
    add(background);

    // Memuat burung
    bird = Bird();
    add(bird);

    // Memuat tanah
    ground = Ground();
    add(ground);

    // Memuat pipa
    pipeManager = PipeManager();
    add(pipeManager);
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

  void gameOver() {
    // Mencegah pemicu game over yang ganda
    if (isGameOver) return;

    isGameOver = true;
    pauseEngine();

    // Tampilkan kotak dialog untuk pengguna
    showDialog(
      context: buildContext!,
      builder: (context) => AlertDialog(
        title: const Text("Game Over"),
        actions: [
          TextButton(
              onPressed: () {
                // Menutup kotak dialog
                Navigator.pop(context);

                // Mengatur ulang permainan
                resetGame();
              },
              child: const Text("Restart"))
        ],
      ),
    );
  }

  void resetGame() {
    bird.position = Vector2(birdStartX, birdStartY);
    bird.velocity = 0;
    isGameOver = false;
    // Remove all pipes from the game
    children.whereType<Pipe>().forEach((pipe) => pipe.removeFromParent());
    resumeEngine();
  }
}

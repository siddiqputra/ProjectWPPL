// Mengimpor pustaka Dart untuk menangani operasi asynchronous dan timer.
import 'dart:async';
// Mengimpor paket Flame untuk pengembangan game.
import 'package:flame/events.dart';
import 'package:flame/game.dart';
// Mengimpor paket flutter untuk pengembangan game.
import 'package:flutter/material.dart';
// Mengimpor kelas Bird dari file komponen dalam proyek.
import 'package:project/components/background.dart';
import 'package:project/components/bird.dart';
import 'package:project/components/ground.dart';
import 'package:project/components/pipe.dart';
import 'package:project/components/pipe_manager.dart';
import 'package:project/components/score.dart';
import 'package:project/constants.dart';
import 'package:project/main.dart';

class FlappyBirdGame extends FlameGame with TapDetector, HasCollisionDetection {
  /*
   Komponen dasar game:
   - bird: Objek burung yang dikendalikan pemain.
   - background: Latar belakang permainan.
   - ground: Tanah tempat burung jatuh.
   - pipes: Rintangan berbentuk pipa yang harus dilewati burung.
   - score: Skor pemain selama permainan.
  */

  // Deklarasi variabel
  late Bird bird;
  late Background background;
  late Ground ground;
  late PipeManager pipeManager;
  late ScoreText scoreText;

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

    //memuat score
    scoreText = ScoreText();
    add(scoreText);
  }

  /*

  TAP

  */

  @override
  void onTap() {
    bird.flap();
  }

  /*

  SCORE
  
  */

  int score = 0;

  void incrementScore() {
    score += 1;
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
      barrierDismissible: false, // Menonaktifkan area di luar dialog
      builder: (context) => AlertDialog(
        title: const Text("Game Over"),
        content: Text("High Score: $score"),
        shape: RoundedRectangleBorder(
          borderRadius:
              BorderRadius.circular(12), // Menambahkan sudut melengkung
          side: const BorderSide(
            color: Colors.brown, // Warna border
            width: 2, // Ketebalan border
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              // Menutup kotak dialog
              Navigator.pop(context);

              // Mengatur ulang permainan
              resetGame();
            },
            style: TextButton.styleFrom(
              side: const BorderSide(
                  color: Colors.brown,
                  width: 2), // Menambahkan border pada tombol
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                    8), // Menambahkan radius pada border tombol
              ),
            ),
            child: const Text("Restart"),
          ),
          // Tombol Menu (kembali ke halaman start)
          TextButton(
            onPressed: () {
              // Menutup kotak dialog
              Navigator.pop(context);

              // Kembali ke halaman start atau reset game
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      StartScreen(), // Ganti dengan halaman start Anda
                ),
              );
            },
            style: TextButton.styleFrom(
              side: const BorderSide(color: Colors.brown, width: 2),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: const Text("Menu"),
          ),
        ],
      ),
    );
  }

  void resetGame() {
    bird.position = Vector2(birdStartX, birdStartY);
    bird.velocity = 0;
    score = 0;
    isGameOver = false;
    // Remove all pipes from the game
    children.whereType<Pipe>().forEach((pipe) => pipe.removeFromParent());
    resumeEngine();
  }
}

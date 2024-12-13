import 'dart:async';
import 'package:flame/components.dart';
import 'package:flutter/material.dart';
import '../game.dart';

/// Komponen untuk menampilkan skor dalam game FlappyBird.
/// Menggunakan `TextComponent` untuk membuat teks dan memuat skor dari game.
class ScoreText extends TextComponent with HasGameRef<FlappyBirdGame> {
  // Inisialisasi teks skor dengan nilai awal '0' dan pengaturan tampilan teks.
  ScoreText() : super(
          text: '0',
          textRenderer: TextPaint(
            style: TextStyle(
              color: Colors.grey.shade900,
              fontSize: 48,
            ),
          ),
        );

  // Mengatur posisi teks saat komponen dimuat.
  @override
  FutureOr<void> onLoad() {
    position = Vector2(
      (gameRef.size.x - size.x) / 2,
      gameRef.size.y - size.y - 50,
    );
  }

  // Memperbarui teks jika skor berubah.
  @override
  void update(double dt) {
    final newText = gameRef.score.toString();
    if (text != newText) {
      text = newText;
    }
  }
}

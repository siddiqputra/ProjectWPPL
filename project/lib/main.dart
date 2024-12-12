// Mengimpor paket Flame untuk pengembangan game.
import 'package:flame/game.dart';
// Mengimpor paket Material Design untuk membangun antarmuka pengguna.
import 'package:flutter/material.dart';
// Mengimpor file 'game.dart' yang berisi logika permainan.
import 'game.dart';

// Fungsi utama (entry point) aplikasi Flutter.
void main() {
  // Menjalankan aplikasi Flutter dengan widget MyApp sebagai root.
  runApp(const MyApp());
}

// Membuat kelas MyApp yang merupakan root dari aplikasi.
// Kelas ini menggunakan StatelessWidget karena tidak memiliki state yang dapat berubah.
class MyApp extends StatelessWidget {
  // Konstruktor kelas MyApp, dengan parameter opsional `key`.
  const MyApp({super.key});

  // Metode build untuk membuat antarmuka pengguna aplikasi.
  @override
  Widget build(BuildContext context) {
    // Mengembalikan widget MaterialApp yang merupakan kerangka aplikasi Flutter.
    return MaterialApp(
      // Menyembunyikan banner debug di pojok kanan atas layar.
      debugShowCheckedModeBanner: false,
      // Menetapkan widget GameWidget sebagai halaman utama aplikasi.
      home: GameWidget(
        // Menginisialisasi game dengan instance dari kelas FlappyBirdGame.
        game: FlappyBirdGame(),
      ),
    );
  }
}

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
    return const MaterialApp(
      // Menyembunyikan banner debug di pojok kanan atas layar.
      debugShowCheckedModeBanner: false,
      // Menetapkan widget StartScreen sebagai halaman utama aplikasi.
      home: StartScreen(),
    );
  }
}

// Membuat layar start dengan tombol "Start".
class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background GIF
          Positioned.fill(
            child: Image.asset(
              '/images/FB.gif', // Path GIF Anda
              fit: BoxFit.cover, // Sesuaikan ukuran GIF dengan layar
            ),
          ),
          // Konten di atas background
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Flappy Bird Game",
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const Text(
                  "By: Kelompok 5",
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(
                    height: 20), // Memberikan jarak antara judul dan tombol
                TextButton(
                  onPressed: () {
                    // Navigasi ke layar game ketika tombol ditekan.
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => GameWidget(
                          // Menginisialisasi game dengan instance dari kelas FlappyBirdGame.
                          game: FlappyBirdGame(),
                        ),
                      ),
                    );
                  },
                  style: TextButton.styleFrom(
                    // Warna teks tombol
                    foregroundColor: Colors.lightGreenAccent,

                    // Padding di dalam tombol, menentukan jarak horizontal dan vertikal teks
                    padding: const EdgeInsets.symmetric(
                        horizontal: 40, vertical: 20),

                    // Gaya teks tombol, seperti ukuran font
                    textStyle: const TextStyle(fontSize: 24),

                    // Warna latar belakang tombol
                    backgroundColor: Colors.black,

                    // Bentuk tombol dengan sudut membulat
                    shape: RoundedRectangleBorder(
                      // Radius untuk sudut tombol (membulatkan sudut)
                      borderRadius: BorderRadius.circular(50),

                      // Gaya garis tepi tombol, termasuk warna dan lebar garis
                      side: const BorderSide(
                          color: Colors.lightGreenAccent, width: 2),
                    ),
                  ),
                  child: const Text("Start"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

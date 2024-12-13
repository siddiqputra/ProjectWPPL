import 'dart:async';
import 'package:flame/components.dart';

class Background extends SpriteComponent {
//init posisi dan ukuran latar belakang
  Background(Vector2 size) : super(size: size, position: Vector2(0, 0));

  @override
  Future<void> onLoad() async {
    //memuat gambar sprite latar belakang
    sprite = await Sprite.load('background.png');
  }
}

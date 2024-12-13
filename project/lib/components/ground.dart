import 'dart:async';
import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:project/constants.dart';
import '../game.dart';

class Ground extends SpriteComponent
    with HasGameRef<FlappyBirdGame>, CollisionCallbacks {
  //inisiasi posisi dan ukuran background
  Ground() : super();

  /*

  MEMUAT

  */

  @override
  Future<void> onLoad() async {
    //Memuat sprite gambar background
    size = Vector2(2 * gameRef.size.x, groundHeight);
    position = Vector2(0, gameRef.size.y - groundHeight);

    //memuat gambar sprite tanah
    sprite = await Sprite.load('ground.png');

    //tambahkan kotak tabrakan
    add(RectangleHitbox());
  }

  /*
  
  UPDATE

  */

  @override
  void update(double dt) {
    //pindah tanah ke kiri
    position.x -= groundScrollingSpeed * dt;

    //resert ground jika keluar dari layar untuk scroll tak terbatas
    //jika setengahnya telah dilewati
    if (position.x + size.x / 2 <= 0) {
      position.x = 0;
    }
  }
}

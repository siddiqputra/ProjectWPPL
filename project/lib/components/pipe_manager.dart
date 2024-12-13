import 'dart:math';
import 'pipe.dart';
import 'package:flame/components.dart';
import 'package:project/constants.dart';
import 'package:project/game.dart';

class PipeManager extends Component with HasGameRef<FlappyBirdGame> {
  /*

  UPDATE -> every second (dt)

  Kami akan terus menelurkan pipa-pipa baru.

  */

  double pipeSpawnTimer = 0;

  @override
  void update(double dt) {
   //buat pipa baru pada interval tertentu
    pipeSpawnTimer += dt;

    if (pipeSpawnTimer > pipeInterval) {
      pipeSpawnTimer = 0;
      spawnPipe();
    }
  }

  /*

 MEMBUAT PIPA BARU

  */

  void spawnPipe() {
    final double screenHeight = gameRef.size.y;

    /*

    HITUNG TINGGI PIPA

    */

    //ketinggian maksimum
    final double maxPipeHeight =
        screenHeight - groundHeight - pipeGap - minPipeHeight;

    // tinggi pipa bawah -> pilih secara acak antara min dan maks
    final double bottomPipeHeight =
        minPipeHeight + Random().nextDouble() * (maxPipeHeight - minPipeHeight);

    // tinggi pipa atas
    final double topPipeHeight =
        screenHeight - groundHeight - bottomPipeHeight - pipeGap;

    /*

    CREATE BOTTOM PIPE

    */

    final bottomPIPE = Pipe(
      // position
      Vector2(gameRef.size.x, screenHeight - groundHeight - bottomPipeHeight),
      // size
      Vector2(pipeWidth, bottomPipeHeight),
      isTopPipe: false,
    );

    /*

    CREATE TOP PIPE

    */

    final topPIPE = Pipe(
      // position
      Vector2(gameRef.size.x, 0),
      // size
      Vector2(pipeWidth, topPipeHeight),
      isTopPipe: true,
    );

    // add both pipes to the game
    gameRef.add(bottomPIPE);
    gameRef.add(topPIPE);
  }
}

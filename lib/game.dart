library game;

import 'dart:html';
import 'dart:math';
import 'util.dart';

part 'game/level.dart';
part 'game/player.dart';
part 'game/renderer.dart';
part 'game/target.dart';

class Game
{
  int keyPressed = 0;
  int startLevel = 1;

  bool   playing;
  String nickname;

  Level    level;
  Player   player;
  Renderer renderer;

  Game(this.startLevel, this.nickname) : renderer = new Renderer();

  void start()
  {
    document.onKeyDown.listen(handleKey);
    document.onKeyUp.listen(handleKey);

    this.level   = new Level(this, this.startLevel);
    this.player  = new Player(this, this.nickname);
    this.playing = true;

    level.start();
    renderer.start(this);

    window.requestAnimationFrame(loop);
  }

  void stop()
  {
    this.playing = false;

    window.dispatchEvent(new CustomEvent('gameOver', detail: player.score));
  }

  void loop(double loopTime)
  {
    if (!this.playing) {
      return;
    }

    renderer.update();
    window.requestAnimationFrame(loop);
  }

  void handleKey(KeyboardEvent event)
  {
    if ('keyup' == event.type) {
      keyPressed = 0;
      return;
    }

    if (keyPressed == event.keyCode) {
      return;
    }

    level.hitTarget(renderer.layer, event.keyCode);
  }
}

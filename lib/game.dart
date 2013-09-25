library game;

import 'dart:html';
import 'util.dart';

part 'game/level.dart';
part 'game/renderer.dart';

class Game
{
  int keyPressed = 0;

  int loopFrames = 0;
  double loopLastTime;
  double loopCurrent = 0.0;
  int loopFps = 0;

  Level level;
  Renderer renderer;

  Game() : renderer = new Renderer()
  {
    print('Game::construct');
  }

  void start()
  {
    print('Game::start');

    level = new Level(this);

    level.start();
    renderer.start(this);

    window.requestAnimationFrame(loop);
  }

  void loop(double loopTime)
  {
    if (loopLastTime == null) {
      loopLastTime = loopTime;
    }

    renderer.update();

    double delta = loopTime - loopLastTime;
    loopLastTime = loopTime;

    loopCurrent += delta;
    loopFrames++;

    if (loopCurrent > 1000) {
      loopFps = (1000 * loopFrames / loopCurrent).toInt();
      loopCurrent = 0.0;
      loopFrames = 0;
    }

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

    keyPressed = event.keyCode;
    print('Game::handleKey ${event.keyCode}');
  }
}

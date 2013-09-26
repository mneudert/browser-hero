library game;

import 'dart:html';
import 'dart:math';
import 'util.dart';

part 'game/fps.dart';
part 'game/level.dart';
part 'game/renderer.dart';

class Game
{
  int keyPressed = 0;

  Fps fps;
  Level level;
  Renderer renderer;

  Game() : renderer = new Renderer()
  {
    print('Game::construct');
  }

  void start()
  {
    print('Game::start');

    fps   = new Fps(this);
    level = new Level(this);

    level.start();
    renderer.start(this);

    window.requestAnimationFrame(loop);
  }

  void loop(double loopTime)
  {
    fps.update(loopTime);
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

    keyPressed = event.keyCode;
    print('Game::handleKey ${event.keyCode}');
  }
}

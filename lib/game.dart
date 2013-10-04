library game;

import 'dart:html';
import 'dart:math';
import 'util.dart';

part 'game/fps.dart';
part 'game/level.dart';
part 'game/renderer.dart';
part 'game/score.dart';
part 'game/target.dart';

class Game
{
  int keyPressed  = 0;
  String nickname = '';

  Fps fps;
  Level level;
  Renderer renderer;
  Score score;

  Game(this.nickname) : renderer = new Renderer();

  void start()
  {
    print('Starting game for: ${nickname}');

    document.onKeyDown.listen(handleKey);
    document.onKeyUp.listen(handleKey);

    fps   = new Fps(this);
    level = new Level(this);
    score = new Score(this);

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

    level.hitTarget(renderer.layer, event.keyCode);
  }
}

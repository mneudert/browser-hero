library game;

import 'dart:html';

class Game
{
  int keyPressed = 0;

  Game()
  {
    print('Game::construct');
  }

  void start()
  {
    print('Game::start');
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

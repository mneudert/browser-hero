library browser_hero.elements.game;

import 'dart:html';
import 'package:polymer/polymer.dart';
import 'package:browser_hero/game.dart';

@CustomTag('hero-game')
class HeroGame extends PolymerElement {
  int levelMax     = 0;
  int levelStart   = 1;
  int playerHealth = 32;
  int playerLifes  = 4;

  @observable String nickname = '';

  HeroGame.created() : super.created() {
    window.console.debug('HeroGame.created()');
  }

  void attached() {
    Game game = new Game(
        this.levelStart, this.levelMax,
        this.playerHealth, this.playerLifes,
        this.nickname
    );

    game.start();
  }
}

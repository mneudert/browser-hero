library browser_hero.elements.game;

import 'dart:html';
import 'package:polymer/polymer.dart';
import 'package:browser_hero/game.dart';

@CustomTag('hero-game')
class HeroGame extends PolymerElement {
  int startLevel = 1;

  @observable String nickname = '';

  HeroGame.created() : super.created() {
    window.console.debug('HeroGame.created()');
  }

  void attached() {
    Game game = new Game(this.startLevel, this.nickname);
    game.start();
  }
}

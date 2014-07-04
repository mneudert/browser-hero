library browser_hero.elements.game_over;

import 'dart:html';
import 'package:polymer/polymer.dart';

@CustomTag('hero-game-over')
class HeroGameOver extends PolymerElement {
  bool get applyAuthorStyles => true;

  @observable int score;

  HeroGameOver.created() : super.created() {
    window.console.debug('HeroGameOver.created()');
  }
}

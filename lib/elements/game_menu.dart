library browser_hero.elements.game_menu;

import 'dart:html';
import 'package:polymer/polymer.dart';

@CustomTag('hero-game-menu')
class HeroGameMenu extends PolymerElement {
  bool get applyAuthorStyles => true;

  @observable String level = window.localStorage['game-level'];

  HeroGameMenu.created() : super.created() {
    window.console.debug('HeroGameMenu.created()');
  }

  void gameStart(Event e) {
    e.preventDefault();

    try {
      if (1 > int.parse(level)) {
        return;
      }
    } on FormatException {
      return;
    }

    window.localStorage['game-level'] = level;

    dispatchEvent(new CustomEvent('gameStart', detail: int.parse(level)));
  }
}

library browser_hero.elements.game_menu;

import 'dart:html';
import 'package:polymer/polymer.dart';

@CustomTag('hero-game-menu')
class HeroGameMenu extends PolymerElement {
  bool get applyAuthorStyles => true;

  @observable String startLevel = '1';
  @observable String maxLevel   = '0';

  HeroGameMenu.created() : super.created() {
    window.console.debug('HeroGameMenu.created()');

    if (null != window.localStorage['game-start-level']) {
      this.startLevel = window.localStorage['game-start-level'];
    }

    if (null != window.localStorage['game-max-level']) {
      this.maxLevel = window.localStorage['game-max-level'];
    }
  }

  void gameStart(Event e) {
    e.preventDefault();

    var startLevel = int.parse(this.startLevel);
    var maxLevel   = int.parse(this.maxLevel);

    if (1 > startLevel) {
      return;
    }

    if (maxLevel < startLevel) {
      maxLevel      = 0;
      this.maxLevel = '0';
    }

    window.localStorage['game-start-level'] = this.startLevel;
    window.localStorage['game-max-level']   = this.maxLevel;

    Map<String, int> settings = {
      'startLevel': startLevel,
      'maxLevel':   maxLevel
    };

    dispatchEvent(new CustomEvent('gameStart', detail: settings));
  }
}

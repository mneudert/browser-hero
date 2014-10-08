library browser_hero.elements.game_menu;

import 'dart:html';
import 'package:polymer/polymer.dart';

@CustomTag('hero-game-menu')
class HeroGameMenu extends PolymerElement {
  bool get applyAuthorStyles => true;

  @observable String levelMax     = '0';
  @observable String levelStart   = '1';
  @observable String playerHealth = '32';
  @observable String playerLifes  = '4';

  HeroGameMenu.created() : super.created() {
    window.console.debug('HeroGameMenu.created()');

    if (null != window.localStorage['levelMax']) {
      this.levelMax = window.localStorage['levelMax'];
    }

    if (null != window.localStorage['levelStart']) {
      this.levelStart = window.localStorage['levelStart'];
    }

    if (null != window.localStorage['playerHealth']) {
      this.playerHealth = window.localStorage['playerHealth'];
    }

    if (null != window.localStorage['playerLifes']) {
      this.playerLifes = window.localStorage['playerLifes'];
    }
  }

  void gameStart(Event e) {
    e.preventDefault();

    var levelMax     = int.parse(this.levelMax);
    var levelStart   = int.parse(this.levelStart);
    var playerHealth = int.parse(this.playerHealth);
    var playerLifes  = int.parse(this.playerLifes);

    if (1 > levelStart || 1 > playerHealth || 1 > playerLifes) {
      return;
    }

    if (levelMax < levelStart) {
      levelMax      = 0;
      this.levelMax = '0';
    }

    window.localStorage['levelMax']     = this.levelMax;
    window.localStorage['levelStart']   = this.levelStart;
    window.localStorage['playerHealth'] = this.playerHealth;
    window.localStorage['playerLifes']  = this.playerLifes;

    Map<String, int> settings = {
      'levelStart':   levelStart,
      'levelMax':     levelMax,
      'playerHealth': playerHealth,
      'playerLifes':  playerLifes
    };

    dispatchEvent(new CustomEvent('gameStart', detail: settings));
  }
}

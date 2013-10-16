library element_login;

import 'dart:html';
import 'package:polymer/polymer.dart';

@CustomTag("hero-game-menu")
class GameMenuElement extends PolymerElement with ObservableMixin {
  bool get applyAuthorStyles => true;

  @observable String level = window.localStorage['game-level'];

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

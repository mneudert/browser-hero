library element_game_header;

import 'dart:html';
import 'package:polymer/polymer.dart';

@CustomTag("hero-game-header")
class GameHeaderElement extends PolymerElement with ObservableMixin {
  @observable String nickname = '';

  bool get applyAuthorStyles => true;

  void logout() {
    dispatchEvent(new CustomEvent('logout'));
  }
}

library element_game;

import 'package:polymer/polymer.dart';
import '../../lib/game.dart';

@CustomTag("hero-game")
class GameElement extends PolymerElement {
  String nickname = '';

  void inserted() {
    Game game = new Game(this.nickname);
    game.start();
  }
}

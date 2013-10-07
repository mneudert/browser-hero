library element_game;

import 'package:polymer/polymer.dart';
import '../../lib/game.dart';

@CustomTag("hero-game")
class GameElement extends PolymerElement {
  int level = 1;

  void inserted() {
    Game game = new Game(this.level);
    game.start();
  }
}

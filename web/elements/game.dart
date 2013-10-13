library element_game;

import 'package:polymer/polymer.dart';
import '../../lib/game.dart';

@CustomTag("hero-game")
class GameElement extends PolymerElement {
  String nickname;

  int startLevel = 1;

  void inserted() {
    Game game = new Game(this.startLevel, this.nickname);

    game.start();
  }
}

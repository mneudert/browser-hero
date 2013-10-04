library hero_game;

import 'package:polymer/polymer.dart';
import '../lib/game.dart';

@CustomTag("hero-game")
class HeroGame extends PolymerElement {
  void inserted() {
    Game game = new Game(dataset['nickname']);
    game.start();
  }
}

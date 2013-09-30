library hero_game;

import 'package:polymer/polymer.dart';
import '../lib/game.dart';

@CustomTag("hero-game")
class HeroGame extends PolymerElement {
  void created()
  {
    super.created();

    Game game = new Game();
    game.start();
  }
}

import 'dart:html';
import '../lib/game.dart';

main() {
  Game game = new Game();
  game.start();

  document.onKeyDown.listen(game.handleKey);
  document.onKeyUp.listen(game.handleKey);
}

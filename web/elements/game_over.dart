library element_login;

import 'package:polymer/polymer.dart';

@CustomTag("hero-game-over")
class GameOverElement extends PolymerElement with ObservableMixin {
  bool get applyAuthorStyles => true;

  @observable int score;
}

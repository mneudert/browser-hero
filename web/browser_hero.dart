import 'dart:html';
import 'package:polymer/polymer.dart';

main() {
  window.on['gameStart'].listen(handleGameStart);
  window.on['login'].listen(handleLogin);
  window.on['logout'].listen(handleLogout);

  query('hero-loader').remove();
  document.body.nodes.add(createElement('hero-login'));
}

void handleGameStart(CustomEvent e) {
  var gameHeader  = query('hero-game-header');
  var gameNode    = createElement('hero-game');
  var gameWrapper = new Element.div();

  gameNode.xtag.nickname   = gameHeader.xtag.nickname;
  gameNode.xtag.startLevel = e.detail;
  gameWrapper.id           = 'game-wrapper';

  gameWrapper.children.add(gameNode);

  query('hero-game-menu').remove();
  query('#game').insertBefore(gameWrapper, query('hero-game-footer'));
}

void handleLogin(CustomEvent e) {
  String nickname = e.detail;

  if (nickname.isEmpty) {
    return;
  }

  var wrapper = new Element.div();
  wrapper.id  = 'game';

  _constructGameArea(wrapper, nickname);

  query('hero-login').remove();
  document.body.nodes.add(wrapper);
}

void handleLogout(_) {
  query('#game').remove();
  document.body.nodes.add(createElement('hero-login'));
}

void _constructGameArea(Element wrapper, String nickname) {
  var gameHeader  = createElement('hero-game-header');
  var gameMenu    = createElement('hero-game-menu');
  var gameFooter  = createElement('hero-game-footer');

  gameHeader.xtag.nickname = nickname;

  wrapper.children.add(gameHeader);
  wrapper.children.add(gameMenu);
  wrapper.children.add(gameFooter);
}

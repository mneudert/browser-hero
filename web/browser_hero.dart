import 'dart:html';
import 'package:polymer/polymer.dart';

main() {
  window.on['login'].listen(handleLogin);
  window.on['logout'].listen(handleLogout);

  query('hero-loader').remove();
  document.body.nodes.add(createElement('hero-login'));
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
  var gameNode    = createElement('hero-game');
  var gameWrapper = new Element.div();
  var gameFooter  = createElement('hero-game-footer');

  gameHeader.xtag.nickname = nickname;
  gameNode.xtag.nickname   = nickname;
  gameWrapper.id           = 'game-wrapper';

  wrapper.children.add(gameHeader);
  wrapper.children.add(gameNode);
  wrapper.children.add(gameWrapper);
  wrapper.children.add(gameFooter);
}

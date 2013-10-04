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

  var gameHeader           = createElement('hero-game-header');
  gameHeader.xtag.nickname = nickname;

  var gameNode           = createElement('hero-game');
  gameNode.xtag.nickname = nickname;

  wrapper.children.add(gameHeader);
  wrapper.children.add(gameNode);

  query('hero-login').remove();
  document.body.nodes.add(wrapper);
}

void handleLogout(_) {
  query('#game').remove();
  document.body.nodes.add(createElement('hero-login'));
}

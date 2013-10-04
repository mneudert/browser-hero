import 'dart:html';
import 'package:polymer/polymer.dart';

main() {
  window.on['login'].listen(handleLogin);

  query('#loader').remove();
  document.body.nodes.add(createElement('hero-login'));
}

void handleLogin(CustomEvent e) {
  String nickname = e.detail;

  if (nickname.isEmpty) {
    return;
  }

  query('hero-login').remove();

  var gameNode                 = createElement('hero-game');
  gameNode.dataset['nickname'] = nickname;

  document.body.nodes.add(gameNode);
}
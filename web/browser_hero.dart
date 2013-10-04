import 'dart:html';
import 'package:polymer/polymer.dart';

main() {
  window.on['login'].listen(handleLogin);

  query('hero-loader').remove();
  document.body.nodes.add(createElement('hero-login'));
}

void handleLogin(CustomEvent e) {
  String nickname = e.detail;

  if (nickname.isEmpty) {
    return;
  }

  var gameNode                 = createElement('hero-game');
  gameNode.dataset['nickname'] = nickname;

  query('hero-login').remove();
  document.body.nodes.add(gameNode);
}
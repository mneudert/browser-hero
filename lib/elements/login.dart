library browser_hero.elements.login;

import 'dart:html';
import 'package:polymer/polymer.dart';

@CustomTag('hero-login')
class HeroLogin extends PolymerElement {
  bool get applyAuthorStyles => true;

  @observable String nickname = window.localStorage['nickname'];

  HeroLogin.created() : super.created() {
    window.console.debug('HeroLogin.created()');
  }

  void login(Event e) {
    e.preventDefault();

    if (nickname.isEmpty) {
      return;
    }

    window.localStorage['nickname'] = nickname;

    dispatchEvent(new CustomEvent('login', detail: nickname));
  }
}

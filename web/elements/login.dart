library element_login;

import 'dart:html';
import 'package:polymer/polymer.dart';

@CustomTag("hero-login")
class LoginElement extends PolymerElement with ObservableMixin {
  bool get applyAuthorStyles => true;

  @observable String nickname = window.localStorage['nickname'];

  void login(Event e) {
    e.preventDefault();

    if (nickname.isEmpty) {
      return;
    }

    window.localStorage['nickname'] = nickname;

    dispatchEvent(new CustomEvent('login', detail: nickname));
  }
}

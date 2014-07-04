library browser_hero.elements;

import 'dart:html';
import 'package:polymer/polymer.dart';

@CustomTag('hero-game-header')
class HeroGameHeader extends PolymerElement {
  bool get applyAuthorStyles => true;

  @observable String nickname = '';

  HeroGameHeader.created() : super.created() {
    window.console.debug('HeroGameHeader.created()');
  }

  void logout() {
    dispatchEvent(new CustomEvent('logout'));
  }
}

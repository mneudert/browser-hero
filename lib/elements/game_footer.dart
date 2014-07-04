library browser_hero.elements;

import 'dart:html';
import 'package:polymer/polymer.dart';

@CustomTag('hero-game-footer')
class HeroGameFooter extends PolymerElement {
  bool get applyAuthorStyles => true;

  HeroGameFooter.created() : super.created() {
    window.console.debug('HeroGameFooter.created()');
  }
}

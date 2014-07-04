library browser_hero.elements;

import 'dart:html';
import 'package:polymer/polymer.dart';

@CustomTag('hero-loader')
class HeroLoader extends PolymerElement {
  bool get applyAuthorStyles => true;

  HeroLoader.created() : super.created() {
    window.console.debug('HeroLoader.created()');
  }
}

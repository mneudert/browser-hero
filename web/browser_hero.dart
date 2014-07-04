library browser_hero.app;

import 'dart:html';
import 'package:polymer/polymer.dart';
import 'package:browser_hero/browser_hero.dart';

main() {
  initPolymer().run(() {
    BrowserHero browserHero = querySelector('browser-hero');
    browserHero.start();
  });
}
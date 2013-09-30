import 'dart:html';
import 'package:polymer/polymer.dart';

main() {
  query('#loader').remove();
  document.body.nodes.add(createElement('hero-game'));
}

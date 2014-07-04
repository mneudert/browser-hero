library browser_hero;

import 'dart:html';
import 'package:polymer/polymer.dart';

@CustomTag('browser-hero')
class BrowserHero extends PolymerElement {
  bool get applyAuthorStyles => true;

  BrowserHero.created() : super.created() {}

  void constructGameArea(Element wrapper, String nickname) {
    var gameHeader  = new Element.tag('hero-game-header');
    var gameMenu    = new Element.tag('hero-game-menu');
    var gameFooter  = new Element.tag('hero-game-footer');

    gameHeader.xtag.nickname = nickname;

    wrapper.children.add(gameHeader);
    wrapper.children.add(gameMenu);
    wrapper.children.add(gameFooter);
  }

  void handleGameOver(CustomEvent e) {
    window.console.debug('BrowserHero.handleGameOver()');

    var gameFooter = querySelector('hero-game-footer');
    var gameOver   = new Element.tag('hero-game-over');
    var gameMenu   = new Element.tag('hero-game-menu');

    gameOver.xtag.score = e.detail;

    querySelector('#game-wrapper').remove();
    querySelector('#game').insertBefore(gameOver, gameFooter);
    querySelector('#game').insertBefore(gameMenu, gameFooter);
  }

  void handleGameStart(CustomEvent e) {
    window.console.debug('BrowserHero.handleGameStart()');

    var gameFooter  = querySelector('hero-game-footer');
    var gameHeader  = querySelector('hero-game-header');
    var gameNode    = new Element.tag('hero-game');
    var gameWrapper = new Element.div();

    gameNode.xtag.nickname   = gameHeader.xtag.nickname;
    gameNode.xtag.startLevel = e.detail;
    gameWrapper.id           = 'game-wrapper';

    gameWrapper.children.add(gameNode);

    if (null != querySelector('hero-game-over')) {
      querySelector('hero-game-over').remove();
    }

    querySelector('hero-game-menu').remove();
    querySelector('#game').insertBefore(gameWrapper, gameFooter);
  }

  void handleLogin(CustomEvent e) {
    String nickname = e.detail;

    if (nickname.isEmpty) {
      return;
    }

    window.console.debug('BrowserHero.handleLogin( ${nickname} )');

    // initialize game area
    var wrapper = new Element.div();
    wrapper.id  = 'game';

    constructGameArea(wrapper, nickname);

    querySelector('hero-login').remove();
    querySelector('body').children.add(wrapper);
  }

  void handleLogout(CustomEvent e) {
    window.console.debug('BrowserHero.handleLogout()');

    querySelector('#game').remove();

    var login = new Element.tag('hero-login');
    querySelector('body').children.add(login);
  }

  void start() {
    window.console.debug('BrowserHero.started()');

    // initialize application
    querySelector('browser-hero').remove();

    HtmlElement loader = new Element.tag('hero-loader');
    querySelector('body').children.add(loader);

    // connect events
    window.on['gameOver'].listen(handleGameOver);
    window.on['gameStart'].listen(handleGameStart);
    window.on['login'].listen(handleLogin);
    window.on['logout'].listen(handleLogout);

    // display login
    querySelector('hero-loader').remove();

    HtmlElement login = new Element.tag('hero-login');
    querySelector('body').children.add(login);
  }
}

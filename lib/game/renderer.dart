part of browser_hero.game;

class Renderer {
  Game        game;
  RenderLayer layer;

  Renderer() {
    this.layer           = new RenderLayer();
    this.layer.canvas.id = 'game-layer';

    querySelector('#game-wrapper').children.add(this.layer.canvas);
  }

  void start(Game g) {
    this.game         = g;
    this.layer.width  = 800;
    this.layer.height = 36 + g.level.levelCurrent * 37;
  }

  void update() {
    this.layer.clear();

    this.game.level.draw(layer);
    this.game.player.draw(layer);
  }
}

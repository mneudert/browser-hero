part of game;

class Renderer
{
  Game game;
  RenderLayer layer;

  Renderer()
  {
    this.layer           = new RenderLayer();
    this.layer.canvas.id = 'game-layer';

    query('#game').children.add(this.layer.canvas);
  }

  void start(Game g)
  {
    this.game         = g;
    this.layer.width  = 800;
    this.layer.height = 36 + g.level.current * 37;
  }

  void update()
  {
    this.layer.clear();

    this.game.level.draw(layer);
    this.game.fps.draw(layer);
    this.game.score.draw(layer);
  }
}

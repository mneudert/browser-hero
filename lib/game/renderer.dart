part of game;

class Renderer
{
  Game game;
  RenderLayer layer;

  Renderer()
  {
    print('Renderer::construct');

    layer = new RenderLayer();
    layer.canvas.id = 'game';

    document.body.nodes.add(layer.canvas);
  }

  void start(Game g)
  {
    layer.width = 800;
    layer.height = 36 + g.level.current * 37;

    this.game = g;
  }

  void update()
  {
    layer.clear();

    game.level.draw(layer);
    game.fps.draw(layer);
    game.score.draw(layer);
  }
}

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
    layer.width = 640;
    layer.height = 40 + g.level.current * 41;

    this.game = g;
  }

  void update()
  {
    layer.clear();

    game.level.draw(layer);

    layer.ctx.font = '20px Georgia';
    layer.ctx.fillStyle = 'yellow';
    layer.ctx.textAlign = 'right';
    layer.ctx.fillText('FPS: ${game.loopFps}', 630, 25);

    layer.ctx.beginPath();
    layer.ctx.moveTo(0, 40);
    layer.ctx.lineTo(640, 40);
    layer.ctx.lineWidth = 1;
    layer.ctx.strokeStyle = 'grey';
    layer.ctx.stroke();
  }
}

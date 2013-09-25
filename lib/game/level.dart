part of game;

class Level
{
  Game game;

  int current = 0;

  Level(this.game);

  void start()
  {
    print('Level::start');

    current = 1;
  }

  void draw(RenderLayer layer)
  {
    layer.ctx.font = '20px Georgia';
    layer.ctx.fillStyle = 'yellow';
    layer.ctx.textAlign = 'left';
    layer.ctx.fillText('Level: ${current}', 10, 25);
  }
}

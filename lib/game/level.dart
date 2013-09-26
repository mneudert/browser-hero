part of game;

class Level
{
  Game game;

  int current = 0;

  Level(this.game);

  void start()
  {
    print('Level::start');

    current = 3;
  }

  void draw(RenderLayer layer)
  {
    layer.ctx.font      = '20px monospace';
    layer.ctx.fillStyle = 'rgb(229, 229, 76)';
    layer.ctx.textAlign = 'left';
    layer.ctx.fillText('Level: ${current}', 10, 25);

    layer.ctx.fillStyle = 'rgb(102, 229, 102)';
    layer.ctx.fillRect(180, 37, 120, 37 * current);

    for (int i = 0; i < current; i++) {
      int curX = 36 + 37 * i;

      layer.ctx.beginPath();
      layer.ctx.moveTo(0, curX);
      layer.ctx.lineTo(800, curX);
      layer.ctx.lineWidth = 1;
      layer.ctx.strokeStyle = 'rgb(190, 190, 190)';
      layer.ctx.stroke();
    }
  }
}

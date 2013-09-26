part of game;

class Fps
{
  double lasttime;
  double current = 0.0;
  int frames     = 0;
  int fps        = 0;

  Game game;

  Fps(this.game);

  void update(double looptime)
  {
    if (lasttime == null) {
      lasttime = looptime;
    }

    double delta = looptime - lasttime;

    lasttime  = looptime;
    current  += delta;

    frames++;

    if (current > 1000) {
      fps     = (1000 * frames / current).toInt();
      current = 0.0;
      frames  = 0;
    }
  }

  void draw(RenderLayer layer)
  {
    layer.ctx.font = '20px monospace';
    layer.ctx.fillStyle = 'rgb(229, 229, 76)';
    layer.ctx.textAlign = 'right';
    layer.ctx.fillText('FPS: ${fps}', 790, 25);
  }
}

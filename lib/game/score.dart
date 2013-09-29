part of game;

class Score
{
  int hits   = 0;
  int misses = 0;

  Game game;

  Score(this.game);

  void draw(RenderLayer layer)
  {
    layer.ctx.font = '20px monospace';
    layer.ctx.fillStyle = 'rgb(229, 229, 76)';
    layer.ctx.textAlign = 'left';

    layer.ctx.fillText('Hits: ${hits}', 190, 25);
    layer.ctx.fillText('Misses: ${misses}', 310, 25);
  }
}

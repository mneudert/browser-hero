part of game;

class Player
{
  String nickname;
  Game   game;

  int score  =  0;
  int lifes  =  4;
  int health = 32;

  Player(this.game, this.nickname);

  void draw(RenderLayer layer)
  {
    layer.ctx.font = '20px monospace';
    layer.ctx.fillStyle = 'rgb(229, 229, 76)';
    layer.ctx.textAlign = 'left';

    layer.ctx.fillText('Score: ${score}', 190, 25);
  }
}

part of browser_hero.game;

class Player {
  String nickname;
  Game   game;

  int score  =  0;
  int lifes  =  4;
  int health = 32;

  Player(this.game, this.nickname);

  void draw(RenderLayer layer) {
    layer.ctx.font      = '16px monospace';
    layer.ctx.fillStyle = 'rgb(229, 229, 76)';
    layer.ctx.textAlign = 'center';

    layer.ctx.fillText('[ ${this.nickname} ]', 125, 25);
    layer.ctx.fillText('Lifes: ${this.lifes}', 325, 25);
    layer.ctx.fillText('Health: ${this.health}', 475, 25);
    layer.ctx.fillText('Score: ${this.score}', 675, 25);
  }
}

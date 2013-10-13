part of game;

class Level
{
  Game game;

  int startLevel;
  int currentLevel;

  int  lastTarget;
  List targets;
  List targetTimes;

  Level(this.game, this.startLevel);

  void start()
  {
    this.currentLevel = this.startLevel;
    this.targets      = [];
    this.targetTimes  = [];
  }

  void draw(RenderLayer layer)
  {
    layer.height = 36 + this.currentLevel * 37;

    layer.ctx.font      = '20px monospace';
    layer.ctx.fillStyle = 'rgb(229, 229, 76)';
    layer.ctx.textAlign = 'left';
    layer.ctx.fillText('Level: ${this.currentLevel}', 10, 25);

    layer.ctx.fillStyle = 'rgba(102, 229, 102, 0.85)';
    layer.ctx.fillRect(180, 37, 120, 37 * this.currentLevel);

    for (int i = 0; i < this.currentLevel; i++) {
      int curX = 36 + 37 * i;

      layer.ctx.beginPath();
      layer.ctx.moveTo(0, curX);
      layer.ctx.lineTo(800, curX);
      layer.ctx.lineWidth = 1;
      layer.ctx.strokeStyle = 'rgb(190, 190, 190)';
      layer.ctx.stroke();
    }

    createTargets(layer);
    drawTargets(layer);

    scoreTargets();
  }

  void createTargets(RenderLayer layer)
  {
    int now = new DateTime.now().millisecondsSinceEpoch ~/ 1000;

    if (null == lastTarget) {
      lastTarget       = now;
      this.targetTimes = [];
    }

    if (this.targetTimes.length < this.currentLevel) {
      for (int i = this.targetTimes.length; i < currentLevel; i++) {
        this.targetTimes.add(now);
      }
    }

    if (lastTarget == now) {
      return;
    }

    lastTarget = now;

    for (int i = 0; i < this.currentLevel; i++) {
      int delta = now - this.targetTimes[i];

      if (0 > delta) {
        continue;
      }

      int seed = new Random().nextInt(7 - delta);

      if (0 < seed) {
        continue;
      }

      this.targetTimes[i] = now;
      this.targets.add(new Target(i + 1));
    }
  }

  void drawTargets(RenderLayer layer)
  {
    List destructables = [];
    int now            = new DateTime.now().millisecondsSinceEpoch;

    for (var target in this.targets) {
      target.moveAndDraw(layer, now);

      if (target.outOfBounds()) {
        destructables.add(target);
      }
    }

    for (var destructable in destructables) {
      targets.remove(destructable);
    }
  }

  void scoreTargets()
  {
    for (var target in this.targets) {
      if (target.scored) {
        continue;
      }

      if (target.targetHit) {
        target.scored = true;

        this.game.player.score++;
      }

      if (!target.targetHit && 180 > target.position) {
        target.scored = true;

        this.game.player.health++;
      }
    }

    this.currentLevel = this.startLevel + (this.game.player.score ~/ 64);
  }

  void hitTarget(RenderLayer layer, int hitCode)
  {
    for (var target in this.targets) {
      if (target.tryHit(hitCode)) {
        return;
      }
    }
  }
}

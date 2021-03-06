part of browser_hero.game;

class Level {
  Game game;

  int levelCurrent;
  int levelMax;
  int levelStart;

  int  lastTarget;
  List targets;
  List targetTimes;

  int  hitBoxLeft  = 125;
  int  hitBoxRight = 275;

  Level(this.game, this.levelStart, this.levelMax);

  void start() {
    this.levelCurrent = this.levelStart;
    this.targets      = [];
    this.targetTimes  = [];
  }

  void draw(RenderLayer layer) {
    layer.height = 36 + this.levelCurrent * 37;

    layer.ctx.fillStyle = 'rgba(102, 229, 102, 0.85)';
    layer.ctx.fillRect(
      this.hitBoxLeft, 37,
      this.hitBoxRight - this.hitBoxLeft, 37 * this.levelCurrent
    );

    for (int i = 0; i < this.levelCurrent; i++) {
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

  void createTargets(RenderLayer layer) {
    int now = new DateTime.now().millisecondsSinceEpoch ~/ 1000;

    if (null == lastTarget) {
      lastTarget       = now;
      this.targetTimes = [];
    }

    if (this.targetTimes.length < this.levelCurrent) {
      for (int i = this.targetTimes.length; i < this.levelCurrent; i++) {
        this.targetTimes.add(now);
      }
    }

    if (lastTarget == now) {
      return;
    }

    lastTarget = now;

    for (int i = 0; i < this.levelCurrent; i++) {
      int delta = now - this.targetTimes[i];

      if (0 > delta) {
        continue;
      }

      int seed = new Random().nextInt(7 - delta);

      if (0 < seed) {
        continue;
      }

      this.targetTimes[i] = now;
      this.targets.add(new Target(this, i + 1));
    }
  }

  void drawTargets(RenderLayer layer) {
    List destructables = [];
    int now            = new DateTime.now().millisecondsSinceEpoch;

    for (var target in this.targets) {
      target.moveAndDraw(layer, now);

      if (target.outOfBounds()) {
        destructables.add(target);
      }
    }

    for (var destructable in destructables) {
      this.targets.remove(destructable);
    }
  }

  void scoreTargets() {
    for (var target in this.targets) {
      if (target.scored) {
        continue;
      }

      if (target.targetHit) {
        target.scored = true;

        this.game.player.score++;
      }

      if (!target.targetHit && this.hitBoxLeft > target.position) {
        target.scored = true;

        this.game.player.health--;
      }
    }

    if (1 > this.game.player.health) {
      this.game.player.lifes--;

      this.game.player.health = 32;
      this.targets            = [];
    }

    if (1 > this.game.player.lifes) {
      this.game.stop();
    }

    this.levelCurrent = this.levelStart + (this.game.player.score ~/ 64);

    if (0 < this.levelMax && this.levelCurrent > this.levelMax) {
      this.levelCurrent = this.levelMax;
    }
  }

  void hitTarget(RenderLayer layer, int hitCode) {
    for (var target in this.targets) {
      if (target.tryHit(hitCode)) {
        return;
      }
    }
  }
}

part of game;

class Level
{
  Game game;

  int current;

  int lastTarget;
  List targets;
  List targetTimes;

  Level(this.game);

  void start()
  {
    print('Level::start');

    current     = 1;
    targets     = [];
    targetTimes = [];
  }

  void draw(RenderLayer layer)
  {
    layer.height = 36 + current * 37;

    layer.ctx.font      = '20px monospace';
    layer.ctx.fillStyle = 'rgb(229, 229, 76)';
    layer.ctx.textAlign = 'left';
    layer.ctx.fillText('Level: ${current}', 10, 25);

    layer.ctx.fillStyle = 'rgba(102, 229, 102, 0.85)';
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

    createTargets(layer);
    drawTargets(layer);

    scoreTargets();
  }

  void createTargets(RenderLayer layer)
  {
    int now = (new DateTime.now().millisecondsSinceEpoch / 1000).toInt();

    if (null == lastTarget) {
      lastTarget  = now;
      targetTimes = [];
    }

    if (targetTimes.length < current) {
      for (int i = targetTimes.length; i < current; i++) {
        targetTimes.add(now);
      }
    }

    if (lastTarget == now) {
      return;
    }

    lastTarget = now;

    for (int i = 0; i < current; i++) {
      int delta = now - targetTimes[i];

      if (0 > delta) {
        continue;
      }

      int seed = new Random().nextInt(10 - delta);

      if (0 < seed) {
        continue;
      }

      targetTimes[i] = now;
      targets.add(new Target(i + 1));
    }
  }

  void drawTargets(RenderLayer layer)
  {
    List destructables = [];
    int now            = new DateTime.now().millisecondsSinceEpoch;

    for (var target in targets) {
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
    for (var target in targets) {
      if (target.scored) {
        continue;
      }

      if (target.targetHit) {
        target.scored = true;

        game.score.hits++;
      }

      if (!target.targetHit && 180 > target.position) {
        target.scored = true;

        game.score.misses++;
      }
    }

    current = 1 + (game.score.hits / 10).toInt();
  }

  void hitTarget(RenderLayer layer, int hitCode)
  {
    for (var target in targets) {
      if (target.tryHit(hitCode)) {
        return;
      }
    }
  }
}

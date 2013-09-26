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

    current     = 3;
    targets     = [];
    targetTimes = [];
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

    drawTargets(layer);
  }

  void drawTargets(RenderLayer layer)
  {
    int now = (new DateTime.now().millisecondsSinceEpoch / 1000).toInt();

    if (null == lastTarget) {
      lastTarget  = now;
      targetTimes = [];

      for (int i = 0; i < current; i++) {
        targetTimes.add(now);
      }

      return;
    }

    if (lastTarget == now) {
      return;
    }

    lastTarget = now;

    for (int i = 0; i < current; i++) {
      int seed = new Random().nextInt(32 - (now - targetTimes[i]));

      if (0 < seed) {
        continue;
      }

      targetTimes[i] = now;

      print('new target level ${i}: ${targetTimes[i]}');
    }
  }
}

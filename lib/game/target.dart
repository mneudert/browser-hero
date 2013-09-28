part of game;

class Target
{
  int position   = 800;
  bool targetHit = false;

  int level;
  int startTime;
  int targetCode;
  int targetSize;
  String targetChar;

  Target(this.level)
  {
    // target char is lowercase ascii letter
    targetCode = 97 + new Random().nextInt(25);
    targetChar = new String.fromCharCode(targetCode);
  }

  void moveAndDraw(RenderLayer layer, int handleTime)
  {
    if (null == startTime) {
      startTime = handleTime;
    }

    int moveTime = handleTime - startTime;
    position     = 800 - (moveTime / 10).toInt();

    layer.ctx.font = '20px monospace bold';
    layer.ctx.fillStyle = getFillStyle(layer);
    layer.ctx.textAlign = 'center';
    layer.ctx.fillText(targetChar, position, 23 + 37 * level);
  }

  String getFillStyle(RenderLayer layer)
  {
    if (null == targetSize) {
      targetSize = layer.ctx.measureText(targetChar).width.toInt();
    }

    if (isIncoming(layer)) {
      return 'rgb(250, 250, 250)';
    }

    if (!targetHit && !isAway(layer)) {
      return 'rgb(250, 250, 250)';
    }

    if (targetHit) {
      return 'rgb(0, 250, 0)';
    } else {
      return 'rgb(250, 0, 0)';
    }
  }

  bool isAway(RenderLayer layer)
  {
    return position < 180 - targetSize;
  }

  bool isIncoming(RenderLayer layer)
  {
    return position > 300;
  }

  bool outOfBounds()
  {
    return -25 > position;
  }
}

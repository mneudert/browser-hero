part of browser_hero.game;

class Target
{
  int  position  = 800;
  bool scored    = false;
  bool allowHit  = false;
  bool targetHit = false;

  Level level;
  int   startTime;

  int    targetRow;
  int    targetCode;
  int    targetSize;
  String targetChar;

  Target(this.level, this.targetRow)
  {
    // lowercase ascii letter
    // with uppercase keycode
    targetCode = 65 + new Random().nextInt(25);
    targetChar = new String.fromCharCode(32 + targetCode);
  }

  void moveAndDraw(RenderLayer layer, int handleTime)
  {
    if (null == startTime) {
      startTime = handleTime;
    }

    int moveTime = handleTime - startTime;

    position = 800 - (moveTime ~/ 7);
    allowHit = (this.level.hitBoxLeft <= position
                && position <= this.level.hitBoxRight);

    layer.ctx.font      = '20px monospace bold';
    layer.ctx.fillStyle = getFillStyle(layer);
    layer.ctx.textAlign = 'center';
    layer.ctx.fillText(targetChar, position, 23 + 37 * this.targetRow);
  }

  String getFillStyle(RenderLayer layer)
  {
    if (null == targetSize) {
      targetSize = layer.ctx.measureText(targetChar).width.toInt();
    }

    if (!targetHit && this.level.hitBoxLeft <= position) {
      return 'rgb(250, 250, 250)';
    }

    if (!targetHit) {
      return 'rgb(250, 0, 0)';
    } else {
      return 'rgb(0, 250, 0)';
    }
  }

  bool outOfBounds()
  {
    return -25 > position;
  }

  bool tryHit(int hitCode)
  {
    if (!allowHit || targetHit || targetCode != hitCode) {
      // never hit twice
      return false;
    }

    allowHit  = false;
    targetHit = true;

    return true;
  }
}

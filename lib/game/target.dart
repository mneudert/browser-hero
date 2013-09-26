part of game;

class Target
{
  int position = 800;

  int level;
  int startTime;
  int targetCode;
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
    layer.ctx.fillStyle = 'rgb(250, 250, 250)';
    layer.ctx.textAlign = 'center';
    layer.ctx.fillText(targetChar, position, 23 + 37 * level);
  }

  bool outOfBounds()
  {
    return -25 > position;
  }
}

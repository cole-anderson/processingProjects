/*
  Represents "aliens"
 */
class ErrorSnippets extends BaseModel {
  //int x;
  //int y;
  int life = 3;
  String txt;

  ErrorSnippets(int xpos, int ypos, String tx) {
    x = xpos;
    y = ypos;
    txt = tx;
  }

  void drawSprite(int xpos, int ypos) {
    textSize(15);
    text(txt, xpos, ypos);
    //text("no", xpos, ypos);
  }
  void updateObj() {
    if (frameCount%30 == 0) {
      //x += 5;
      x += direction * 35;
    }

    if (errorMove == true) {
      //println("test" + y);
      y += gridsize / 2;
    }
  }

  boolean alive() {
    for (int i = 0; i < codeSnippets.size(); i++) {
      CodeProjectile CodeProjectile = (CodeProjectile) codeSnippets.get(i);

      if (CodeProjectile.x > x && CodeProjectile.x < x + 7 * pixelsize + 5 && CodeProjectile.y > y && CodeProjectile.y < y + 5 * pixelsize) {
        codeSnippets.remove(i);

        life--;
        nextColor = color(255, 0, 0);

        if (life == 0) {
          score += 50;
          return false;
        }

        break;
      }
    }

    return true;
  }

  boolean outside() {
    return x + (direction*gridsize) < 0 || x + (direction*gridsize) > width - gridsize;
  }
};

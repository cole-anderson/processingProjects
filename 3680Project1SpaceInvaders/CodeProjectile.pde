/* 
 CodeProjectTile:
 -Allows user to switch between different projectiles that represent the
 solution to different errors
 1) ; (classic missing semicolon)
 2) null (nullpointer exception)
 3) time (segmentationfault)
 4) #include (undefined reference)
 */
class CodeProjectile {

  int y, type;
  float x;
  /*
    Constructor for obj
   */
  CodeProjectile(float xpos, int ypos, int nType) {
    x = xpos;
    y = ypos;
    type = nType;
  }
  /*
    Updates the projectile based on user input
   */
  void draw() {
    fill(255);
    if (type == 0)
    {
      //; projectile
      textAlign(CENTER);
      text(";", x, y);
    } else if (type == 1)
    {
      //null projectile
      textAlign(CENTER);
      text("null", x, y);
    } else if (type == 2)
    {
      //time projectile
      textAlign(CENTER);
      text("time", x, y);
    } else if (type == 3)
    {
      //include projectile
      textAlign(CENTER);
      text("include", x, y);
    }
    y -= pixelsize * 5;
  }
};

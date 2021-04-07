/*
  Represents "player"
 */
class User extends BaseModel {
  boolean canShoot = true;
  int shootdelay = 0;
  int type = 0;
  String tVal = ";";
  int inc = 0;

  User() {
    x = width/gridsize/2;
    y = height - (10 * pixelsize); 
    text(tVal, 10, 10);
  }
  void draw(int xx, int ff, int sw, int ypos)
  {
   drawSprite(xx, ff, sw, ypos);
   updateObj(xx, ff, sw);
   //println(xx);
  }

  void drawSprite(int x, int f, int s, int ypos) {
    
    //Remaps joystick to 1080p screen)
    float xpos = map(x, 0, 511, 0, 1920); 
    
    //Cute little upside down triangle with projectile as text in middle
    fill(100);
    triangle(xpos, ypos+20, xpos+20, ypos-20, xpos-20, ypos-20);
    fill(200);
    textAlign(CENTER);
    textSize(15);
    text(tVal, xpos, ypos);
  }

  void updateObj(int xStick, int shoot, int swap) {
    
    float xpos = map(xStick, 0, 511, 0, 1920); 
    /*
      Following if,else combo allows for a button press to change
      projectiles. But buttons are 0 or 1 so 1 just increments through the possible 
      projectiles and wraps around
    */
    if(swap == 1 && inc<3)
    {
       inc++;
       delay(300);
       swap = 0;
    }
    else if(swap == 1 && inc==3)
    {
      inc = 0;
    }
    
    //FIRE SHOTS
    if (shoot == 1 && canShoot) {
      codeSnippets.add(new CodeProjectile(xpos, 1070, type));
      canShoot = false;
      shootdelay = 0;
    }
    /*
      Determines/Sets Projectile
     */
    if (inc == 0 )
    {
      //;
      type = 0;
      tVal = ";";
    }
    if (inc == 1 )
    {
      //null
      type = 1;
      tVal = "null";
    }
    if (inc ==2 )
    {
      //time
      type = 2;
      tVal = "time";
    }
    if (inc ==3 )
    {
      //#include
      type = 3;
      tVal = "#include";
    }
    

    //if (keyPressed && keyCode == CONTROL && canShoot) {
    //  codeSnippets.add(new CodeProjectile(xStick, y, type));
    //  canShoot = false;
    //  shootdelay = 0;
    //}
    ///*
    //  Determines/Sets Projectile
    // */
    //if (keyPressed && key == '0' )
    //{
    //  //;
    //  type = 0;
    //  tVal = ";";
    //}
    //if (keyPressed && key == '1' )
    //{
    //  //null
    //  type = 1;
    //  tVal = "null";
    //}
    //if (keyPressed && key == '2' )
    //{
    //  //time
    //  type = 2;
    //  tVal = "time";
    //}
    //if (keyPressed && key == '3' )
    //{
    //  //#include
    //  type = 3;
    //  tVal = "#include";
    //}

    shootdelay++;
    if (shootdelay >= 20) {
      canShoot = true;
    }
  }
};

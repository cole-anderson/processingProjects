//COLE PROJECT 3
// Pokemon: SPAM THE A BUTTON
/*
  The following is a game of which while inspired by pokemon
  is technically just a basic text interaction with Pokemon
  assets of which are based on SUPERSTITION.
  The game does not actually follow the proper path of the real
  games of ruby,sapphire or emerald but are instead locations of which
  were easiest to stitch together cohesively.
*/

//--------------------------------------------------------------------------------------------------------------------------------------
//Background, Under, Character
PImage back;
PImage under;
PImage me;
PImage pokestart;

PImage poke1;
PImage poke2;
PImage poke3;
PImage poke4;

//PImage pokeball;

//Starting Location(Town1):
int x = 156;
int y = 160;
//Key Defaults to KEEP player stationary when no keys are pressed
Boolean keyW = false;
Boolean keyA = false;
Boolean keyS = false;
Boolean keyD = false;

//Location Reset Control(this temp value controls the first time someone enters a new room)
int temp = 1;//value used to swap forward between rooms and set position
Boolean intro = true;//intro sequence
Boolean t1 = false;//TOWN1
Boolean t2 = false;//TOWN2
Boolean c1 = false;//CITY1
Boolean c2 = false;//CITY2
Boolean r1 = false;//ROUTE LEFT
Boolean tower1 = false;//MY PYRE
Boolean tower2 = false;//MY PYRE
Boolean exit = true;//EXIT VALUE
int a = 0; //(times pressed)

//control values for NPCS and STARTER pokemon
int intro1 = 0;
Boolean out = false;
int x1 = 0;
int y1 = 100;
int y2 = 100;
int r = 0;
int value; //value of pokemon starer
Boolean attack = false;
Boolean attack2 = false;
int numA = 0;
/*
^Scene/Room control that only lets you move forward in the game(symbolic of the idea choices we make in life we
cant go back and change decisions)
*/

int right;//check of pixel 5 amount ahead of player to keep it in bounds on map
int left;//check of pixel 5 amount to the left of player to keep it in bounds on map
int top;//check of pixel 5 amount right of player to keep it in bounds on map
int bot;//check of pixel 5 amount below of player to keep it in bounds on map
/*
^These values are compared in reference to under layer so if 5 to the direction pixels are black then
the character cant move that direction. But elsewhise it lets the character move if 5 to the direction
if white. This interaction with the under layer allows bounds without hard coding every wall or obstacle
So while the player sees the real map i created a layer underneath that is either
black(where you cant go)
white(where you can go)
*/

//Setup:
void setup()
{
  frameRate(20);//for old times sake
  //Size of game window(based on original game being in gameboy sp)
  size(300,300,P3D);
  me = loadImage("up.png");
}
//Draw:
void draw()
{

  //Debug:
  println("x...", x);
  println("y...", y);
  //wprintln(top, bot, left, right);
  // TEMP
  println("mouseX", mouseX);
  println("mouseY", mouseY);
  //Debug ^

  /*
    The following checks the bounds as the player moves
    and if the bound is not directly infront of the player in the direction
    that they are going they will continue to move in that direction while the
    key(or key) if held
  */
  if(keyW == true)
  {
    me = loadImage("up.png");
    if(bot == -1)
    y -= 5;
  }
  if(keyA == true)
  {
    me = loadImage("left.png");
    if(top == -1)
    x -= 5;
  }
  if(keyS == true)
  {
    me = loadImage("down.png");
    if(top == -1)
    y += 5;
  }
  if(keyD == true)
  {
    me = loadImage("right.png");
    if(left == -1)
    x += 5;
  }
  /*
  ROOM LOGIC BEGINS
  */
  //******************************************************************************************
  //INTRODUCTION: (BALL ANIMATION)
  //******************************************************************************************
  if(intro == true)
  {
    if(a == 20)
    {
    t1 = true;
    intro = false;
    }
    else
    intro();
  }

  //******************************************************************************************
  //Town 1: (FIRST ROOM)
  //******************************************************************************************
  else if(t1 == true && intro == false)
  {
    /*
      Town 1 Features:
      -
      -
      -
    */
    if(temp == 1)//FOR FIRST ENTRY/MAIN TIME
    {
      town1();
    }
    else if(temp == 2)//FOR ENTRY FROM TOWN 2
    {
      x = 164;
      y = 20;
      temp = 1;
      town1();
    }

  }
  //******************************************************************************************
  //Town 2: (SECOND ROOM) (UP)
  //******************************************************************************************
  else if(t1 == false && t2 == true)
  {
    /*
      Town 1 Features:
      -
      -
      -
    */
    if(temp == 1)//FOR ENTRY FROM TOWN 1
    {
      x = 139;
      y = 290;
      temp = 0;//little swap value
      town2();
    }
    //IF IN TOWN
    else if(temp == 0)
    {
      town2();
    }

  else if(temp == 2)//FOR ENTRY FROM CITY 1
    {
      x = 140;
      y = 25;
      temp = 0;
      town2();
      //exit = true;
    }
  else if(temp == 3)//ENTRY FROM LEFT
  {
    x = 20;
    y = 160;
    temp = 0;
    town2();
  }

  }

  //******************************************************************************************
  //City 1: (THIRD ROOM 1/3) (UP)
  //******************************************************************************************
  else if(t2 == false && c1 == true)
  {
    /*
      City 1 Features:
      -
      -
      -
    */
    if(temp == 0)//for first entry to set position properly
    {
      x = 119;
      y = 285;
      temp = 1;//little swap value
      city1();
    }
    else if(temp == 1)
    city1();
  }

  //******************************************************************************************
  //CITY 2: (THIRD ROOM 2/3) (RIGHT)
  //******************************************************************************************
  else if(c1 == false && c2 == true)
  {
    /*
      City 2 Features:
      -
      -
      -
    */
    if(temp == 1)
    {
      x = 23;
      y = 241;
      temp = 0;
      city2();
    }
    else if(temp == 0)
    {
      city2();
    }
    else if(temp == 2)
    {
      x = 22;
      y = 238;
      temp = 0;
      city2();
    }
  }

  //******************************************************************************************
  //ROUTE 1: (THIRD ROOM 3/3) (LEFT)
  else if(r1 == true && t2 == false)//
  {
    if(temp == 0 && exit == true)
    {
      x = 274;
      y = 159;
      temp = 1;
      r1();
    }
    else if(temp == 1)
    {
      //println("okay boom");
      r1();
    }
    else if(temp == 2)
    {
      x = 58;
      y = 21;
      temp = 1;
      r1();
    }
  }
  //******************************************************************************************

  //******************************************************************************************
  //Tower 1:
  else if(tower1 == true && tower2 == false)
  {
    if(temp == 1)
    {
      x = 237;
      y = 237;
      temp = 0;
      tower1R();
    }
    if(temp == 0)
    {
      tower1R();
    }
  }
  //******************************************************************************************

  //******************************************************************************************
  //Tower?:
  else if(tower2 == true && tower1 == false)
  {
    if(temp == 1)
    {
      x = 58;
      y = 70;
      temp = 0;
      tower2R();
    }
    if(temp == 0)
    {
      tower2R();
    }
  }
  //*********************************************************************************************************************************************************************************

}
//END DRAW

//INTERACTION ENABLED:
/*
  These function calls means that the user can hold a key and keep moving unless as per
  above in the draw function the boundary is checked and as long as that boundary is
  not in the direction the user wishes to proceed their input will continue.
  This also allows more multidirection input which means they can strafe and move diaganol
*/
//--------------------------------------------------------------------------------------------------------------------------------------
void keyPressed()
{
  //WASD CONTROL KEYS
  /*
    If a key is pressed the bound as stated above is checked (bot, right, left, top)
  */
  if(key == 'w' ||key == 'W' )
  {
      keyW = true;
      //y -= 5;
  }
  if(key == 'a' || key == 'A')
  {
      a++;
      keyA = true;
      //x -= 5;
  }
  if(key == 's' || key == 'S')
  {
      keyS = true;
      //y += 5;
  }
  if(key == 'd' || key == 'D')
  {
      keyD = true;
      //x += 5;
  }
  if(key == 49)
  {
    if(out == false)
    {
    pokestart = poke1;
    value = 1;
    out = true;
    }
  }
  if(key == 50)
  {
    if(out == false)
    {
    pokestart = poke2;
    value = 2;
    out = true;
    }
  }
  if(key == 51)
  {
    if(out == false)
    {
    pokestart = poke3;
    value = 3;
    out = true;
    }
  }
}
//--------------------------------------------------------------------------------------------------------------------------------------
void keyReleased()
{
  if(key == 'w' ||key == 'W' )
  {
    keyW = false;
  }
  if(key == 'a' || key == 'A')
  {
    keyA = false;
  }
  if(key == 's' || key == 'S')
  {
    keyS = false;
  }
  if(key == 'd' || key == 'D')
  {
    keyD = false;
  }
  if(key == 'q')
  {
    attack = true;
    numA ++;
    if(numA == 2)
    {
      attack2 = true;
    }
  }
}
//--------------------------------------------------------------------------------------------------------------------------------------
//INTRO
void displayInfo()
{
  /*
    Displays text based on who the NPC is and what room the player is in
  */
  //T1
  if( r == 0)
  {
    rectMode(CORNER);
    fill(255);
    rect(24,10, 100, 50);
    textAlign(CENTER, CENTER);
    fill(0);
    rectMode(CORNER);
    fill(255);
    rect(24,10, 100, 50);
    fill(0);
    //textSize(15);
    if(value == 1)
    {
      String s = "Ralts the alien";
      text(s, 25, 10, 100, 50);  // Text wraps within text box
    }
    if(value == 2)
    {
      String s = "Abra the psycic";
      text(s, 25, 10, 100, 50);  // Text wraps within text box
    }
    if(value == 3)
    {
      String s = "Meowth the black cat";
      text(s, 25, 10, 100, 50);  // Text wraps within text box
    }
  }
  //T2
  if(r == 1)
  {
  rectMode(CORNER);
  fill(255);
  rect(24,10, 100, 50);
  fill(0);
  //textSize(15);
  String s = "Coyotes on a journey are a bad omen";
  text(s, 25, 10, 100, 50);  // Text wraps within text box

  //text("Coyotoes on a journey are a bad omen", 72, 36);
  }
  //CITY1(UP)
  if(r == 2)
  {
    rectMode(CORNER);
    fill(255);
    rect(24,10, 100, 50);
    fill(0);
    //textSize(15);
    String s = "Coyote Fled";
    text(s, 25, 10, 100, 50);  // Text wraps within text box
  }
    //CITY2(RIGHT)
    //nothong

    //R1(LEFT)
    if(r == 3)
    {
      rectMode(CORNER);
      fill(255);
      rect(24,10, 100, 50);
      fill(0);
      //textSize(15);
      String s = "You are attacked press q";
      text(s, 25, 10, 100, 50);  // Text wraps within text box
    }
    if(r == 4 && value == 1)
    {
      rectMode(CORNER);
      fill(255);
      rect(24,10, 100, 50);
      fill(0);
      //textSize(15);
      String s = "Ralts uses hyperbeam. Saved";
      text(s, 25, 10, 100, 50);  // Text wraps within text box
    }
    if(r == 4 && value == 2)
    {
      rectMode(CORNER);
      fill(255);
      rect(24,10, 100, 50);
      fill(0);
      //textSize(15);
      String s = "Abra uses psycic. Saved";
      text(s, 25, 10, 100, 50);  // Text wraps within te
    }
    if(r == 4 && value == 3)
    {
      rectMode(CORNER);
      fill(255);
      rect(24,10, 100, 50);
      fill(0);
      //textSize(15);
      String s = "Meowth uses scratch. Saved";
      text(s, 25, 10, 100, 50);  // Text wraps within te

    }
    if(r == 5)
    {
      rectMode(CORNER);
      fill(255);
      rect(24,10, 100, 50);
      fill(0);
      //textSize(15);
      String s = "YOU WERE ATTACKED AGAIN";
      text(s, 25, 10, 100, 50);  // Text wraps within te
    }
    if(r == 6 && value == 1)
    {
      rectMode(CORNER);
      fill(255);
      rect(24,10, 100, 50);
      fill(0);
      //textSize(15);
      String s = "Ralts uses draco meteor. Saved";
      text(s, 25, 10, 100, 50);  // Text wraps within text box
    }
    if(r == 6 && value == 2)
    {
      rectMode(CORNER);
      fill(255);
      rect(24,10, 100, 50);
      fill(0);
      //textSize(15);
      String s = "Abra uses Protect. Saved";
      text(s, 25, 10, 100, 50);  // Text wraps within text box
    }
    if(r == 6 && value == 1)
    {
      rectMode(CORNER);
      fill(255);
      rect(24,10, 100, 50);
      fill(0);
      //textSize(15);
      String s = "Meowth uses claw attack. Saved";
      text(s, 25, 10, 100, 50);  // Text wraps within text box
    }
}       //TOWER2
void intro()
{
  background(255);
  textSize(10);
  fill(0);
  if(out == false)//BEFORE THEY CHOOSE THEIR POKEMON
  {
  textAlign(CENTER, CENTER);
  text("MOVEMENT: WASD", width/2, height/2 + 50);

  textAlign(CENTER, TOP);
  text("INTERACT: Q", width/2, height/2);

  textAlign(CENTER, BOTTOM);
  text("CHOOSE A STARTER PRESS 1 2 OR 3", width/2, height/2 - 50);
  poke1 = loadImage("pokeralts.png");
  poke2 = loadImage("pokeabra.png");
  poke3 = loadImage("pokemeow.png");
  image(poke1, 30, 90);
  image(poke2, 30 + 100, 90);
  image(poke3, 30 + 200, 90);
  }
  else
  {
    text("SPAM A TO CAPTURE YOUR STARTER", width/2, height/2 - 50);
    imageMode(CENTER);
    image(pokestart, width/2, height/2);
  }
}

//--------------------------------------------------------------------------------------------------------------------------------------
//TOWN1
void town1() //1 PATH FORWARD
{
  //Sets Background and Under Layer
  back = loadImage("town1.png");
  under = loadImage("town1U.png");

  //Displays Under Layer
  //imageMode(CENTER);
  background(under);
  //image(under, 0, 0, 300, 300);
  left = get(x + 5 , y);
  right = get(x - 5, y);
  top = get(x, y + 5);
  bot = get(x, y - 5);
  /*
    Bound values are set by the get function which
    finds out the if the pixel "speed" ahead is back. If its black we set the
    direction value to -1 and as such in the keypressed function this disables that key from
    acting on the character. If the value is any value other then -1 we disregard as in keyPressed
    we only check if the value is -1
  */

  //Displays Background(over under layer)
  background(back);

  //Character:
  fill(255,0,255);
  ellipseMode(CENTER);
  circle(x, y, 10);
  imageMode(CENTER);
  image(me, x, y);

  //POKEMON / NPCS:



  //CHECK FOR EXIT ROOM:
  if(y >= 9)//if y == 9 you are at top of room move up to next room
  {
  displayInfo();
  t1 = true;
  t2 = false;
  r = 0;
  }
  else
  {
  //displayInfo();
  t1 = false;
  t2 = true;
  r = 1;
  }
}
//--------------------------------------------------------------------------------------------------------------------------------------
void town2() // 3 PATHS FORWARD, LEFT, RIGHT
{
  //Sets Background and Under Layer
  back = loadImage("town2.png");
  under = loadImage("town2U.png");

  //Background/Under
  background(under);
  //image(under, 0, 0, 300, 300);
  left = get(x + 5 , y);
  right = get(x - 5, y);
  top = get(x, y + 5);
  bot = get(x, y - 5);
  /*
    Bound values are set by the get function which
    finds out the if the pixel "speed" ahead is back. If its black we set the
    direction value to -1 and as such in the keypressed function this disables that key from
    acting on the character. If the value is any value other then -1 we disregard as in keyPressed
    we only check if the value is -1
    */
  //Displays Background(over under layer)
  background(back);

  //Character:
  ellipseMode(CENTER);
  circle(x, y, 10);
  imageMode(CENTER);
  image(me, x, y);

  //COYOTE
  poke1 = loadImage("coyote.png");
  imageMode(CENTER);
  poke1.resize(20, 20);
  image(poke1, 154, y1);
  if(y1 >= 0)
  {
  y1 --;
  }
  else
  {
  y1 -= 10;
  }

  displayInfo();

  //SWITCH ROOM LOGIC:
  if(y >= 2)//MOVE TO CITY 1 UP
   {
   t2 = true;
   c1 = false;
   r = 1;

   }
  if(x <= 6 ) //MOVE TO ROUTE LEFT &&
  {
    println("left"); // *****
    t2 = false;
    r1 = true;
    c2 = false;
    // x = 294;
    // y = 58;
    temp = 0; //******

  }
  if(x >= 292) //MOVE TO CITY 2 RIGHT &&
  {
    //println("right");
    t2 = false;
    c2 = true;
    //x = 8;
    //y = 235;
    temp = 2;
  }
  if (y <= 2)//STAY HEREW
  {
    println("here");
    t2 = false;
    c1 = true;
    r = 1 ;
  }
  if (y == 295)//MOVE BACK TO TOWN 2
  {
    t1 = true;
    t2 = false;
    temp = 2;
     r = 0;
  }


}
//--------------------------------------------------------------------------------------------------------------------------------------
// CITY1
void city1() //1 PATH FORWARD
{
  back = loadImage("city1.png");
  under = loadImage("city1U.png");

  //Background/Under
  background(under);
  //image(under, 0, 0, 300, 300);
  left = get(x + 5 , y);
  right = get(x - 5, y);
  top = get(x, y + 5);
  bot = get(x, y - 5);
  /*
    Bound values are set by the get function which
    finds out the if the pixel "speed" ahead is back. If its black we set the
    direction value to -1 and as such in the keypressed function this disables that key from
    acting on the character. If the value is any value other then -1 we disregard as in keyPressed
    we only check if the value is -1
    */
  //Displays Background(over under layer)
  background(back);

  //Character:
  ellipseMode(CENTER);
  circle(x, y, 10);
  imageMode(CENTER);
  image(me, x, y);

  //pokemon
  poke1 = loadImage("coyote.png");
  imageMode(CENTER);
  poke1.resize(20, 20);
  image(poke1, 159, 100 + y2);
  if(y1 >= 0)
  {
  y2 --;
  r = 2;
  displayInfo();
  }
  else
  {
  y2 -= 10;
  r = 3;
  }

  //SWITCH ROOM LOGIC:
  if(y >= 2)//MOVE TO CITY 3
   {
   //t2 = true;
   //c1 = false;
   }
  if (y <= 2)//STAY HERE
  {
    t2 = false;
    c1 = true;
  }
  if (y == 295)//MOVE BACK TO TOWN 2
  {
    t2 = true;
    c1 = false;
    temp = 2;
  }

}
//--------------------------------------------------------------------------------------------------------------------------------------
void city2() //DEAD END
{
  exit = true;
  back = loadImage("city2.png");
  under = loadImage("city2U.png");

  //Background/Under
  background(under);
  //image(under, 0, 0, 300, 300);
  left = get(x + 5 , y);
  right = get(x - 5, y);
  top = get(x, y + 5);
  bot = get(x, y - 5);
  /*
    Bound values are set by the get function which
    finds out the if the pixel "speed" ahead is back. If its black we set the
    direction value to -1 and as such in the keypressed function this disables that key from
    acting on the character. If the value is any value other then -1 we disregard as in keyPressed
    we only check if the value is -1
    */
  //Displays Background(over under layer)
  background(back);

  //Character:
  ellipseMode(CENTER);
  circle(x, y, 10);
  imageMode(CENTER);
  image(me, x, y);

  //POKEMON
  poke1 = loadImage("whale.png");
  poke2 = loadImage("block.png");

  imageMode(CENTER);
  poke1.resize(20, 20);
  poke2.resize(30,30);
  image(poke1, 219, 86);
  image(poke1, 228, 228);
  image(poke2, 108, 155);


  //

  //SWITCH ROOM LOGIC:
  if(x > 5) //STAY HERE
  {
     t2 = false;
     c2 = true;
  }
  if (x <= 5)//MOVE BACK TO TOWN 2
  {
    t2 = true;
    c1 = false;
    x = 273;
    y = 145;
    temp = 0;
  }
}
//--------------------------------------------------------------------------------------------------------------------------------------
void r1()
{

  //Sets Background and Under Layer
  back = loadImage("routelefttoup.png");
  under = loadImage("routelefttoupU.png");

  //Displays Under Layer
  //imageMode(CENTER);
  background(under);
  //image(under, 0, 0, 300, 300);
  left = get(x + 5 , y);
  right = get(x - 5, y);
  top = get(x, y + 5);
  bot = get(x, y - 5);
  /*
    Bound values are set by the get function which
    finds out the if the pixel "speed" ahead is back. If its black we set the
    direction value to -1 and as such in the keypressed function this disables that key from
    acting on the character. If the value is any value other then -1 we disregard as in keyPressed
    we only check if the value is -1
  */

  //Displays Background(over under layer)
  background(back);

  //Character:
  fill(255,0,255);
  ellipseMode(CENTER);
  circle(x, y, 10);
  imageMode(CENTER);
  image(me, x, y);

  if(y <= 104 && attack == false)
  {
    r = 3;
    poke1 = loadImage("94.png");
    imageMode(CENTER);
    poke1.resize(20, 20);
    image(poke1, 59, 67);
    displayInfo();
  }
  if(attack == true)
  {
    r = 4;
    displayInfo();
  }

  if (y <= 8)//MOVE TO TOWER
  {
    tower1 = true;
    r1 = false;
    temp = 1;
    x = 237;
    y = 269;
  }
  if (x >= 292)//MOVE BACK TO TOWN 2
  {
    //println("back to 2");
    t2 = true;
    r1 = false;
    temp = 3;
    x = 20;
    y = 160;
  }
}
//--------------------------------------------------------------------------------------------------------------------------------------
void tower1R()
{
  back = loadImage("mtpyre1.png");
  under = loadImage("mtpyre1U.png");

  //Background/Under
  background(under);
  //image(under, 0, 0, 300, 300);
  left = get(x + 5 , y);
  right = get(x - 5, y);
  top = get(x, y + 5);
  bot = get(x, y - 5);
  /*
    Bound values are set by the get function which
    finds out the if the pixel "speed" ahead is back. If its black we set the
    direction value to -1 and as such in the keypressed function this disables that key from
    acting on the character. If the value is any value other then -1 we disregard as in keyPressed
    we only check if the value is -1
    */
  //Displays Background(over under layer)
  background(back);

  //Character:
  ellipseMode(CENTER);
  circle(x, y, 10);
  imageMode(CENTER);
  image(me, x, y);
  if(y <=19)
  {
    tower1 = false;
    tower2 = true;
    me = loadImage("down.png");
    temp = 1;
    //
  }
  if(y >= 299)
  {
    tower1 = false;
    r1 = true;
    x = 59;
    y = 23;
    temp = 1;
  }

}
//--------------------------------------------------------------------------------------------------------------------------------------
void tower2R()
{
  back = loadImage("mypyre2.png");
  under = loadImage("mypyre2U.png");

  //Background/Under
  background(under);
  //image(under, 0, 0, 300, 300);
  left = get(x + 5 , y);
  right = get(x - 5, y);
  top = get(x, y + 5);
  bot = get(x, y - 5);
  /*
    Bound values are set by the get function which
    finds out the if the pixel "speed" ahead is back. If its black we set the
    direction value to -1 and as such in the keypressed function this disables that key from
    acting on the character. If the value is any value other then -1 we disregard as in keyPressed
    we only check if the value is -1
    */
  //Displays Background(over under layer)
  background(back);

  //Character:
  ellipseMode(CENTER);
  circle(x, y, 10);
  imageMode(CENTER);
  image(me, x, y);


  if(x <= 123 && y >= 190 && attack2 == false)
  {
    r = 5;
    poke1 = loadImage("92.png");
    imageMode(CENTER);
    poke1.resize(20, 20);
    image(poke1, 97, 246);
    displayInfo();
  }
  if(attack2 == true)
  {
    r = 6;
    displayInfo();
  }

  if (y <= 8)//MOVE TO TOWER
  {
    tower1 = true;
    r1 = false;
    temp = 1;
    x = 237;
    y = 269;
  }
  if (x >= 292)//MOVE BACK TO TOWN 2
  {
    //println("back to 2");
    t2 = true;
    r1 = false;
    temp = 3;
    x = 20;
    y = 160;
  }


  if(x == 33 && y == 240 )
  {
    tower1 = true;
    tower2 = false;
    x = 139;
    y = 123;

  }
}

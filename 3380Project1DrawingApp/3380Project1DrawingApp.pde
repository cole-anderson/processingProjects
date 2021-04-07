/*
NMED 3380
 Cole Anderson
 Project 1: Draw Program
 */

//Variable Declarations

//Colors:
int red;
int blue;
int green;
int rainbow;//random
int grey;
int black;

//
int fValue = 5;//fill value
int bValue;//background color value
int xStroke;//stroke size
int scaleV;//scale of primitives
int opacity = 255;//opacity of primitives

//Check Variables
boolean lastwasG = false;
boolean lastwasB = false;
boolean lastwasR = false;
//Brush Change Variable
int lastPrim =1;//default to line draw
int tester = 0;//declare start of loop 

void setup()
{
  size(1280, 720);
  frameRate(30);
  hint(DISABLE_OPTIMIZED_STROKE);  

  red = color(255, 0, 0);
  blue = color(0, 0, 255);
  green = color(0, 255, 0);
  grey = color(105);
  black = color(0);
  background(black);
  fValue = 105;
}
void draw()
{
  //Changes Brush every set amount of times draw is called
  tester ++;
  if (tester < 400)
  {//start timer loop

    //Large set of conditions that affect characteristics in program(if statement due to avoid switch statement issues)
    //Based on keyboard input(both actual and placebo based due to instructions
    if (keyPressed)
    {
      //GREEN:
      if (key == 'n')
      {
        if (lastwasG == true)
        {
          //where if user types "green" the e changes the color
          fValue = green;
          lastwasG = false;
        }
      }
      //RED
      else if (key == 'd')
      {
        if (lastwasR == true)
        {
          //where if user types "red" the e changes the color
          fValue = red;
          lastwasR = false;
        }
      }
      //BLUE
      else if (key == 'e')
      {
        if (lastwasB == true)
        {
          //where if user types "blue" the e changes the color
          fValue = blue;
          lastwasB = false;
        }
      } else if (key == '=')
      {
        if (fValue < 254)
        {
          fValue++; 
          //println(fValue);
        }
      } else if (key == '-')
      {
        if (fValue >= 2)
        {
          fValue--; 
          //println(fValue);
        }
      } else if (key == '/')
      {//where if user types / then it clears the screen(just a general key)
        bValue = black;
        background(bValue);
      } else if (key == '1')
      {//where if user types 1 then the background goes red;
        bValue = red; 
        background(bValue);
      } else if (key == '2')
      {//where if user types 2 then the background goes green
        bValue = green; 
        background(bValue);
      } else if (key == '3')
      {//where if user types 3 then the background goes blue
        bValue = blue; 
        background(bValue);
      } else if (key == '4')
      {//where if user types 4 then the background goes black
        bValue = black; 
        background(bValue);
      } else if (key == '.')
      {//where if user types . then the stroke increases
        if (xStroke < 100)//makes the upper bound of stroke 100
        {
          xStroke ++;
        }
      } else if (key == ',')
      {//where if user types , then stroke decreases
        if (xStroke > 0)//makes the lower bound of stoke 0
        {
          xStroke --;
        }
      }
    }//end of if else statements for keys

    //Actual Drawing:

    stroke(fValue, opacity);
    strokeWeight(xStroke);
    //DRAW LINE:
    if (mousePressed && lastPrim == 1)
    {

      if (mouseX > 160)
      {//doesnt draw over GUI
        strokeWeight(xStroke);//
        line(mouseX, mouseY, pmouseX, pmouseY);
      }
    }
    //DRAW SQUARES
    if (mousePressed && lastPrim == 2)
    {
      if (mouseX > 160)
      {//doesnt draw over GUI
        noStroke();
        fill(fValue, opacity);
        rect(pmouseX, pmouseY, xStroke, xStroke);
      }
    }
    //Draw Arc
    if (mousePressed && lastPrim == 3)
    {
      if (mouseX > 160)
      {//doesnt draw over GUI
        noStroke();
        fill(fValue, opacity);
        arc(pmouseX, pmouseY, xStroke+15, xStroke+15, xStroke, TWO_PI);
      }
    }
  }
  //end brush loop
  else if (tester > 300)
  {
    if (lastPrim < 3)
    {
      lastPrim ++;
      tester = 0;
    } else
    {
      lastPrim = 1; 
      tester = 0;
    }
  }
  //GUI:
  //BASE:

  noStroke();//so it doesnt scale stroke when changing stroke value
  fill(235);//set color
  rect(0, 0, 160, 720);//creates rectangle thats is the bottom layer of GUI



  //STROKE/COLOR/shape
  if (lastPrim == 1)
  {
    fill(fValue);//changes color of circle when different color is selected
    circle(50, 50, xStroke + 1);//changes size of circle in reference to stroke size
  }

  if (lastPrim == 2)
  {
    rectMode(CENTER);
    fill(fValue);//changes color of square when different color is selected
    rect(50, 50, xStroke + 1, xStroke + 1);//changes size of square in reference to stroke size
  }

  if (lastPrim == 3)
  {
    fill(fValue);//changes color of triangle when different color is selected
    arc(50, 50, 20, 20, xStroke+1, TWO_PI);//changes size of triangle in reference to stroke size
  }
}//end draw



void keyPressed()
{
  /*
  Check system to check both first and last character of keyboard input(this part checks char 1)
   limitation is this only checks first and last so you can technically type "gregghdhdn" and the program
   will change the color to green BUT the point of this implemenation is for ease of use and
   if someone types fast and types greeen i DO not believe they should be penalized
   
   */
  if (key == 'g')
  {
    lastwasG = true;
  }
  if (key == 'b')
  {
    lastwasB = true;
  }
  if (key == 'r')
  {
    lastwasR = true;
  }


  /*
  Opacity Changer
   */
  if (key == CODED)
  {
    if (keyCode == UP)
    {
      if (opacity <= 255)
      {
        opacity += 20;
      }
    } else if (keyCode == DOWN)
    {
      if (opacity >= 10)
      {
        opacity -= 20;
      }
    }
  }
}

/*
  "Error Invaders"
 *A Meditation machine for coders who like to games and gamers that like to code*
 */
import processing.serial.*;    // Importing the serial library to communicate with the Arduino 

Serial myPort;      // Initializing a vairable named 'myPort' for serial communication

//Serial Reads
String inString;
String[] dArray;

//float projType;//global allowance to change proj type from arduino input

//Setup User Obj
User User;
/*
  ArrayLists that represent the 
 1) errorSnippets (aliens)
 2) codeSnippets (projectiles
 */
ArrayList errorSnippets = new ArrayList();
ArrayList codeSnippets = new ArrayList();
/*
  Setup Pixelation and Grid
 */
int pixelsize = 15;
int gridsize  = pixelsize * 7 + 2;
/*
  Initilizations
 Direction(which way the "errors" move
 errorMove(if the errors have moved from one side of screen to other)
 score
 highscore
 f(font obj)
 */
int direction = 1;
boolean errorMove = false;
int score = 0;
int highScore = 0;
PFont f;
Boolean instruct = true;

//***********************************************************************************************************************************
/*
  Setup
 */
void setup() {
  background(0);
  noStroke();
  fullScreen(); 
  //size(800, 550);
  User = new User();
  createerrorSnippets();
  //Takes Serial Input from joystick converts to movement on screen
  myPort = new Serial(this, Serial.list()[1], 9600);
  myPort.bufferUntil('\n');

  //Cute Font Why not size 12?
  f = createFont("Times New Roman", 36, true);
}
/*
  Draw Main Function
 */
void draw() {

 
  //Main Game Loop:
  /*  
    Below if statement accounts for possible error where in their is no serial
    data instantly transmitted from arduino. Avoids ironically a nullpointer exception
  */
    if(dArray != null)
    {
      
    background(0);

    drawScore();
    //for(int i = 0; i < 3; i++)
    //{
    // print(int(dArray[i])); 
    //}
    
    int xp = int(dArray[0])/2;
    int fire = int(dArray[1]);
    int swap = int(dArray[2]);
    
    
    User.draw(xp, fire, swap, 1070);

    for (int i = 0; i < codeSnippets.size(); i++) {
      CodeProjectile CodeProjectile = (CodeProjectile) codeSnippets.get(i);
      CodeProjectile.draw();
      //println("shoot");
    }

    for (int i = 0; i < errorSnippets.size(); i++) {
      ErrorSnippets enemy = (ErrorSnippets) errorSnippets.get(i);
      if (enemy.outside() == true) {
        direction *= (-1);
        errorMove = true;
        break;
      }
    }

    for (int i = 0; i < errorSnippets.size(); i++) {
      ErrorSnippets enemy = (ErrorSnippets) errorSnippets.get(i);
      if (!enemy.alive()) {
        errorSnippets.remove(i);
        myPort.write ( '1' ) ;       // send a '1' to arduino to light up led
      } else {
        enemy.draw();
      }
    }
    errorMove = false;
    }//end null check
}//end main
//***********************************************************
//Increments Score based on dead errors! 
void drawScore() {
  textFont(f);
  text("Score: " + String.valueOf(score), 1920/2, 25);
}

/*
  Creates the "aliens" error snippets
 */
void createerrorSnippets() {
  //1) ; (classic missing semicolon)
  //2) null (nullpointer exception)
  //3) time (segmentationfault)
  //4) #include (undefined reference)

  //Different Enemy Types
  String inputArray[] = {"missingSemi", "nullptr", "segFault", "undefindRef" };

  //Randomly Generates Grid of Enemies(text)
  for (int i = 0; i < width/gridsize/2; i++) {
    for (int j = 0; j <= 5; j++) {
      int rand = (int) random(inputArray.length);
      errorSnippets.add(new ErrorSnippets(i*gridsize, j*gridsize + 70, inputArray[rand]));
    }
  }
}
/*
  Takes Ardunio Serial Input and Converts to Array
 */
void serialEvent(Serial myPort) {

  String inString = myPort.readStringUntil('\n');
  println("//CURRENT STRING:" + inString);
  if (inString != null)
  {
    inString = trim(inString);
  }
  dArray = split(inString, ",");
}
//endprogram

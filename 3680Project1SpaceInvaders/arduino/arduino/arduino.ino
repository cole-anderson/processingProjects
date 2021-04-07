/*
    JoyStick
    Allows for Joystick and Button Control of Processing
    Allows for Blinking Light When Enemy Dies
*/
const int BUTTON = 2;
const int BUTTON2 = 8;
const int LED = 3;
int BUTTONstate = 0;
int BUTTON2state = 0;


void setup() {
  //This is setup for which pins are connected to bread board
  Serial.begin(9600);
  
  //Left Right Joystick
  pinMode(A0, INPUT);
  pinMode(A1, INPUT);
  pinMode(2, INPUT);
  pinMode(2, INPUT_PULLUP);

  //Button + Clicker
  pinMode(BUTTON, INPUT);
  pinMode(BUTTON2, INPUT);

  //Green Light
  pinMode(LED, OUTPUT);
}

void loop() {
  //JoyStick Control X Axis(dont care about y)
  int xVal = analogRead(A0);
  //Fire Cannons
  int Fire = digitalRead(2);

  int Swap = digitalRead(8);
  

  //Test if working(Monitor)
  Serial.print(xVal);//Back Forth Joystick  
  Serial.print(",");
  Serial.print(Fire);//Button Click
  Serial.print(",");
  Serial.println(Swap);//Button Click
  delay(100);
  //Swap Projectiles
  
//  BUTTON2state = digitalRead(BUTTON2);
//  if (BUTTON2state == HIGH)
//  {
//    digitalRead(8);
//  }
// 
//  
//  //Fire
//  BUTTONstate = digitalRead(BUTTON);
//  if (BUTTONstate == HIGH)
//  {
//    digitalRead(2);
//  }
 

  //Light When Enemy Dies
  //Check Val to Avoid Errors
  if (Serial.available ( ) > 0) {   
    char state = Serial.read ( );//Read from processing
    if (state == '1')//if dead light up once            
    {
      //Flashes Light When Enemy Is Killed
      digitalWrite (LED, HIGH);
      delay(200);
      digitalWrite (LED, LOW);
      delay(200);
      digitalWrite (LED, HIGH);
      delay(200);
      digitalWrite (LED, LOW);
      delay(200);
      digitalWrite (LED, HIGH);
      delay(200);
      digitalWrite (LED, LOW);
      delay(200);
      digitalWrite (LED, HIGH);
      delay(200);
      digitalWrite (LED, LOW);
      delay(200);
      digitalWrite (LED, HIGH);
      delay(200);
      digitalWrite (LED, LOW);
      delay(200);
      state = '0';
    }
    if (state == '0') 
    { // Turn led off afterward
      digitalWrite (LED, LOW);
    }
  }
}

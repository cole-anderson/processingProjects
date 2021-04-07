/*
Cole Anderson

 
 This template is an example that can be altered to suit your project's style.
 Created by Connor Kingston
 Sounds from mixkit.co "https://mixkit.co/free-sound-effects/" and tabletopaudio.com "https://tabletopaudio.com/"
 
 For help with classes you can go to "https://happycoding.io/tutorials/processing/creating-classes" as I found it to be easy to understand and helps breakdown what a class is
 
 */

PImage mapBG;

PImage Chicken;
PImage Racket;
PImage Xbox;
PImage Snowcone;
PImage Boat;
PImage Microsoft;
PImage AfterEffects;
PImage Titanic;

//Easter Egg
Boolean[] found = {false,false,false,false,false,false,false, false};
Boolean allFound = false;

import ddf.minim.*; // adds the library to this sketch so that audio can be added

int mouseFinalx;
int mouseFinaly;

Hotspot h1, h2, h3, h4, h5, h6, h7, h8; //creating different instances of the class

Minim minim; //start minim object (also deals with classes)

AudioPlayer t1, t2, t3, t4, t5, t6, t7, t8; // using a class found in the minim library to create different instances


void setup() {

  //
  frameRate(60);
  size(2560, 1440); //set the size of the sketch //800x600
  mapBG = loadImage( "map.png" );

  Racket = loadImage("racket.png");

  Chicken = loadImage("chicken.png");
  
  Xbox = loadImage("xbox.png");
  
  Snowcone = loadImage("snowcone.png");
  
  Boat = loadImage("boat.png");
  
  Microsoft = loadImage("microsoft.png");
  
  AfterEffects = loadImage("ae.png");
  
  Titanic = loadImage("titanic.png");


  minim = new Minim(this); //Sets the constructors variables to the class variables. See in class for better description

  t1 = minim.loadFile("badminton.mp3"); //loads file found in data folder with specific name as inputed
  t2 = minim.loadFile("chicken.mp3");
  t3 = minim.loadFile("xbox.mp3");
  t4 = minim.loadFile("ocean.mp3");
  t5 = minim.loadFile("boat.mp3");
  t6 = minim.loadFile("party.mp3");
  t7 = minim.loadFile("titanic.mp3");
  t8 = minim.loadFile("ae.mp3");

  //imageMode(CENTER); // move default 0, 0 point of origin to centre of image
  //mapBG = loadImage(""); // add the name, including file extension, of your image between the quotation marks

  //ellipseMode(CENTER); //changes the origin point of ellipses to the center 

  h1 = new Hotspot(1393, 1073); //Lethbridge: Typing and Badminton
  h2 = new Hotspot(1110, 328); // Grande Prairie: Hearbeat, Car Reving and Chickens
  h3 = new Hotspot(626, 917); // Vancouver: Xbox Startup and Battlefront2
  h4 = new Hotspot(197, 1214); // Kona: Waves Crashing and Relaxing Music
  h5 = new Hotspot(930, 866); //Shuswap: Boat + Pokemon Music
  h6 = new Hotspot(2022, 423); //Niagra Falls: Cheers + Water Flowing
  h7 = new Hotspot(2305, 1205); //New York: Loud Noises + Rock Music
  h8 = new Hotspot(1848, 1052 ); //Nova Scotia: Titanic

}

void draw() {
  
  //Easter Egg for if someone visits all the memories!
  if(allFound == true){ 
  background(mapBG);
  h1.display(Racket); 
  h2.display(Chicken);
  h3.display(Xbox);
  h4.display(Snowcone);
  h5.display(Boat);
  h6.display(Microsoft);
  h7.display(AfterEffects);
  
  //TODO: TRANSITION
  }
  
  //Main loop for if not all memories visited!
  else{
  
  //FOCUS ZONE:(for the focus effect)
  loadPixels();
  mapBG.loadPixels();

  //readPixels for manipulation
  for (int x = 0; x < mapBG.width; x++ ) {
    for (int y = 0; y < mapBG.height; y++ ) {
      int loc = x + y*mapBG.width;

      // read rgb values for manipulation
      float r = red  (mapBG.pixels[loc]);
      float g = green(mapBG.pixels[loc]);
      float b = blue (mapBG.pixels[loc]);

      //Math for brightness where in the mouse effects the focus area of the "light"
      float distance = dist(x, y, mouseX, mouseY);

      // We need to invert so the closest pixel is brightest and further are darker
      float adjustBrightness = map(distance, 0, 1050, 1, 0);
      r *= adjustBrightness;
      g *= adjustBrightness;
      b *= adjustBrightness;

      // Fix rgb constaint
      r = constrain(r, 0, 255);
      g = constrain(g, 0, 255);
      b = constrain(b, 0, 255);

      // Make a new color
      color c = color(r, g, b);
      pixels[loc] = c;
    }
  }
  updatePixels();
  //FOCUS ZONE

  //if (mouseX >= 400 && mouseX <=440 && mouseY >= 287 && mouseY <= 327 || //This tells the cursor to change if it is within a range of the hotspots
  //  mouseX >= 870 && mouseX <=910 && mouseY >= 370 && mouseY <= 410 ||
  //  mouseX >= 629 && mouseX <=669 && mouseY >= 459 && mouseY <= 499 ||
  //  mouseX >= 177 && mouseX <=217 && mouseY >= 909 && mouseY <= 949 ||
  //  mouseX >= 210 && mouseX <=250 && mouseY >= 607 && mouseY <= 647 ||
  //  mouseX >= 492 && mouseX <=532 && mouseY >= 656 && mouseY <= 696 ||
  //  mouseX >= 816 && mouseX <=856 && mouseY >= 860 && mouseY <= 900) {
  //  cursor(CROSS); //change cursor to cross icon
  //} else {
  //  cursor(MOVE); //if it isnt in one of the designated areas then make the cursor the move icon
  //}
  ///////////////////////////////////If you wish to have the audio stay on till another spot is triggered////////////////////////////////////////////////
  /*
if (mouseX >= 400 && mouseX <=440 && mouseY >= 287 && mouseY <= 327) { //activate functions if mouse is within this area
   t1.play(); //start the sound of the t1 object
   t1.loop(); //keep t1 looping
   if (t1.isPlaying()) { //if t1 is currently active then activate these functions
   t2.pause(); //pause t2 sound
   t2.rewind(); //rewind t2 back to the beginning of the sound file
   t3.pause();
   t3.rewind();
   t4.pause();
   t4.rewind();
   t5.pause();
   t5.rewind();
   t6.pause();
   t6.rewind();
   t7.pause();
   t7.rewind();
   }
   }
   */
  //////////////////////////////////////////////////////////////////////////////////  

  ////////////////////////////////////If you want the audio to only stay on while you hover over the trigger area//////////////////////////////////////////////

  //LETHBRIDGE: 
  if (mouseX >= 1300 && mouseX <=1400 && mouseY >= 1000 && mouseY <= 1100) {//activate functions if mouse is within this area
    found[0] = true;
  
    t1.play();//start the sound of the t1 object
    if (h1.size < 200) {
      h1.size+=5;
    }
    if (h1.opacity < 255) {
      h1.opacity += 25;
    }
  } else { //if t1 isnt active have these active
    if (h1.size > 75) {
      h1.size -= 25;
    }
    if (h1.opacity > 100) {
      h1.opacity -= 25;
    }
    t1.pause(); 
    t1.rewind(); 
  }

  //GRANDE PRAIRIE: 
  if (mouseX >= 1000 && mouseX <=1200 && mouseY >= 300 && mouseY <= 400) {//activate functions if mouse is within this area
  found[1] = true;
    t2.play();
    if (h2.size < 200) {
      h2.size+=10;
    }
    if (h2.opacity < 255) {
      h2.opacity += 25;
    }
  } else { 
    if (h2.size > 75) {
      h2.size -= 25;
    }
    if (h2.opacity > 100) {
      h2.opacity -= 25;
    }
    t2.pause(); 
    t2.rewind(); 
  }
  
  //Vancouver: 
  if (mouseX >= 600 && mouseX <=700 && mouseY >= 900 && mouseY <= 1000) {//activate functions if mouse is within this area
  found[2] = true;
    t3.play();
    if (h3.size < 200) {
      h3.size+=10;
    }
    if (h3.opacity < 255) {
      h3.opacity += 25;
    }
  } else { 
    if (h3.size > 75) {
      h3.size -= 25;
    }
    if (h3.opacity > 100) {
      h3.opacity -= 25;
    }
    t3.pause();
    t3.rewind(); 
  }
   //Kona: 
  if (mouseX >= 100 && mouseX <=200 && mouseY >= 1000 && mouseY <= 1200) {//activate functions if mouse is within this area
  found[3] = true;
    t4.play();
    if (h4.size < 200) {
      h4.size+=10;
    }
    if (h4.opacity < 255) {
      h4.opacity += 25;
    }
  } else { 
    if (h4.size > 75) {
      h4.size -= 25;
    }
    if (h4.opacity > 100) {
      h4.opacity -= 25;
    }
    t4.pause();
    t4.rewind(); 
  }
   //Shuswap: 
  if (mouseX >= 900 && mouseX <=1000 && mouseY >= 800 && mouseY <= 900) {//activate functions if mouse is within this area
  found[4] = true;
    t5.play();
    if (h5.size < 200) {
      h5.size+=10;
    }
    if (h5.opacity < 255) {
      h5.opacity += 25;
    }
  } else { 
    if (h5.size > 75) {
      h5.size -= 25;
    }
    if (h5.opacity > 100) {
      h5.opacity -= 25;
    }
    t5.pause();
    t5.rewind(); 
  }
   //Niagra Falls 
  if (mouseX >= 2000 && mouseX <=2100 && mouseY >= 400 && mouseY <= 500) {//activate functions if mouse is within this area
  found[5] = true;
    t6.play();
    if (h6.size < 200) {
      h6.size+=10;
    }
    if (h6.opacity < 255) {
      h5.opacity += 25;
    }
  } else { 
    if (h6.size > 75) {
      h6.size -= 25;
    }
    if (h6.opacity > 100) {
      h6.opacity -= 25;
    }
    t6.pause();
    t6.rewind(); 
  }
   //New York 
  if (mouseX >= 2300 && mouseX <=2400 && mouseY >= 1000 && mouseY <= 1200) {//activate functions if mouse is within this area
  found[6] = true;
    t7.play();
    if (h7.size < 200) {
      h7.size+=10;
    }
    if (h7.opacity < 255) {
      h7.opacity += 25;
    }
  } else { 
    if (h7.size > 75) {
      h7.size -= 25;
    }
    if (h7.opacity > 100) {
      h7.opacity -= 25;
    }
    t7.pause();
    t7.rewind(); 
  }
   //Nova Scotia
  if (mouseX >= 1800 && mouseX <=1900 && mouseY >= 1000 && mouseY <= 1100) {//activate functions if mouse is within this area
  found[7] = true;
    t8.play();
    if (h8.size < 200) {
      h8.size+=10;
    }
    if (h8.opacity < 255) {
      h8.opacity += 25;
    }
  } else { 
    if (h8.size > 75) {
      h8.size -= 25;
    }
    if (h8.opacity > 100) {
      h8.opacity -= 25;
    }
    t8.pause();
    t8.rewind(); 
  }

  h1.display(Racket); 
  h2.display(Chicken);
  h3.display(Xbox);
  h4.display(Snowcone);
  h5.display(Boat);
  h6.display(Microsoft);
  h7.display(Titanic);
  h8.display(AfterEffects);
  
  //CHECKS FOR IF ALL MEMORIES FOUND
  mouseFinalx = mouseX;
  mouseFinaly= mouseY;

  int count = 0;
  for(int i = 0; i < found.length; i++){
    if(found[i] == true)
    {
      count++;
    }
  }
  if(count == 8)
  {
   allFound = true; 
  }
  else
  {
   count = 0; 
  }
}
}


class Hotspot { //class for the different ellipses in this sketch
  float x; //class variable for the x location of the class
  float y; //class variable for the y location of the class
  float opacity;
  int size;


  Hotspot(float x, float y) { //this is the constructor which asks for the x and y values when iniatiated
    this.x = x; //sets the class variables as the parameter variable found in the argument(constructor). To avoid you could use different variables in the constructor but for ease of use it is best to use the same variables
    this.y = y;
    this.opacity = 25;
    this.size = 100;
  }

  void display(PImage p) { //function that displays the classes visuals
    imageMode(CENTER);
    tint(255, this.opacity);
    image(p, this.x, this.y, this.size, this.size);
    noTint();

    //fill(255);
    //ellipse(x, y, 10, 10); //ellipse created in diffderent locations depending on input in constructor
  }
}

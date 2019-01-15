import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import processing.io.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class face extends PApplet {

 

public void setup(){
  //size(600, 600);
   

  // GPIO pinout config for knob #1
  GPIO.pinMode(knob1Clk, GPIO.INPUT);
  GPIO.pinMode(knob1Dt, GPIO.INPUT);
  
  // GPIO pinout config for knob #2
  GPIO.pinMode(knob2Clk, GPIO.INPUT);
  GPIO.pinMode(knob2Dt, GPIO.INPUT);
  
  // GPIO pinout config for knob #3
  GPIO.pinMode(knob3Clk, GPIO.INPUT);
  GPIO.pinMode(knob3Dt, GPIO.INPUT);
  
  // GPIO pinout config for kob #4
  GPIO.pinMode(knob4Clk, GPIO.INPUT);
  GPIO.pinMode(knob4Dt, GPIO.INPUT);
  
  // Because Processing doesn't support GPIO.INPUT_PULLDOWN/PULLUP)
  // #1
  GPIO.attachInterrupt(knob1Clk, this, "updateEncoder", GPIO.CHANGE);
  GPIO.attachInterrupt(knob1Dt, this, "updateEncoder", GPIO.CHANGE);
  
  // #2
  GPIO.attachInterrupt(knob2Clk, this, "updateEncoder", GPIO.CHANGE);
  GPIO.attachInterrupt(knob2Dt, this, "updateEncoder", GPIO.CHANGE);
  
  // #3
  GPIO.attachInterrupt(knob3Clk, this, "updateEncoder", GPIO.CHANGE);
  GPIO.attachInterrupt(knob3Dt, this, "updateEncoder", GPIO.CHANGE);
  
  // #4
  GPIO.attachInterrupt(knob4Clk, this, "updateEncoder", GPIO.CHANGE);
  GPIO.attachInterrupt(knob4Dt, this, "updateEncoder", GPIO.CHANGE);
  
  // GPIO config for buttons 
  
  // blue button (#1) 
  GPIO.pinMode(bluePin, GPIO.INPUT_PULLUP);
  
  // red pin (#2) 
  GPIO.pinMode(redPin, GPIO.INPUT_PULLUP); 
  
  // yellow pin (#3)
  GPIO.pinMode(yellowPin, GPIO.INPUT_PULLUP); 

  // setup for standard font 
  f = createFont("Noto Mono", 16, true); 
}

public void draw(){ 
   translate(width/2 - 250, height/2 - 250); 
   
  // clears background with every draw
  // fourth parameter specifies alpha -- anything < 100% will leave a slight trail upon change
  fill(255, 255, 255, 70); 
  rect(0, 0, width * 2, height * 2); 
  
  rectMode(CENTER); 
  stroke(4); 
  fill(r, g, b);
  rect(0, 0, width * 2, height * 2); 
 
  
  fill(255,255,255); 
  rectMode(CENTER); 
  rect(250, 250, width - 125, height - 125); 
  
  // sets up menu decorations 
  rect(250, -15, 500, 40); 
  
  fill(0, 204, 0);
  rect(25, -15, 50, 40);
  rect(475, -15, 50, 40);

  // sets up font styling / placement for MENU 
  textAlign(CENTER); 
  fill(0);  // black text 
  textFont(f, 24); // sets font f to 24px in size 
  text(menuText, 250, -7.5f); // displays menu text at coordinates (250, 30) 
  
  if (GPIO.digitalRead(bluePin) == GPIO.LOW) {
    if(selectedMenu <= 0){
      selectedMenu = 0; 
    }
    else {
      selectedMenu = selectedMenu - 1;
    }
    menuText = menu[selectedMenu]; 
    delay(50); 
  }
  
  if (GPIO.digitalRead(yellowPin) == GPIO.LOW){
    if(selectedMenu >= menu.length - 1){
        selectedMenu = menu.length - 1;
      }
      else {
        selectedMenu = selectedMenu + 1; 
        
      }
      menuText = menu[selectedMenu];
      delay(50); 
  }
  
   if (GPIO.digitalRead(redPin) == GPIO.LOW){
    randomize(); 
   }
   
  fill(255); // gives the HEAD a fill of '255' / white 
  stroke(0); // '0' / black stroke 
  strokeWeight(4); // sets linewidth 
  
  // buns (bun1x, bun2x, buny, bunSize) 
  // note : if bunsize is reduced to 0, there will be no bun & positions of each can be 
  // centered on her head to make one topknot 
  fill(255); 
  strokeWeight(hairstrw); // linewidth for hair & buns 
  for (float i = bunSize; i > 0; i = i -1){
    ellipse(hsx + bun1x, buny, i * i, i * i); // left bun 
    ellipse(hex + bun2x, buny, i * i, i * i); // right bun 
  }

 noStroke();
 ellipse(250, 250, hex - hsx, 230); 
 // head (hsx, hsy, hcp1x, hcp1y, hcp2x, hcp2y, hex, hey)
  stroke(0); 
  strokeWeight(5);
  bezier(hsx, hsy, hcp1x, hcp1y, hcp2x, hcp2y, hex, hey);
  
 
  // hair (hsx, hex, hairl, hairln) 
  noFill(); 
  strokeWeight(hairstrw); 
  for(int i = 0; i < hairk; i = i + 1){ 
    bezier(hsx, 250 + i * hairl, hsx, 100 + i * i, 250, 120, 250, hairln);
    bezier(hex, 250 + i * hairl, hex, 100 + i * i, 250, 120, 250, hairln);    
  }

  // cheeks (chSpacing, chYpos, ch (radius) ) 
  fill(chR, chG, chB, chA); // fills with reddish color initially 
  noStroke(); 
  ellipse(hsx + 130 - chSpacing, 250 + chYpos, ch, ch); 
  ellipse(hex - 130 + chSpacing, 250 + chYpos, ch, ch); 
  fill(255, 255, 255); 
  
  fill(255, 255, 255); 
  strokeWeight(4); 
  stroke(0); 
  
  // eyes (espac, eypos, ew, eh) 
  ellipse(250 - espac, 250 + eypos, ew, eh);
  ellipse(250 + espac, 250 + eypos, ew, eh);
  
  // pupils (p) 
  fill(0); 
  ellipse(250 - espac, 250 + eypos, p, p); 
  ellipse(250 + espac, 250 + eypos, p, p); 
  
  // eyebrows
  noFill(); 
  
  // mouth (mouthX, mouthY, mouthCx, mouthCy) 
  bezier(250 - mouthX, 320 + mouthY, 250 - mouthCx, 330 + mouthCy, 250 + mouthCx, 330 + mouthCy, 250 + mouthX, 320 + mouthY); 
  
  // nose (noseX, noseY, noseCx, noseCy) 
  fill(255, 255, 255); // makes nose look like it protrudes
  bezier(250 - noseX, 300 + noseY, 250 - noseCx, 250 + noseCy, 250 + noseCx, 250 + noseCy, 250 + noseX, 300 + noseY); 
}
///////////////////////////////
//    GLOBAL VARIABLES       //
//      RE: UPPER MENU       //
///////////////////////////////

// Background RGBA 
int r = 250;
int g = 0; 
int b = 0; 
int a = 100; 

String[] menu = {"head", "hair", "buns", 
                 "eyes", "pupils / cheeks", "nose", 
                 "mouth", "RGBA cheeks", "RGBA background"}; // array for menu items 
int selectedMenu = 0; // index position of current menu item; menu COUNTER 
String menuText = menu[selectedMenu]; // declares menu as initially blank 

// global font variable
PFont f; // empty declaration for font

///////////////////////////////////////
//      RE: FACIAL FEATURES          //
///////////////////////////////////////

// global variables for the HEAD 
float hsx = 100;
float hsy = 200;
float hcp1x = 100;
float hcp1y = 450;
float hcp2x = 400;
float hcp2y = 450;
float hex = 400;
float hey = 200;

// values for the BUNS
float bun1x = 0; 
float bun2x = 0; 
float buny = 150;
float bunSize = 10; 

// values for the HAIR
float hairk = 15; 
float hairl = 6; 
float hairln = 160; 
float hairstrw = 4; 

// values for the EYES 
float espac = 50; 
float eypos = 0; 
float ew = 60; 
float eh = 40; 

// values for the PUPILS 
float p = 2; 

// values for the CHEEKS
float chSpacing = 80; 
float chYpos = 50; 
float ch = 50; 

int chR = 155; // cheeks r 
int chG = 100; // cheeks g
int chB = 255; // cheeks b
int chA = 100; // cheeks a

// values for the NOSE 
float noseX = 10; 
float noseY = 0; 
float noseCx = 40;
float noseCy = 0;  

// values for the MOUTH 
float mouthX = 50; 
float mouthY = 0; 
float mouthCx = 25;
float mouthCy = 0;  
public void keyPressed(){
  
  // RANDOMIZE function called when RETURN/ENTER is pressed
  if (keyCode == ENTER || keyCode == RETURN){
     randomize(); 
  }
  
  // LEFT arrow menu scroll
  if (keyCode == LEFT){
    if(selectedMenu <= 0){
      selectedMenu = 0; 
    }
    else {
      selectedMenu = selectedMenu - 1;
    }
    menuText = menu[selectedMenu]; 
    delay(50); 
  }
  
  // RIGHT arrow menu scroll
  else if (keyCode == RIGHT){
    if(selectedMenu >= menu.length - 1){
        selectedMenu = menu.length - 1;
      }
      else {
        selectedMenu = selectedMenu + 1; 
        
      }
      menuText = menu[selectedMenu];
      delay(50); 
  
  }
  
  ///////////////////////////
  // Keyboard Alt : Head   //
  ///////////////////////////
  if (selectedMenu == 0){
    // Head: Knob 1
    if (key == 'a'){
      hsx = hsx + 1; 
      hex = hex - 1; 
    } 
     if (key == 's'){
      hsx = hsx - 1; 
      hex = hex + 1; 
    }
    
    // Head: Knob 2  
    if (key == 'd'){
      hsy = hsy - 1; 
      hey = hey - 1; 
    } 
     if (key == 'f'){
      hsy = hsy + 1; 
      hey = hey + 1; 
    } 
    
    
    // Head: Knob 3  
    if (key == 'q'){
      hcp1x = hcp1x + 1; 
      hcp2x = hcp2x - 1; 
    } 
     if (key == 'w'){
      hcp1x = hcp1x - 1; 
      hcp2x = hcp2x + 1;
    } 
    
    // Head: Knob 4  
    if (key == 'e'){
      hcp1y = hcp1y + 1; 
      hcp2y = hcp2y - 1; 
    } 
     if (key == 'r'){
      hcp1y = hcp1y - 1; 
      hcp2y = hcp2y + 1;
    } 
  }

   ///////////////////////////
   // Keyboard Alt : Hair    //
  ///////////////////////////
   else if (selectedMenu == 1){
    // Hair: Knob 1
    if (key == 'a'){
      hairl = hairl - 1; 
    } 
     if (key == 's'){
      hairl = hairl + 1; 
    }
    
    // Hair: Knob 2  
    if (key == 'd'){
      hairln = hairln - 1; 
    } 
     if (key == 'f'){
     hairln = hairln + 1;  
    } 
    
    
    // Hair: Knob 3  
    if (key == 'q'){
      hairk = hairk - 1;
    } 
     if (key == 'w'){
      hairk = hairk + 1;
    } 
    
    // Hair: Knob 4  
    if (key == 'e'){
      if(hairstrw <= 0){
        hairstrw = 0; 
      } else {
        hairstrw = hairstrw - 1;
      }
    } 
     
     if (key == 'r'){
      hairstrw = hairstrw + 1;
    } 
    
    
  }
   
   ///////////////////////////
   // Keyboard Alt : Buns   //
  ///////////////////////////
   else if (selectedMenu == 2){
    // Buns: Knob 1
    if (key == 'a'){
      bun1x = bun1x + 1; 
      bun2x = bun2x - 1; 
    } 
     if (key == 's'){
      bun1x = bun1x - 1; 
      bun2x = bun2x + 1; 
    }
    
    // Buns: Knob 2  
    if (key == 'd'){
      buny = buny - 1; 
    } 
     if (key == 'f'){
     buny = buny + 1;   
    } 
    
    
    // Buns: Knob 3  
    if (key == 'q'){
      bunSize = bunSize - .5f; 
    } 
     if (key == 'w'){
      bunSize = bunSize + .5f; 
    } 
    
    // Buns: Knob 4  
    if (key == 'e'){
      if(hairstrw <= 0){
        hairstrw = 0; 
      } else {
        hairstrw = hairstrw - 1;
      }
    } 
     
     if (key == 'r'){
      hairstrw = hairstrw + 1;
    } 
   }
   
    ///////////////////////////
   // Keyboard Alt : Eyes   //
  ///////////////////////////
   else if (selectedMenu == 3){
    // Eyes: Knob 1
    if (key == 'a'){
      espac = espac - 1;
    } 
     if (key == 's'){
      espac = espac + 1;
    }
    
    // Eyes: Knob 2  
    if (key == 'd'){
      eypos = eypos - 1;  

    } 
     if (key == 'f'){
      eypos = eypos + 1;  
    } 
    
    
    // Eyes: Knob 3  
    if (key == 'q'){
      ew = ew - 1; 
    } 
     if (key == 'w'){
      ew = ew + 1; 
    } 
    
    // Eyes: Knob 4  
    if (key == 'e'){
      eh = eh - 1; 
    } 
     
     if (key == 'r'){
      eh = eh + 1; 
    } 
   }
   
   
    ////////////////////////////////////
   // Keyboard Alt : Pupils / Cheeks //
  /////////////////////////////////////
   else if (selectedMenu == 4){
    // Pupils / Cheeks: Knob 1
    if (key == 'a'){
          p = p - 1; 
    } 
     if (key == 's'){
          p = p + 1; 

    }
    
    // Pupils / Cheeks: Knob 2  
    if (key == 'd'){
     chSpacing = chSpacing - 1;   
    } 
     if (key == 'f'){
     chSpacing = chSpacing + 1;   

    } 
    
    
    // Pupils / Cheeks: Knob 3  
    if (key == 'q'){
      chYpos = chYpos - 1; 
    } 
     if (key == 'w'){
      chYpos = chYpos + 1; 

    } 
    
    // Pupils / Cheeks: Knob 4  
    if (key == 'e'){
      ch = ch - 1;  
    } 
     
     if (key == 'r'){
      ch = ch + 1; 
    } 
   }
   
   ////////////////////////////////////
   // Keyboard Alt : Nose             //
  /////////////////////////////////////
   else if (selectedMenu == 5){
    // Nose: Knob 1
    if (key == 'a'){
        noseX = noseX - 1; 

    } 
     if (key == 's'){
        noseX = noseX + 1; 


    }
    
    // Nose: Knob 2  
    if (key == 'd'){
       noseY = noseY - 1;   
    } 
     if (key == 'f'){
       noseY = noseY + 1; 
    } 
    
    
    // Nose: Knob 3  
    if (key == 'q'){
      noseCx = noseCx - 1; 
    } 
     if (key == 'w'){
      noseCx = noseCx + 1;  

    } 
    
    // Nose: Knob 4  
    if (key == 'e'){
      noseCy = noseCy - 1; 
 
    } 
     
     if (key == 'r'){
      noseCy = noseCy + 1; 
 
    } 
   }
   
   ////////////////////////////////////
   // Keyboard Alt : Mouth           //
  /////////////////////////////////////
   else if (selectedMenu == 6){
    // Mouth: Knob 1
    if (key == 'a'){
        mouthX = mouthX - 1; 

    } 
     if (key == 's'){
        mouthX = mouthX + 1; 


    }
    
    // Mouth: Knob 2  
    if (key == 'd'){
       mouthY = mouthY - 1; 
    } 
     if (key == 'f'){
       mouthY = mouthY + 1;  
    } 
    
    
    // Mouth: Knob 3  
    if (key == 'q'){
      mouthCx = mouthCx - 1; 
    } 
     if (key == 'w'){
      mouthCx = mouthCx + 1; 

    } 
    
    // Mouth: Knob 4  
    if (key == 'e'){
      mouthCy = mouthCy - 1; 
 
    } 
     
     if (key == 'r'){
      mouthCy = mouthCy - 1;  
 
    } 
   }
   
   ////////////////////////////////////
   // Keyboard Alt : RGBA CHEEKS     //
  /////////////////////////////////////
   else if (selectedMenu == 7){
    // RGBA Cheeks: Knob 1
    if (key == 'a'){
        chR = chR - 1; 

    } 
     if (key == 's'){
        chR = chR + 1; 


    }
    
    // RGBA Cheeks: Knob 2  
    if (key == 'd'){
       chG = chG - 1; 
    } 
     if (key == 'f'){
       chG = chG + 1;  
    } 
    
    
    // RGBA Cheeks: Knob 3  
    if (key == 'q'){
      chB = chB - 1; 
    } 
     if (key == 'w'){
      chB = chB + 1; 

    } 
    
    // RGBA Cheeks: Knob 4  
    if (key == 'e'){
      chA = chA - 1;
 
    } 
     
     if (key == 'r'){
      chA = chA + 1;
 
    } 
   }
   
    ////////////////////////////////////
   // Keyboard Alt : RGBA BG         //
  /////////////////////////////////////
   else if (selectedMenu == 8){
    // RGBA BG: Knob 1
    if (key == 'a'){
        r = r - 1; 

    } 
     if (key == 's'){
        r = r + 1; 


    }
    
    // RGBA BG: Knob 2  
    if (key == 'd'){
       g = g - 1; 
    } 
     if (key == 'f'){
       g = g + 1;  
    } 
    
    
    // RGBA BG: Knob 3  
    if (key == 'q'){
      b = b - 1; 
    } 
     if (key == 'w'){
      b = b + 1; 

    } 
   }
}
///////////////////////////////
//    GPIO PINOUT CONFIG     //
//      Knobs 1 - 4          //
///////////////////////////////

// knob1 pinout config
int knob1Clk = 17;
int knob1Dt = 18;  
int knob1LastEncoded = 0; 

// knob2 pinout config
int knob2Clk = 22;
int knob2Dt = 27;
int knob2LastEncoded = 0; 

// knob3 pinout config
int knob3Clk = 14;
int knob3Dt = 15;
int knob3LastEncoded = 0; 

// knob4 pinout config
int knob4Clk = 23;
int knob4Dt = 24;
int knob4LastEncoded = 0; 

/////////////////////////////////
//      Buttons 1 - 3         //
////////////////////////////////

// button1 - blue 
// this button will act as the LEFT arrow key
int bluePin = 7; 

// button2 - red
// this button will act as a RANDOMIZE (within certain bounds)
int redPin = 13; 

// button3 - yellow
// this button will act as the RIGHT arrow key
int yellowPin = 21; 
public void randomize(){
  // bezier(hsx, hsy, hcp1x, hcp1y, hcp2x, hcp2y, hex, hey)
    int hsxHexRand = PApplet.parseInt(random(-50, 100)); 
    int hsyHeyRand = PApplet.parseInt(random(-50, 100)); 
    int hcp1xHcp2x = PApplet.parseInt(random(-50, 100)); 
    int hcp1yHcp2y = PApplet.parseInt(random(-50, 50)); 
    
    hsx = 100 - hsxHexRand;
    hsy = 200 + hsyHeyRand;
    hcp1x = 100 - hcp1xHcp2x;
    hcp1y = 450 + hcp1yHcp2y;
    hcp2x = 400 + hcp1xHcp2x;
    hcp2y = 450 + hcp1yHcp2y;
    hex = 400 + hsxHexRand;
    hey = 200 + hsyHeyRand;
    
    // values for the buns
    float bunsXRand = random(0, 100); 
    bun1x = bunsXRand; 
    bun2x = -bunsXRand; 
    buny = 140;
    bunSize = random(10 , 15); 
    
    // values for the hair
    hairk = random(10, 20); 
    hairl = random(-10, 10); 
    hairln = random(40, 200); 
    hairstrw = random(2, 20); 
    
    // values for the eyes 
    espac = random(25, 100); 
    eypos = random(-50, 50); 
    ew = random(80); 
    eh = random(80); 
    
    // values for the pupils 
    p = random(10); 
    
    // values for the cheeks
    chSpacing = random(40, 80); 
    chYpos = random(50, 80); 
    ch = 0; 
    chR = PApplet.parseInt(random(255)); // cheeks r 
    chG = PApplet.parseInt(random(255)); // cheeks g
    chB = PApplet.parseInt(random(255)); // cheeks b
    chA = 100; // cheeks a
    
    // values for the nose 
    noseX = random(-30, 30); 
    noseY = random(-30, 30); 
    noseCx = random(-30, 30);
    noseCy = random(-30, 30); 
    println(noseX, noseY, noseCx, noseCy); 
    
    // values for the mouth 
    mouthX = random(30, 70); 
    mouthY = random(-5, 5); 
    mouthCx = random(10, 35);
    mouthCy = random(-30, 20);
    
    delay(50); 

}
// this function is called because Processing does not support pullups
// with the rotary encoders, specifically
// support pullups
public void updateEncoder(int pin){
  if (selectedMenu == 0) {
    
  ////////////////////////////////////////////
  ////      KNOB 1 : HEAD                 ////
  ////////////////////////////////////////////
  
  int knob1_MSB = GPIO.digitalRead(knob1Clk);
  int knob1_LSB = GPIO.digitalRead(knob1Dt);
  
  int knob1_encoded = (knob1_MSB << 1) | knob1_LSB;
  int knob1_sum = (knob1LastEncoded << 2) | knob1_encoded;
  
  if (knob1_sum == unbinary("1101") || knob1_sum == unbinary("0100") || knob1_sum == unbinary("0010") || knob1_sum == unbinary("1011")) {
    hsx = hsx + 1; 
    hex = hex - 1; 
  }
  
  if (knob1_sum == unbinary("1110") || knob1_sum == unbinary("0111") || knob1_sum == unbinary("0001") || knob1_sum == unbinary("1000")) { 
    hsx = hsx - 1; 
    hex = hex + 1; 
  }

  knob1LastEncoded = knob1_encoded;
  
  ////////////////////////////////////////////
  ////           KNOB 2 : HEAD             ////
  ////////////////////////////////////////////
  
  int knob2_MSB = GPIO.digitalRead(knob2Clk);
  int knob2_LSB = GPIO.digitalRead(knob2Dt);
  
  int knob2_encoded = (knob2_MSB << 1) | knob2_LSB;
  int knob2_sum = (knob2LastEncoded << 2) | knob2_encoded;
  
  if (knob2_sum == unbinary("1101") || knob2_sum == unbinary("0100") || knob2_sum == unbinary("0010") || knob2_sum == unbinary("1011")) {
    hsy = hsy - 1; 
    hey = hey - 1; 
  }
  
  if (knob2_sum == unbinary("1110") || knob2_sum == unbinary("0111") || knob2_sum == unbinary("0001") || knob2_sum == unbinary("1000")) { 
    hsy = hsy + 1; 
    hey = hey + 1; 
  }

  knob2LastEncoded = knob2_encoded;
  
  ////////////////////////////////////////////
  ////           KNOB 3 : HEAD            ////
  ////////////////////////////////////////////
  
  int knob3_MSB = GPIO.digitalRead(knob3Clk);
  int knob3_LSB = GPIO.digitalRead(knob3Dt);
  
  int knob3_encoded = (knob3_MSB << 1) | knob3_LSB;
  int knob3_sum = (knob3LastEncoded << 2) | knob3_encoded;
  
  if (knob3_sum == unbinary("1101") || knob3_sum == unbinary("0100") || knob3_sum == unbinary("0010") || knob3_sum == unbinary("1011")) {
    hcp1x = hcp1x + 1; 
    hcp2x = hcp2x - 1; 
  }
  
  if (knob3_sum == unbinary("1110") || knob3_sum == unbinary("0111") || knob3_sum == unbinary("0001") || knob3_sum == unbinary("1000")) { 
    hcp1x = hcp1x - 1; 
    hcp2x = hcp2x + 1;
  }

  knob3LastEncoded = knob3_encoded;
  
   ////////////////////////////////////////////
  ////           KNOB 4 : HEAD             ////
  ////////////////////////////////////////////
  
  int knob4_MSB = GPIO.digitalRead(knob4Clk);
  int knob4_LSB = GPIO.digitalRead(knob4Dt);
  
  int knob4_encoded = (knob4_MSB << 1) | knob4_LSB;
  int knob4_sum = (knob4LastEncoded << 2) | knob4_encoded;
  
  if (knob4_sum == unbinary("1101") || knob4_sum == unbinary("0100") || knob4_sum == unbinary("0010") || knob4_sum == unbinary("1011")) {
    hcp1y = hcp1y - 2; 
    hcp2y = hcp2y - 2; 
  }
  
  if (knob4_sum == unbinary("1110") || knob4_sum == unbinary("0111") || knob4_sum == unbinary("0001") || knob4_sum == unbinary("1000")) { 
    hcp1y = hcp1y + 2; 
    hcp2y = hcp2y + 2;
  }

  knob4LastEncoded = knob4_encoded;
}
  else if(selectedMenu == 1){
  
    
  ////////////////////////////////////////////
  ////      KNOB 1 : HAIR                 ////
  ////////////////////////////////////////////
  
  int knob1_MSB = GPIO.digitalRead(knob1Clk);
  int knob1_LSB = GPIO.digitalRead(knob1Dt);
  
  int knob1_encoded = (knob1_MSB << 1) | knob1_LSB;
  int knob1_sum = (knob1LastEncoded << 2) | knob1_encoded;
  
  if (knob1_sum == unbinary("1101") || knob1_sum == unbinary("0100") || knob1_sum == unbinary("0010") || knob1_sum == unbinary("1011")) {
    hairl = hairl - 1; 
  }
  
  if (knob1_sum == unbinary("1110") || knob1_sum == unbinary("0111") || knob1_sum == unbinary("0001") || knob1_sum == unbinary("1000")) { 
    hairl = hairl + 1; 
  }

  knob1LastEncoded = knob1_encoded;
  
  ////////////////////////////////////////////
  ////           KNOB 2 : HAIR            ////
  ////////////////////////////////////////////
  
  int knob2_MSB = GPIO.digitalRead(knob2Clk);
  int knob2_LSB = GPIO.digitalRead(knob2Dt);
  
  int knob2_encoded = (knob2_MSB << 1) | knob2_LSB;
  int knob2_sum = (knob2LastEncoded << 2) | knob2_encoded;
  
  if (knob2_sum == unbinary("1101") || knob2_sum == unbinary("0100") || knob2_sum == unbinary("0010") || knob2_sum == unbinary("1011")) {
    hairln = hairln - 1; 
  }
  
  if (knob2_sum == unbinary("1110") || knob2_sum == unbinary("0111") || knob2_sum == unbinary("0001") || knob2_sum == unbinary("1000")) { 
    hairln = hairln + 1; 
  }

  knob2LastEncoded = knob2_encoded;
  
  ////////////////////////////////////////////
  ////           KNOB 3 : HAIR             ////
  ////////////////////////////////////////////
  
  int knob3_MSB = GPIO.digitalRead(knob3Clk);
  int knob3_LSB = GPIO.digitalRead(knob3Dt);
  
  int knob3_encoded = (knob3_MSB << 1) | knob3_LSB;
  int knob3_sum = (knob3LastEncoded << 2) | knob3_encoded;
  
  if (knob3_sum == unbinary("1101") || knob3_sum == unbinary("0100") || knob3_sum == unbinary("0010") || knob3_sum == unbinary("1011")) {
    hairk = hairk - 1;
  }
  
  if (knob3_sum == unbinary("1110") || knob3_sum == unbinary("0111") || knob3_sum == unbinary("0001") || knob3_sum == unbinary("1000")) { 
    hairk = hairk + 1; 
  }

  knob3LastEncoded = knob3_encoded;
  
   ////////////////////////////////////////////
  ////           KNOB 4 : HAIR             ////
  ////////////////////////////////////////////
  
  int knob4_MSB = GPIO.digitalRead(knob4Clk);
  int knob4_LSB = GPIO.digitalRead(knob4Dt);
  
  int knob4_encoded = (knob4_MSB << 1) | knob4_LSB;
  int knob4_sum = (knob4LastEncoded << 2) | knob4_encoded;
  
  if (knob4_sum == unbinary("1101") || knob4_sum == unbinary("0100") || knob4_sum == unbinary("0010") || knob4_sum == unbinary("1011")) {
    if(hairstrw <= 0){
      hairstrw = 0; 
    } else {
      hairstrw = hairstrw - 1;
    }
     
  }
  
  if (knob4_sum == unbinary("1110") || knob4_sum == unbinary("0111") || knob4_sum == unbinary("0001") || knob4_sum == unbinary("1000")) { 
    hairstrw = hairstrw + 1;
  }

  knob4LastEncoded = knob4_encoded;
  }
  else if(selectedMenu == 2){
  ////////////////////////////////////////////
  ////        KNOB 1 : BUN                ////
  ////////////////////////////////////////////
  
  int knob1_MSB = GPIO.digitalRead(knob1Clk);
  int knob1_LSB = GPIO.digitalRead(knob1Dt);
  
  int knob1_encoded = (knob1_MSB << 1) | knob1_LSB;
  int knob1_sum = (knob1LastEncoded << 2) | knob1_encoded;
  
  if (knob1_sum == unbinary("1101") || knob1_sum == unbinary("0100") || knob1_sum == unbinary("0010") || knob1_sum == unbinary("1011")) {
    bun1x = bun1x + 1; 
    bun2x = bun2x - 1;
  }
  
  if (knob1_sum == unbinary("1110") || knob1_sum == unbinary("0111") || knob1_sum == unbinary("0001") || knob1_sum == unbinary("1000")) { 
    bun1x = bun1x - 1; 
    bun2x = bun2x + 1; 
  }

  knob1LastEncoded = knob1_encoded;
  
  ////////////////////////////////////////////
  ////           KNOB 2 : BUN             ////
  ////////////////////////////////////////////
  
  int knob2_MSB = GPIO.digitalRead(knob2Clk);
  int knob2_LSB = GPIO.digitalRead(knob2Dt);
  
  int knob2_encoded = (knob2_MSB << 1) | knob2_LSB;
  int knob2_sum = (knob2LastEncoded << 2) | knob2_encoded;
  
  if (knob2_sum == unbinary("1101") || knob2_sum == unbinary("0100") || knob2_sum == unbinary("0010") || knob2_sum == unbinary("1011")) {
    buny = buny - 1;  
  }
  
  if (knob2_sum == unbinary("1110") || knob2_sum == unbinary("0111") || knob2_sum == unbinary("0001") || knob2_sum == unbinary("1000")) { 
    buny = buny + 1; 
  }

  knob2LastEncoded = knob2_encoded;
  
  ////////////////////////////////////////////
  ////           KNOB 3 : BUN             ////
  ////////////////////////////////////////////
  
  int knob3_MSB = GPIO.digitalRead(knob3Clk);
  int knob3_LSB = GPIO.digitalRead(knob3Dt);
  
  int knob3_encoded = (knob3_MSB << 1) | knob3_LSB;
  int knob3_sum = (knob3LastEncoded << 2) | knob3_encoded;
  
  if (knob3_sum == unbinary("1101") || knob3_sum == unbinary("0100") || knob3_sum == unbinary("0010") || knob3_sum == unbinary("1011")) {
    bunSize = bunSize - .5f; 
  }
  
  if (knob3_sum == unbinary("1110") || knob3_sum == unbinary("0111") || knob3_sum == unbinary("0001") || knob3_sum == unbinary("1000")) { 
    bunSize = bunSize + .5f; 
  }

  knob3LastEncoded = knob3_encoded;
  
   ////////////////////////////////////////////
  ////           KNOB 4 : BUN              ////
  ////////////////////////////////////////////
  
  int knob4_MSB = GPIO.digitalRead(knob4Clk);
  int knob4_LSB = GPIO.digitalRead(knob4Dt);
  
  int knob4_encoded = (knob4_MSB << 1) | knob4_LSB;
  int knob4_sum = (knob4LastEncoded << 2) | knob4_encoded;
  
  if (knob4_sum == unbinary("1101") || knob4_sum == unbinary("0100") || knob4_sum == unbinary("0010") || knob4_sum == unbinary("1011")) {
    if(hairstrw <= 0){
      hairstrw = 0; 
    } else {
      hairstrw = hairstrw - 1;
    }
     
  }
  
  if (knob4_sum == unbinary("1110") || knob4_sum == unbinary("0111") || knob4_sum == unbinary("0001") || knob4_sum == unbinary("1000")) { 
    hairstrw = hairstrw + 1;
  }

  knob4LastEncoded = knob4_encoded;
  }
  
   else if(selectedMenu == 3){
  ////////////////////////////////////////////
  ////        KNOB 1 : EYES                ////
  ////////////////////////////////////////////
  
  int knob1_MSB = GPIO.digitalRead(knob1Clk);
  int knob1_LSB = GPIO.digitalRead(knob1Dt);
  
  int knob1_encoded = (knob1_MSB << 1) | knob1_LSB;
  int knob1_sum = (knob1LastEncoded << 2) | knob1_encoded;
  
  if (knob1_sum == unbinary("1101") || knob1_sum == unbinary("0100") || knob1_sum == unbinary("0010") || knob1_sum == unbinary("1011")) {
    espac = espac - 1;
  }
  
  if (knob1_sum == unbinary("1110") || knob1_sum == unbinary("0111") || knob1_sum == unbinary("0001") || knob1_sum == unbinary("1000")) { 
     espac = espac + 1;
  }

  knob1LastEncoded = knob1_encoded;
  
  ////////////////////////////////////////////
  ////           KNOB 2 : EYES            ////
  ////////////////////////////////////////////
  
  int knob2_MSB = GPIO.digitalRead(knob2Clk);
  int knob2_LSB = GPIO.digitalRead(knob2Dt);
  
  int knob2_encoded = (knob2_MSB << 1) | knob2_LSB;
  int knob2_sum = (knob2LastEncoded << 2) | knob2_encoded;
  
  if (knob2_sum == unbinary("1101") || knob2_sum == unbinary("0100") || knob2_sum == unbinary("0010") || knob2_sum == unbinary("1011")) {
    eypos = eypos - 1;  
  }
  
  if (knob2_sum == unbinary("1110") || knob2_sum == unbinary("0111") || knob2_sum == unbinary("0001") || knob2_sum == unbinary("1000")) { 
    eypos = eypos + 1;  
  }

  knob2LastEncoded = knob2_encoded;
  
  ////////////////////////////////////////////
  ////           KNOB 3 : EYES            ////
  ////////////////////////////////////////////
  
  int knob3_MSB = GPIO.digitalRead(knob3Clk);
  int knob3_LSB = GPIO.digitalRead(knob3Dt);
  
  int knob3_encoded = (knob3_MSB << 1) | knob3_LSB;
  int knob3_sum = (knob3LastEncoded << 2) | knob3_encoded;
  
  if (knob3_sum == unbinary("1101") || knob3_sum == unbinary("0100") || knob3_sum == unbinary("0010") || knob3_sum == unbinary("1011")) {
    ew = ew - 1; 
  }
  
  if (knob3_sum == unbinary("1110") || knob3_sum == unbinary("0111") || knob3_sum == unbinary("0001") || knob3_sum == unbinary("1000")) { 
    ew = ew + 1; 
  }

  knob3LastEncoded = knob3_encoded;
  
   ////////////////////////////////////////////
  ////           KNOB 4 : EYES             ////
  ////////////////////////////////////////////
  
  int knob4_MSB = GPIO.digitalRead(knob4Clk);
  int knob4_LSB = GPIO.digitalRead(knob4Dt);
  
  int knob4_encoded = (knob4_MSB << 1) | knob4_LSB;
  int knob4_sum = (knob4LastEncoded << 2) | knob4_encoded;
  
  if (knob4_sum == unbinary("1101") || knob4_sum == unbinary("0100") || knob4_sum == unbinary("0010") || knob4_sum == unbinary("1011")) {
     eh = eh - 1; 
     
  }
  
  if (knob4_sum == unbinary("1110") || knob4_sum == unbinary("0111") || knob4_sum == unbinary("0001") || knob4_sum == unbinary("1000")) { 
     eh = eh + 1; 
  }

  knob4LastEncoded = knob4_encoded;
  }
  
  else if(selectedMenu == 4){
  ////////////////////////////////////////////
  ////        KNOB 5 : PUPILS              ////
  ////////////////////////////////////////////
  
  int knob1_MSB = GPIO.digitalRead(knob1Clk);
  int knob1_LSB = GPIO.digitalRead(knob1Dt);
  
  int knob1_encoded = (knob1_MSB << 1) | knob1_LSB;
  int knob1_sum = (knob1LastEncoded << 2) | knob1_encoded;
  
  if (knob1_sum == unbinary("1101") || knob1_sum == unbinary("0100") || knob1_sum == unbinary("0010") || knob1_sum == unbinary("1011")) {
    p = p - 1; 
  }
  
  if (knob1_sum == unbinary("1110") || knob1_sum == unbinary("0111") || knob1_sum == unbinary("0001") || knob1_sum == unbinary("1000")) { 
    p = p + 1; 
  }

  knob1LastEncoded = knob1_encoded;
  
  ////////////////////////////////////////////
  ////           KNOB 2 : CHEEKS           ////
  ////////////////////////////////////////////
  
  int knob2_MSB = GPIO.digitalRead(knob2Clk);
  int knob2_LSB = GPIO.digitalRead(knob2Dt);
  
  int knob2_encoded = (knob2_MSB << 1) | knob2_LSB;
  int knob2_sum = (knob2LastEncoded << 2) | knob2_encoded;
  
  if (knob2_sum == unbinary("1101") || knob2_sum == unbinary("0100") || knob2_sum == unbinary("0010") || knob2_sum == unbinary("1011")) {
    chSpacing = chSpacing - 1;   
  }
  
  if (knob2_sum == unbinary("1110") || knob2_sum == unbinary("0111") || knob2_sum == unbinary("0001") || knob2_sum == unbinary("1000")) { 
    chSpacing = chSpacing + 1;  
  }

  knob2LastEncoded = knob2_encoded;
  
  ////////////////////////////////////////////
  ////           KNOB 3 : EYES            ////
  ////////////////////////////////////////////
  
  int knob3_MSB = GPIO.digitalRead(knob3Clk);
  int knob3_LSB = GPIO.digitalRead(knob3Dt);
  
  int knob3_encoded = (knob3_MSB << 1) | knob3_LSB;
  int knob3_sum = (knob3LastEncoded << 2) | knob3_encoded;
  
  if (knob3_sum == unbinary("1101") || knob3_sum == unbinary("0100") || knob3_sum == unbinary("0010") || knob3_sum == unbinary("1011")) {
    chYpos = chYpos - 1; 
  }
  
  if (knob3_sum == unbinary("1110") || knob3_sum == unbinary("0111") || knob3_sum == unbinary("0001") || knob3_sum == unbinary("1000")) { 
    chYpos = chYpos + 1; 
  }

  knob3LastEncoded = knob3_encoded;
  
   ////////////////////////////////////////////
  ////           KNOB 4 : EYES             ////
  ////////////////////////////////////////////
  
  int knob4_MSB = GPIO.digitalRead(knob4Clk);
  int knob4_LSB = GPIO.digitalRead(knob4Dt);
  
  int knob4_encoded = (knob4_MSB << 1) | knob4_LSB;
  int knob4_sum = (knob4LastEncoded << 2) | knob4_encoded;
  
  if (knob4_sum == unbinary("1101") || knob4_sum == unbinary("0100") || knob4_sum == unbinary("0010") || knob4_sum == unbinary("1011")) {
     ch = ch - 1; 
     
  }
  
  if (knob4_sum == unbinary("1110") || knob4_sum == unbinary("0111") || knob4_sum == unbinary("0001") || knob4_sum == unbinary("1000")) { 
     ch = ch + 1; 
  }

  knob4LastEncoded = knob4_encoded;
  }
  
   else if(selectedMenu == 5){
  ////////////////////////////////////////////
  ////        KNOB 6 : NOSE              ////
  ////////////////////////////////////////////
  
  int knob1_MSB = GPIO.digitalRead(knob1Clk);
  int knob1_LSB = GPIO.digitalRead(knob1Dt);
  
  int knob1_encoded = (knob1_MSB << 1) | knob1_LSB;
  int knob1_sum = (knob1LastEncoded << 2) | knob1_encoded;
  
  if (knob1_sum == unbinary("1101") || knob1_sum == unbinary("0100") || knob1_sum == unbinary("0010") || knob1_sum == unbinary("1011")) {
    noseX = noseX - 1; 
  }
  
  if (knob1_sum == unbinary("1110") || knob1_sum == unbinary("0111") || knob1_sum == unbinary("0001") || knob1_sum == unbinary("1000")) { 
    noseX = noseX + 1; 
  }

  knob1LastEncoded = knob1_encoded;
  
  ////////////////////////////////////////////
  ////           KNOB 2 : NOSE            ////
  ////////////////////////////////////////////
  
  int knob2_MSB = GPIO.digitalRead(knob2Clk);
  int knob2_LSB = GPIO.digitalRead(knob2Dt);
  
  int knob2_encoded = (knob2_MSB << 1) | knob2_LSB;
  int knob2_sum = (knob2LastEncoded << 2) | knob2_encoded;
  
  if (knob2_sum == unbinary("1101") || knob2_sum == unbinary("0100") || knob2_sum == unbinary("0010") || knob2_sum == unbinary("1011")) {
    noseY = noseY - 1; 
  }
  
  if (knob2_sum == unbinary("1110") || knob2_sum == unbinary("0111") || knob2_sum == unbinary("0001") || knob2_sum == unbinary("1000")) { 
        noseY = noseY + 1; 
  }

  knob2LastEncoded = knob2_encoded;
  
  ////////////////////////////////////////////
  ////           KNOB 3 : NOSE            ////
  ////////////////////////////////////////////
  
  int knob3_MSB = GPIO.digitalRead(knob3Clk);
  int knob3_LSB = GPIO.digitalRead(knob3Dt);
  
  int knob3_encoded = (knob3_MSB << 1) | knob3_LSB;
  int knob3_sum = (knob3LastEncoded << 2) | knob3_encoded;
  
  if (knob3_sum == unbinary("1101") || knob3_sum == unbinary("0100") || knob3_sum == unbinary("0010") || knob3_sum == unbinary("1011")) {
    noseCx = noseCx - 1; 
  }
  
  if (knob3_sum == unbinary("1110") || knob3_sum == unbinary("0111") || knob3_sum == unbinary("0001") || knob3_sum == unbinary("1000")) { 
    noseCx = noseCx + 1; 
  }

  knob3LastEncoded = knob3_encoded;
  
   ////////////////////////////////////////////
  ////           KNOB 4 : Nose             ////
  ////////////////////////////////////////////
  
  int knob4_MSB = GPIO.digitalRead(knob4Clk);
  int knob4_LSB = GPIO.digitalRead(knob4Dt);
  
  int knob4_encoded = (knob4_MSB << 1) | knob4_LSB;
  int knob4_sum = (knob4LastEncoded << 2) | knob4_encoded;
  
  if (knob4_sum == unbinary("1101") || knob4_sum == unbinary("0100") || knob4_sum == unbinary("0010") || knob4_sum == unbinary("1011")) {
     noseCy = noseCy - 1; 
     
  }
  
  if (knob4_sum == unbinary("1110") || knob4_sum == unbinary("0111") || knob4_sum == unbinary("0001") || knob4_sum == unbinary("1000")) { 
     noseCy = noseCy + 1; 
  }

  knob4LastEncoded = knob4_encoded;
  }
  
  else if(selectedMenu == 6){
  ////////////////////////////////////////////
  ////        KNOB 1 : MOUTH              ////
  ////////////////////////////////////////////
  
  int knob1_MSB = GPIO.digitalRead(knob1Clk);
  int knob1_LSB = GPIO.digitalRead(knob1Dt);
  
  int knob1_encoded = (knob1_MSB << 1) | knob1_LSB;
  int knob1_sum = (knob1LastEncoded << 2) | knob1_encoded;
  
  if (knob1_sum == unbinary("1101") || knob1_sum == unbinary("0100") || knob1_sum == unbinary("0010") || knob1_sum == unbinary("1011")) {
    mouthX = mouthX - 1; 
  }
  
  if (knob1_sum == unbinary("1110") || knob1_sum == unbinary("0111") || knob1_sum == unbinary("0001") || knob1_sum == unbinary("1000")) { 
    mouthX = mouthX + 1; 
  }

  knob1LastEncoded = knob1_encoded;
  
  ////////////////////////////////////////////
  ////           KNOB 2 : MOUTH           ////
  ////////////////////////////////////////////
  
  int knob2_MSB = GPIO.digitalRead(knob2Clk);
  int knob2_LSB = GPIO.digitalRead(knob2Dt);
  
  int knob2_encoded = (knob2_MSB << 1) | knob2_LSB;
  int knob2_sum = (knob2LastEncoded << 2) | knob2_encoded;
  
  if (knob2_sum == unbinary("1101") || knob2_sum == unbinary("0100") || knob2_sum == unbinary("0010") || knob2_sum == unbinary("1011")) {
    mouthY = mouthY - 1; 
  }
  
  if (knob2_sum == unbinary("1110") || knob2_sum == unbinary("0111") || knob2_sum == unbinary("0001") || knob2_sum == unbinary("1000")) { 
        mouthY = mouthY + 1; 
  }

  knob2LastEncoded = knob2_encoded;
  
  ////////////////////////////////////////////
  ////           KNOB 3 : MOUTH           ////
  ////////////////////////////////////////////
  
  int knob3_MSB = GPIO.digitalRead(knob3Clk);
  int knob3_LSB = GPIO.digitalRead(knob3Dt);
  
  int knob3_encoded = (knob3_MSB << 1) | knob3_LSB;
  int knob3_sum = (knob3LastEncoded << 2) | knob3_encoded;
  
  if (knob3_sum == unbinary("1101") || knob3_sum == unbinary("0100") || knob3_sum == unbinary("0010") || knob3_sum == unbinary("1011")) {
    mouthCx = mouthCx - 1; 
  }
  
  if (knob3_sum == unbinary("1110") || knob3_sum == unbinary("0111") || knob3_sum == unbinary("0001") || knob3_sum == unbinary("1000")) { 
    mouthCx = mouthCx + 1; 
  }

  knob3LastEncoded = knob3_encoded;
  
   ////////////////////////////////////////////
  ////           KNOB 4 : MOUTH            ////
  ////////////////////////////////////////////
  
  int knob4_MSB = GPIO.digitalRead(knob4Clk);
  int knob4_LSB = GPIO.digitalRead(knob4Dt);
  
  int knob4_encoded = (knob4_MSB << 1) | knob4_LSB;
  int knob4_sum = (knob4LastEncoded << 2) | knob4_encoded;
  
  if (knob4_sum == unbinary("1101") || knob4_sum == unbinary("0100") || knob4_sum == unbinary("0010") || knob4_sum == unbinary("1011")) {
     mouthCy = mouthCy - 1; 
     
  }
  
  if (knob4_sum == unbinary("1110") || knob4_sum == unbinary("0111") || knob4_sum == unbinary("0001") || knob4_sum == unbinary("1000")) { 
     mouthCy = mouthCy + 1; 
  }

  knob4LastEncoded = knob4_encoded;
  }
  
  else if(selectedMenu == 7){
  ////////////////////////////////////////////
  ////        KNOB 1 : RGBA CHEEKS        ////
  ////////////////////////////////////////////
  
  int knob1_MSB = GPIO.digitalRead(knob1Clk);
  int knob1_LSB = GPIO.digitalRead(knob1Dt);
  
  int knob1_encoded = (knob1_MSB << 1) | knob1_LSB;
  int knob1_sum = (knob1LastEncoded << 2) | knob1_encoded;
  
  if (knob1_sum == unbinary("1101") || knob1_sum == unbinary("0100") || knob1_sum == unbinary("0010") || knob1_sum == unbinary("1011")) {
    chR = chR - 1; 
  }
  
  if (knob1_sum == unbinary("1110") || knob1_sum == unbinary("0111") || knob1_sum == unbinary("0001") || knob1_sum == unbinary("1000")) { 
    chR = chR + 1; 
  }

  knob1LastEncoded = knob1_encoded;
  
  ////////////////////////////////////////////
  ////           KNOB 2 : RGBA CHEEKS     ////
  ////////////////////////////////////////////
  
  int knob2_MSB = GPIO.digitalRead(knob2Clk);
  int knob2_LSB = GPIO.digitalRead(knob2Dt);
  
  int knob2_encoded = (knob2_MSB << 1) | knob2_LSB;
  int knob2_sum = (knob2LastEncoded << 2) | knob2_encoded;
  
  if (knob2_sum == unbinary("1101") || knob2_sum == unbinary("0100") || knob2_sum == unbinary("0010") || knob2_sum == unbinary("1011")) {
    chG = chG - 1;  
  }
  
  if (knob2_sum == unbinary("1110") || knob2_sum == unbinary("0111") || knob2_sum == unbinary("0001") || knob2_sum == unbinary("1000")) { 
    chG = chG + 1; 
  }

  knob2LastEncoded = knob2_encoded;
  
  ////////////////////////////////////////////
  ////           KNOB 3 : RGBA CHEEKS     ////
  ////////////////////////////////////////////
  
  int knob3_MSB = GPIO.digitalRead(knob3Clk);
  int knob3_LSB = GPIO.digitalRead(knob3Dt);
  
  int knob3_encoded = (knob3_MSB << 1) | knob3_LSB;
  int knob3_sum = (knob3LastEncoded << 2) | knob3_encoded;
  
  if (knob3_sum == unbinary("1101") || knob3_sum == unbinary("0100") || knob3_sum == unbinary("0010") || knob3_sum == unbinary("1011")) {
    chB = chB - 1; 
  }
  
  if (knob3_sum == unbinary("1110") || knob3_sum == unbinary("0111") || knob3_sum == unbinary("0001") || knob3_sum == unbinary("1000")) { 
    chB = chB + 1; 
  }

  knob3LastEncoded = knob3_encoded;
  
   ////////////////////////////////////////////
  ////           KNOB 4 : RGBA CHEEKS      ////
  ////////////////////////////////////////////
  
  int knob4_MSB = GPIO.digitalRead(knob4Clk);
  int knob4_LSB = GPIO.digitalRead(knob4Dt);
  
  int knob4_encoded = (knob4_MSB << 1) | knob4_LSB;
  int knob4_sum = (knob4LastEncoded << 2) | knob4_encoded;
  
  if (knob4_sum == unbinary("1101") || knob4_sum == unbinary("0100") || knob4_sum == unbinary("0010") || knob4_sum == unbinary("1011")) {
     chA = chA - 1;
     
  }
  
  if (knob4_sum == unbinary("1110") || knob4_sum == unbinary("0111") || knob4_sum == unbinary("0001") || knob4_sum == unbinary("1000")) { 
     chA = chA + 1; 
  }

  knob4LastEncoded = knob4_encoded;
  }
  
  
  
  
  
  
  
  
  
  
  else if(selectedMenu == 8){
  ////////////////////////////////////////////
  ////        KNOB 1 : RGBA BG       ////
  ////////////////////////////////////////////
  
  int knob1_MSB = GPIO.digitalRead(knob1Clk);
  int knob1_LSB = GPIO.digitalRead(knob1Dt);
  
  int knob1_encoded = (knob1_MSB << 1) | knob1_LSB;
  int knob1_sum = (knob1LastEncoded << 2) | knob1_encoded;
  
  if (knob1_sum == unbinary("1101") || knob1_sum == unbinary("0100") || knob1_sum == unbinary("0010") || knob1_sum == unbinary("1011")) {
    r = r - 5; 
  }
  
  if (knob1_sum == unbinary("1110") || knob1_sum == unbinary("0111") || knob1_sum == unbinary("0001") || knob1_sum == unbinary("1000")) { 
    r = r + 5; 
  }

  knob1LastEncoded = knob1_encoded;
  
  ////////////////////////////////////////////
  ////           KNOB 2 : RGBA BG     ////
  ////////////////////////////////////////////
  
  int knob2_MSB = GPIO.digitalRead(knob2Clk);
  int knob2_LSB = GPIO.digitalRead(knob2Dt);
  
  int knob2_encoded = (knob2_MSB << 1) | knob2_LSB;
  int knob2_sum = (knob2LastEncoded << 2) | knob2_encoded;
  
  if (knob2_sum == unbinary("1101") || knob2_sum == unbinary("0100") || knob2_sum == unbinary("0010") || knob2_sum == unbinary("1011")) {
    g = g - 5;  
  }
  
  if (knob2_sum == unbinary("1110") || knob2_sum == unbinary("0111") || knob2_sum == unbinary("0001") || knob2_sum == unbinary("1000")) { 
    g = g + 5; 
  }

  knob2LastEncoded = knob2_encoded;
  
  ////////////////////////////////////////////
  ////           KNOB 3 : RGBA BG     ////
  ////////////////////////////////////////////
  
  int knob3_MSB = GPIO.digitalRead(knob3Clk);
  int knob3_LSB = GPIO.digitalRead(knob3Dt);
  
  int knob3_encoded = (knob3_MSB << 1) | knob3_LSB;
  int knob3_sum = (knob3LastEncoded << 2) | knob3_encoded;
  
  if (knob3_sum == unbinary("1101") || knob3_sum == unbinary("0100") || knob3_sum == unbinary("0010") || knob3_sum == unbinary("1011")) {
    b = b - 5; 
  }
  
  if (knob3_sum == unbinary("1110") || knob3_sum == unbinary("0111") || knob3_sum == unbinary("0001") || knob3_sum == unbinary("1000")) { 
    b = b + 5; 
  }

  knob3LastEncoded = knob3_encoded;
  }
}
  public void settings() {  fullScreen(); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "--present", "--window-color=#666666", "--hide-stop", "face" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}

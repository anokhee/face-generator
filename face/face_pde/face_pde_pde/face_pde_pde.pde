import processing.io.*; 

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

///////////////////////////////
//    GLOBAL VARIABLES       //
//      RE: UPPER MENU       //
///////////////////////////////

String[] menu = {"head »", "« hair »", "« buns »", "« eyes »", "« eyes 2 »", "« nose »", "« mouth"}; // array for menu items 
int selectedMenu = 0; // index position of current menu item; menu COUNTER 
String menuText = menu[selectedMenu]; // declares menu as initially blank 

// global font variable
PFont f; // empty declaration for font

// global variables for the HEAD 
// bezier(hsx, hsy, hcp1x, hcp1y, hcp2x, hcp2y, hex, hey)
float hsx = 100;
float hsy = 200;
float hcp1x = 100;
float hcp1y = 450;
float hcp2x = 400;
float hcp2y = 450;
float hex = 400;
float hey = 200;

// values for the buns
int bun1x = 0; 
int bun2x = 0; 
int buny = 150;
float bunSize = 10; 

// values for the hair
int hairk = 15; 
int hairl = 6; 
int hairln = 160; 
int hairstrw = 4; 

// values for the eyes 
int espac = 50; 
int eypos = 0; 
int ew = 60; 
int eh = 40; 

// values for the pupils 
float p = 2; 

// values for the nose 
int noseX = 10; 
int noseY = 0; 
int noseCx = 40;
int noseCy = 0;  

// values for the mouth 
int mouthX = 50; 
int mouthY = 0; 
int mouthCx = 25;
int mouthCy = 0;  

void setup(){
  size(500, 500);
  //fullScreen(); 
  
  
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

  // setup for standard font 
  f = createFont("Arial", 16, true); 
}

void draw(){
  //translate(width/2 - 250, height/2 - 250); 

  // clears background with every draw
  // fourth parameter specifies alpha -- 80% will leave a slight trail upon change
  fill(255, 255, 255, 80);
  rect(0, 0, width * 2, height * 2); // white bg
  
  
  // sets up font styling / placement for MENU  
  textAlign(CENTER); 
  fill(0);  // black text 
  textFont(f, 24); // sets font f to 24px in size 
  text(menuText, 250, 30); // displays menu text at coordinates (250, 30) 
  
  fill(255); // gives the HEAD a fill of '255' / white 
  stroke(0); // '0' / black stroke 
  strokeWeight(4); // sets linewidth 
  
  // buns (bun1x, bun2x, buny, bunSize) 
  // note -- if bunsize is reduced to 0, there will be no bun
  strokeWeight(hairstrw); // linewidth for hair & buns 
  for (float i = bunSize; i > 0; i = i -1){
    ellipse(hsx + bun1x, buny, i * i, i * i); 
    ellipse(hex + bun2x, buny, i * i, i * i); 
  }
  
  
  rectMode(CENTER); // rect fills in gap that bezier leaves 
                    // between forehead and hair
  noStroke(); 
  rect(250, 206, 220, 110); // ^^ 
 
 // head (hsx, hsy, hcp1x, hcp1y, hcp2x, hcp2y, hex, hey)
  fill(255, 255, 255);
  stroke(0); 
  strokeWeight(4);
  bezier(hsx, hsy, hcp1x, hcp1y, hcp2x, hcp2y, hex, hey);
  
  // hair (hsx, hex, hairl, hairln) 
  strokeWeight(hairstrw); 
  for(int i = 0; i < hairk; i = i + 1){ 
    bezier(hsx, 200 + i * hairl, hsx, 100 + i * i, 250, 120, 250, hairln);
    bezier(hex, 200 + i * hairl, hex, 100 + i * i, 250, 120, 250, hairln);    
  }

  fill(255, 255, 255); 
  strokeWeight(4); 
  
  // eyes (250 +- espac, 250 + eypos, ew, eh) 
  ellipse(250 - espac, 250 + eypos, ew, eh);
  ellipse(250 + espac, 250 + eypos, ew, eh);
  
  // pupils
  fill(0); 
  ellipse(250 - espac, 250 + eypos, p, p); 
  ellipse(250 + espac, 250 + eypos, p, p); 
  
  // eyebrows
  noFill(); 

  fill(255, 255, 255); 
  
  // nose
  bezier(250 - noseX, 300 + noseY, 250 - noseCx, 250 + noseCy, 250 + noseCx, 250 + noseCy, 250 + noseX, 300 + noseY); 
  
  // mouth 
  bezier(250 - mouthX, 320 + mouthY, 250 - mouthCx, 330 + mouthCy, 250 + mouthCx, 330 + mouthCy, 250 + mouthX, 320 + mouthY); 

  
  //// DEBUG
  //fill(random(255), random(255), random(255)); 
  //ellipse(250, 250, test, test); 

  noStroke();
  
  

}

void keyPressed(){
  // codes interactivity with menu (keyboard)  
  menuText = menu[selectedMenu]; 
 
  if(key == CODED){
    if (keyCode == LEFT){
    if(selectedMenu <= 0){
      selectedMenu = 0; 
    }
    else {
      selectedMenu = selectedMenu - 1;
    }
     
    println(menu[selectedMenu]); 
  }
    else if (keyCode == RIGHT){
      if(selectedMenu >= menu.length - 1){
        selectedMenu = menu.length - 1;
      }
      else {
        selectedMenu = selectedMenu + 1; 
        
      }
      
    println(menu[selectedMenu]); 
    }
  }
  
}



void updateEncoder(int pin){
  if (selectedMenu == 0) {
    
  ////////////////////////////////////////////
  ////      KNOB 1 : HEAD                 ////
  ////////////////////////////////////////////
  
  int knob1_MSB = GPIO.digitalRead(knob1Clk);
  int knob1_LSB = GPIO.digitalRead(knob1Dt);
  
  int knob1_encoded = (knob1_MSB << 1) | knob1_LSB;
  int knob1_sum = (knob1LastEncoded << 2) | knob1_encoded;
  
  if (knob1_sum == unbinary("1101") || knob1_sum == unbinary("0100") || knob1_sum == unbinary("0010") || knob1_sum == unbinary("1011")) {
    hsx = hsx - 1; 
    hex = hex + 1; 
  }
  
  if (knob1_sum == unbinary("1110") || knob1_sum == unbinary("0111") || knob1_sum == unbinary("0001") || knob1_sum == unbinary("1000")) { 
    hsx = hsx + 1; 
    hex = hex - 1; 
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
    bunSize = bunSize - .5; 
  }
  
  if (knob3_sum == unbinary("1110") || knob3_sum == unbinary("0111") || knob3_sum == unbinary("0001") || knob3_sum == unbinary("1000")) { 
    bunSize = bunSize + .5; 
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
}

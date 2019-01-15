import processing.io.*; 

void setup(){
  //size(600, 600);
  fullScreen(); 

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

void draw(){ 
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
  text(menuText, 250, -7.5); // displays menu text at coordinates (250, 30) 
  
  if (GPIO.digitalRead(bluePin) == GPIO.LOW) {
    if(selectedMenu <= 0){
      selectedMenu = 0; 
    }
    else {
      selectedMenu = selectedMenu - 1;
    }
    menuText = menu[selectedMenu]; 
    delay(100); 
  }
  
  if (GPIO.digitalRead(yellowPin) == GPIO.LOW){
    if(selectedMenu >= menu.length - 1){
        selectedMenu = menu.length - 1;
      }
      else {
        selectedMenu = selectedMenu + 1; 
        
      }
      menuText = menu[selectedMenu];
      delay(100); 
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

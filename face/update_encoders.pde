// this function is called because Processing does not support pullups
// with the rotary encoders, specifically
// support pullups
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
  ////        KNOB 1 : RGBA CHEEKS        ////
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
  ////           KNOB 2 : RGBA CHEEKS     ////
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
  ////           KNOB 3 : RGBA CHEEKS     ////
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

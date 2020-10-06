void keyPressed(){
  
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
      bunSize = bunSize - .5; 
    } 
     if (key == 'w'){
      bunSize = bunSize + .5; 
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

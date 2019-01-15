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

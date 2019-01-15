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
int espac = 50; 
int eypos = 0; 
int ew = 60; 
int eh = 40; 

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
int noseX = 10; 
int noseY = 0; 
int noseCx = 40;
int noseCy = 0;  

// values for the MOUTH 
int mouthX = 50; 
int mouthY = 0; 
int mouthCx = 25;
int mouthCy = 0;  

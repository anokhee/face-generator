void randomize(){
  // bezier(hsx, hsy, hcp1x, hcp1y, hcp2x, hcp2y, hex, hey)
    int hsxHexRand = int(random(-50, 100)); 
    int hsyHeyRand = int(random(-50, 100)); 
    int hcp1xHcp2x = int(random(-50, 100)); 
    int hcp1yHcp2y = int(random(-50, 50)); 
    
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
    chR = int(random(255)); // cheeks r 
    chG = int(random(255)); // cheeks g
    chB = int(random(255)); // cheeks b
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

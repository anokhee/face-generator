void setup(){
  size(500, 500); 
  background(255, 255, 255); 
}

// values for head bezier curve

float hsx = 100;
float hsy = 200;
float hcp1x = 100;
float hcp1y = 450;
float hcp2x = 400;
float hcp2y = 450;
float hex = 400;
float hey = 200;

// values for the buns

int bun1x = 100; 
int bun2x = 400; 
int buny = 150; 


void draw()
{
  rect(0, 0, width * 2, height * 2); 
  
   //fill(0,0,0);
  strokeWeight(4); 
  
  for (int i = 10; i > 0; i = i -1){
    ellipse(bun1x, buny, i * i, i * i); 
    ellipse(bun2x, buny, i * i, i * i); 
  }
  
  // head 
  //fill(10, 10, 10); 
  bezier(hsx, hsy, hcp1x, hcp1y, hcp2x, hcp2y, hex, hey);
  
  // hair

  

  
  for(int i = 0; i < 15; i = i + 1){
     
    bezier(hsx, 200 + i * 6, hsx, 100 + i * i, 250, 120, 250, 160);
    bezier(hex, 200 + i * 6, hex, 100 + i * i, 250, 120, 250, 160);
     
  }
  



  
   

    
  
  
  
  

  fill(255, 255, 255); 
  // eyes 
  ellipse(250 - 50, 250, 60, 40); 
  ellipse(250 + 50, 250, 60, 40);
  
  // pupils
  for(int i = 10; i > 0; i = i - 1){
    ellipse(250 - 50, 250, i/2 * i/2, i/2 * i/2); 
    ellipse(250 + 50, 250, i/2 * i/2, i/2 * i/2); 
  }
  
  // nose
  triangle(250, 300 - 30, 250 - 20, 300, 250 + 20, 300); 
  
  // mouth 
  bezier(250 - 50, 320, 250 - 25, 330, 250 + 25, 330, 250 + 50, 320); 
  
  

}

void keyPressed(){
  if (key == 'a'){
    hsx = hsx - 1; 
    hex = hex + 1;
    
    hsy = hsy + 1; 
    hey = hey + 1; 
    
    hcp1x = hcp1x - 1; 
    hcp2x = hcp2x + 1;
    
    hcp1y = hcp1y + 1; 
    hcp2y = hcp2y + 1; 
  }
  
    if (key == 's'){
    hsx = hsx + 1; 
    hex = hex - 1;
    
    hsy = hsy - 1; 
    hey = hey - 1; 
    
    hcp1x = hcp1x + 1; 
    hcp2x = hcp2x - 1;
    
    hcp1y = hcp1y - 1; 
    hcp2y = hcp2y - 1; 
  }
  if (key == 'z'){
    bun1x = bun1x + 1; 
    bun2x = bun2x - 1; 
    
  }
   if (key == 'x'){
    buny = buny - 1; 
    
  }
  
 
}

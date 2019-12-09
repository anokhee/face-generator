function setup() {
  createCanvas(windowWidth, windowHeight);
}

function draw() {
  background(110, 150, 210);
  noStroke();

  let hsx = windowWidth / 2 - 150;
  let hsy = windowHeight / 2;
  let hcp1x = windowWidth / 2 - 120;
  let hcp1y = windowHeight / 2 + 250;
  let hcp2x = windowWidth / 2 + 120;
  let hcp2y = windowHeight / 2 + 250;
  let hex = windowWidth / 2 + 150;
  let hey = windowHeight / 2;

  let bun1x = 0;
  let bun2x = 0;
  let buny = height / 2 - 50;
  let bunSize = 10;

  let hairk = 15;
  let hairl = 8;
  let hairln = windowHeight/2 - windowHeight/8;


  let espac = 50;
  let eypos = windowHeight / 2 + 40;
  let ew = 60;
  let eh = 30;

  let p = 30;

  let chSpacing = 80;
  let chYpos = windowHeight / 2 - 175;
  let ch = 50;

  let noseX = 20;
  let noseY = windowHeight / 2 + 105;
  let noseCx = 25;
  let noseCy = 80;

  let mouthX = 40;
  let mouthY = windowHeight / 2 + 125;
  let mouthCx = 250 / 4;
  let mouthCy = windowHeight / 2 + 150;

  strokeWeight(5);
  stroke(64, 39, 33);
  fill(134, 109, 103)
  for (i = bunSize; i > 0; i = i - 1) {
    ellipse(hsx + bun1x, buny, i * i, i * i); 
    ellipse(hex + bun2x, buny, i * i, i * i); 
  }

  fill(207, 182, 153);
  ellipse(windowWidth / 2, windowHeight / 2, hex - hsx - 2, hsy - hey/2);
  bezier(hsx, hsy, hcp1x, hcp1y, hcp2x, hcp2y, hex, hey);

  fill(134, 109, 103);
  for (i = 0; i < hairk; i = i + 2) {
    bezier(hsx, windowHeight/2 + i * hairl, hsx, windowHeight/4 + i * i, windowWidth/2, windowHeight/2.5, windowWidth / 2, hairln);
    bezier(hex, windowHeight/2 + i * hairl, hex, windowHeight/4 + i * i, windowWidth/2, windowHeight/2.5, windowWidth / 2, hairln);
  }

  fill(255);

  noStroke();
  fill(191, 122, 148);
  ellipse(hsx + 130 - chSpacing, 250 + chYpos, ch, ch);
  ellipse(hex - 130 + chSpacing, 250 + chYpos, ch, ch);
  fill(255, 255, 255);

  stroke(64, 39, 33);
  ellipse(windowWidth / 2 - espac, eypos, ew, eh);
  ellipse(windowWidth / 2 + espac, eypos, ew, eh);

  fill(64, 39, 33);
  ellipse(windowWidth / 2 - espac, eypos, p, p);
  ellipse(windowWidth / 2 + espac, eypos, p, p);

  noFill();
  bezier(windowWidth / 2 - mouthX, mouthY, windowWidth / 2 - mouthCx, mouthCy, windowWidth / 2 + mouthCx, mouthCy, windowWidth / 2 + mouthX, mouthY);

  bezier(windowWidth / 2 - noseX, noseY,
    windowWidth / 2 - noseCx, windowHeight / 2 + noseCy,
    windowWidth / 2 + noseCx, windowHeight / 2 + noseCy,
    windowWidth / 2 + noseX, noseY);
}

// Resizes the canvas responsively
function windowResized() {
  resizeCanvas(windowWidth, windowHeight);
}
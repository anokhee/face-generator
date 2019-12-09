let face;

function setup() {
  createCanvas(windowWidth, windowHeight);
  face = new Face();

  // let gui_head = new dat.GUI();
  // gui_head.add(face, 'hsx', 0, 500).name("HSX");
  // gui_head.add(face, 'hsy', -500, 500).name("HSY");
  // gui_head.add(face, 'hcp1x', 0, 500).name("Forehead - X");
  // gui_head.add(face, 'hcp1y', -500, 500).name("Forehead - Y");
}

// Resizes the canvas responsively
function windowResized() {
  resizeCanvas(windowWidth, windowHeight);
}

function draw() {
  background(137, 135, 210);
  noStroke();

  strokeWeight(5);
  stroke(64, 39, 33);
  fill(134, 109, 103)
  for (i = face.bunSize; i > 0; i = i - 1) {
    ellipse(windowWidth / 2 - face.hsx + face.bun1x,
      windowHeight / 2 - face.buny,
      i * i, i * i);
    ellipse(windowWidth / 2 + face.hsx + face.bun2x,
      windowHeight / 2 - face.buny,
      i * i, i * i);
  }

  fill(207, 182, 153);
  bezier(windowWidth / 2 - face.hsx, windowHeight / 2 + face.hsy,
    windowWidth / 2 - face.hcp1x, windowHeight / 2 + face.hcp1y,
    windowWidth / 2 + face.hcp1x, windowHeight / 2 + face.hcp1y,
    windowWidth / 2 + face.hsx, windowHeight / 2 + face.hsy);

  fill(134, 109, 103);
  for (i = 0; i < face.hairk; i = i + 2) {
    bezier(windowWidth / 2 - face.hsx, windowHeight / 2 + i * face.hairl, width / 2 - face.hsx, windowHeight / 4 + i * i, windowWidth / 2, windowHeight / 2.5, windowWidth / 2, windowHeight / 2 - windowHeight / 8 + face.hairln);
    bezier(windowWidth / 2 + face.hsx, windowHeight / 2 + i * face.hairl, width / 2 + face.hsx, windowHeight / 4 + i * i, windowWidth / 2, windowHeight / 2.5, windowWidth / 2, windowHeight / 2 - windowHeight / 8 + face.hairln);
  }

  noStroke();
  fill(191, 122, 148);
  ellipse(windowWidth / 2 - face.hsx + face.chSpacing, windowHeight / 2 + face.chYpos, face.ch, face.ch);
  ellipse(windowWidth / 2 + face.hsx - face.chSpacing, windowHeight / 2 + face.chYpos, face.ch, face.ch);



  fill(255);
  stroke(64, 39, 33);
  ellipse(windowWidth / 2 - face.espac, windowHeight / 2 + face.eypos, face.ew, face.eh);
  ellipse(windowWidth / 2 + face.espac, windowHeight / 2 + face.eypos, face.ew, face.eh);

  fill(64, 39, 33);
  ellipse(windowWidth / 2 - face.espac, windowHeight / 2 + face.eypos, face.p, face.p);
  ellipse(windowWidth / 2 + face.espac, windowHeight / 2 + face.eypos, face.p, face.p);

  noFill();
  bezier(windowWidth / 2 - face.mouthX, windowHeight / 2 + face.mouthY,
    windowWidth / 2 - face.mouthCx, windowHeight / 2 + face.mouthCy,
    windowWidth / 2 + face.mouthCx, windowHeight / 2 + face.mouthCy,
    windowWidth / 2 + face.mouthX, windowHeight / 2 + face.mouthY);

  bezier(windowWidth / 2 - face.noseX, windowHeight / 2 + face.noseY,
    windowWidth / 2 - face.noseCx, windowHeight / 2 + face.noseCy,
    windowWidth / 2 + face.noseCx, windowHeight / 2 + face.noseCy,
    windowWidth / 2 + face.noseX, windowHeight / 2 + face.noseY);
}

function Face() {
  this.hsx = 150;
  this.hsy = 0;
  this.hcp1x = 120;
  this.hcp1y = 250;

  this.bun1x = 0;
  this.bun2x = 0;
  this.buny = 50;
  this.bunSize = 10;

  this.hairk = 15;
  this.hairl = 8;
  this.hairln = 0;

  this.espac = 50;
  this.eypos = 40;
  this.ew = 60;
  this.eh = 30;

  this.p = 30;

  this.chSpacing = 60;
  this.chYpos = 100;
  this.ch = 50;

  this.mouthX = 40;
  this.mouthY = 125;
  this.mouthCx = 250 / 4;
  this.mouthCy = 150;

  this.noseX = 20;
  this.noseY = 105;
  this.noseCx = 25;
  this.noseCy = 80;
}
let face;

function setup() {
  createCanvas(windowWidth, windowHeight);
  face = new Face();

  let gui_head = new dat.GUI();
  gui_head.add(face, 'hsx', 0, 500).name("Forehead Width");
  gui_head.add(face, 'hcp1x', 0, 600).name("Chin Width");
  gui_head.add(face, 'hcp1y', -500, 500).name("Chin Height");

  gui_head.add(face, 'bunx', -250, 250).name("Bun Spacing");
  gui_head.add(face, 'buny', -600, 600).name("Bun Y-Position");
  gui_head.add(face, 'bunSize', 0, 20).name("Bun Size");

  gui_head.add(face, 'hairk', 0, 250).name("Hair Fullness");
  gui_head.add(face, 'hairstr', 0.1, 5).name("Strand Thickness");
  gui_head.add(face, 'hairl', -250, 250).name("Hair Length");
  gui_head.add(face, 'hairln', 0, 250).name("Hairline");


  gui_head.add(face, 'espac', -250, 250).name("Eye Spacing");
  gui_head.add(face, 'eypos', -600, 600).name("Eyes Y-Position");
  gui_head.add(face, 'ew', 0, 100).name("Eye Width");
  gui_head.add(face, 'eh', 0, 100).name("Eye Height");
}

// Resizes the canvas responsively
function windowResized() {
  resizeCanvas(windowWidth, windowHeight);
}

function draw() {
  background(255);
  strokeWeight(5);
  noFill();

  for (i = face.bunSize; i > 0; i = i - face.hairstr) {
    ellipse(windowWidth / 2 - face.hsx - face.bunx,
      windowHeight / 2 - face.buny,
      i * i, i * i);
    ellipse(windowWidth / 2 + face.hsx + face.bunx,
      windowHeight / 2 - face.buny,
      i * i, i * i);
  }


  beginShape();
  bezier(windowWidth / 2 - face.hsx, windowHeight / 2 + face.hsy,
    windowWidth / 2 - face.hcp1x/10, windowHeight / 2 - windowHeight / 7,
    windowWidth / 2 + face.hcp1x/10, windowHeight / 2 - windowHeight / 7,
    windowWidth / 2 + face.hsx, windowHeight / 2 + face.hsy);

  bezier(windowWidth / 2 - face.hsx, windowHeight / 2 + face.hsy,
    windowWidth / 2 - face.hcp1x, windowHeight / 2 + face.hcp1y,
    windowWidth / 2 + face.hcp1x, windowHeight / 2 + face.hcp1y,
    windowWidth / 2 + face.hsx, windowHeight / 2 + face.hsy);

  for (i = 0; i < face.hairk; i = i + face.hairstr) {
    bezier(windowWidth / 2 - face.hsx, windowHeight / 2 + i * face.hairl, width / 2 - face.hsx, windowHeight / 4 + i * i, windowWidth / 2, windowHeight / 2.5, windowWidth / 2, windowHeight / 2 - windowHeight / 8 + face.hairln);
    bezier(windowWidth / 2 + face.hsx, windowHeight / 2 + i * face.hairl, width / 2 + face.hsx, windowHeight / 4 + i * i, windowWidth / 2, windowHeight / 2.5, windowWidth / 2, windowHeight / 2 - windowHeight / 8 + face.hairln);
  }

  ellipse(windowWidth / 2 - face.hsx + face.chSpacing, windowHeight / 2 + face.chYpos, face.ch, face.ch);
  ellipse(windowWidth / 2 + face.hsx - face.chSpacing, windowHeight / 2 + face.chYpos, face.ch, face.ch);


  ellipse(windowWidth / 2 - face.espac, windowHeight / 2 + face.eypos, face.ew, face.eh);
  ellipse(windowWidth / 2 + face.espac, windowHeight / 2 + face.eypos, face.ew, face.eh);

  ellipse(windowWidth / 2 - face.espac, windowHeight / 2 + face.eypos, face.p, face.p);
  ellipse(windowWidth / 2 + face.espac, windowHeight / 2 + face.eypos, face.p, face.p);

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

  this.bunx = 0;
  this.buny = 50;
  this.bunSize = 10;

  this.hairk = 15;
  this.hairstr = 1;
  this.hairl = 2;
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
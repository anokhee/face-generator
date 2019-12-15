let face;
let palette;
var gui_head;

function setup() {
  createCanvas(windowWidth, windowHeight);

  face = new Face();
  palette = new Colors();

  createGUI();

}

// Resizes the canvas responsively
function windowResized() {
  resizeCanvas(windowWidth, windowHeight);
}

function draw() {
  background(palette.backgroundColor);
  strokeWeight(5);
  stroke(0);

  fill(palette.hairColor);
  for (i = face.bunSize; i > 0; i = i - face.hairstr) {
    ellipse(windowWidth / 2 - face.hsx - face.bunx,
      windowHeight / 2 - face.buny,
      i * i, i * i);
    ellipse(windowWidth / 2 + face.hsx + face.bunx,
      windowHeight / 2 - face.buny,
      i * i, i * i);
  }


  fill(palette.skinColor);
  bezier(windowWidth / 2 - face.hsx, windowHeight / 2 + face.hsy,
    windowWidth / 2 - face.hcp1x / 10, windowHeight / 2 - windowHeight / 7,
    windowWidth / 2 + face.hcp1x / 10, windowHeight / 2 - windowHeight / 7,
    windowWidth / 2 + face.hsx, windowHeight / 2 + face.hsy);

  bezier(windowWidth / 2 - face.hsx, windowHeight / 2 + face.hsy,
    windowWidth / 2 - face.hcp1x, windowHeight / 2 + face.hcp1y,
    windowWidth / 2 + face.hcp1x, windowHeight / 2 + face.hcp1y,
    windowWidth / 2 + face.hsx, windowHeight / 2 + face.hsy);


  fill(palette.cheeksColor);
  ellipse(windowWidth / 2 - face.hsx + face.chSpacing, windowHeight / 2 + face.chYpos, face.ch, face.ch);
  ellipse(windowWidth / 2 + face.hsx - face.chSpacing, windowHeight / 2 + face.chYpos, face.ch, face.ch);

  fill(255);
  ellipse(windowWidth / 2 - face.espac, windowHeight / 2 + face.eypos, face.ew, face.eh);
  ellipse(windowWidth / 2 + face.espac, windowHeight / 2 + face.eypos, face.ew, face.eh);

  fill(palette.eyeColor);
  ellipse(windowWidth / 2 - face.espac, windowHeight / 2 + face.eypos, face.p, face.p);
  ellipse(windowWidth / 2 + face.espac, windowHeight / 2 + face.eypos, face.p, face.p);

  makeHair();

  noFill();
  bezier(windowWidth / 2 - face.mouthX, windowHeight / 2 + face.mouthY,
    windowWidth / 2 - face.mouthCx, windowHeight / 2 + face.mouthCy,
    windowWidth / 2 + face.mouthCx, windowHeight / 2 + face.mouthCy,
    windowWidth / 2 + face.mouthX, windowHeight / 2 + face.mouthY);

  fill(palette.skinColor)
  bezier(windowWidth / 2 - face.noseX, windowHeight / 2 + face.noseY,
    windowWidth / 2 - face.noseCx, windowHeight / 2 + face.noseCy,
    windowWidth / 2 + face.noseCx, windowHeight / 2 + face.noseCy,
    windowWidth / 2 + face.noseX, windowHeight / 2 + face.noseY);
}

function makeHair() {
  noFill();
  for (i = 0; i <= face.hairk; i = i + face.hairstr) {
    fill(palette.hairColor);
    if (i >= face.hairk - 1) {
      noFill();
    }
    bezier(windowWidth / 2 - face.hsx, windowHeight / 2 + i * face.hairl, width / 2 - face.hsx, windowHeight / 4 + i * i, windowWidth / 2, windowHeight / 2.5, windowWidth / 2, windowHeight / 2 - windowHeight / 8 + face.hairln);
    bezier(windowWidth / 2 + face.hsx, windowHeight / 2 + i * face.hairl, width / 2 + face.hsx, windowHeight / 4 + i * i, windowWidth / 2, windowHeight / 2.5, windowWidth / 2, windowHeight / 2 - windowHeight / 8 + face.hairln);
  }
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
  this.hairln = 14;

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

function Colors() {
  this.backgroundColor = [190, 153, 153];
  this.hairColor = [41, 47, 58];
  this.skinColor = [217, 191, 143];
  this.eyeColor = [10, 20, 20];
  this.cheeksColor = [245, 42, 105];
}

function createGUI() {
  let gui_head = new dat.GUI();
  gui_head.addColor(palette, 'backgroundColor').name("Background Color");
  gui_head.addColor(palette, 'skinColor').name("Skin Color");
  gui_head.addColor(palette, 'hairColor').name("Hair Color");
  gui_head.addColor(palette, 'eyeColor').name("Eye Color");
  gui_head.addColor(palette, 'cheeksColor').name("Cheeks Color");

  gui_head.add(face, 'hsx', 0, 500).name("Forehead Width");
  gui_head.add(face, 'hcp1x', 0, 500).name("Chin Width");
  gui_head.add(face, 'hcp1y', -500, 500).name("Chin Height");

  gui_head.add(face, 'bunx', -500, 500).name("Bun Spacing");
  gui_head.add(face, 'buny', -500, 500).name("Bun Y-Position");
  gui_head.add(face, 'bunSize', 0, 20).name("Bun Size");

  gui_head.add(face, 'hairk', 0, 25).name("Hair Fullness");
  gui_head.add(face, 'hairstr', 0.1, 5).name("Strand Thickness");
  gui_head.add(face, 'hairl', -500, 500).name("Hair Length");

  gui_head.add(face, 'espac', -500, 500).name("Eye Spacing");
  gui_head.add(face, 'eypos', -500, 500).name("Eyes Y-Position");
  gui_head.add(face, 'ew', 0, 100).name("Eye Width");
  gui_head.add(face, 'eh', 0, 100).name("Eye Height");
  gui_head.add(face, 'p', 0, 100).name("Pupils Size");

  gui_head.add(face, 'mouthX', -500, 500).name("Mouth Width");
  gui_head.add(face, 'mouthY', -500, 500).name("Mouth Y-Position");
  gui_head.add(face, 'mouthCx', -500, 500).name("Cheekiness");
  gui_head.add(face, 'mouthCy', -500, 500).name("Smile Intensity");

  gui_head.add(face, 'noseX', 0, 250).name("Nose Base Width");
  gui_head.add(face, 'noseY', -250, 250).name("Nose Y-Position");
  gui_head.add(face, 'noseCx', 0, 250).name("Nose Width");
  gui_head.add(face, 'noseCy', -250, 250).name("Nose Length");

  gui_head.add(face, 'chSpacing', 0, 500).name("Cheeks Spacing");
  gui_head.add(face, 'chYpos', -500, 500).name("Cheeks Y-Position");
  gui_head.add(face, 'ch', 0, 500).name("Cheeks Size");
}
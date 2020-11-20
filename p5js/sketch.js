let face, palette, gui_head;
let renderer;
let button;
let mult = 10;
let s = .5;
let off = 55;

function setup() {
  renderer = createCanvas(windowWidth, windowHeight, SVG);
  face = new Face();
  palette = new Colors();
  createGUI();
  randomizeFace();
}

// Resizes the canvas responsively
function windowResized() {
  resizeCanvas(windowWidth, windowHeight);
}

function drawFace() {
  fill(0)
  scale(.1);
  strokeWeight(palette.strokeWeight);
  fill(palette.hairColor);
  for (i = face.bunSize; i > 0; i = i - face.hairstr) {
    ellipse(0 - face.hsx - face.bunx,
      0 - face.buny,
      i * i, i * i);
    ellipse(0 + face.hsx + face.bunx,
      0 - face.buny,
      i * i, i * i);
  }

  fill(palette.skinColor);
  bezier(0 - face.hsx, 0 + face.hsy + 10,
    0 - face.hcp1x / 10, 0 - height / 7,
    0 + face.hcp1x / 10, 0 - height / 7,
    0 + face.hsx, 0 + face.hsy + 10);

  bezier(0 - face.hsx, 0 + face.hsy,
    0 - face.hcp1x, 0 + face.hcp1y,
    0 + face.hcp1x, 0 + face.hcp1y,
    0 + face.hsx, 0 + face.hsy);


  noStroke();
  fill(palette.cheeksColor);
  ellipse(0 - face.hsx + face.chSpacing, 0 + face.chYpos, face.ch, face.ch);
  ellipse(0 + face.hsx - face.chSpacing, 0 + face.chYpos, face.ch, face.ch);

  stroke(palette.strokeWeight);
  fill(255);
  ellipse(0 - face.espac, 0 + face.eypos, face.ew, face.eh);
  ellipse(0 + face.espac, 0 + face.eypos, face.ew, face.eh);

  fill(palette.eyeColor);
  ellipse(0 - face.espac, 0 + face.eypos, face.p, face.p);
  ellipse(0 + face.espac, 0 + face.eypos, face.p, face.p);

  makeHair();

  noFill();
  if (palette.strokeWeight < 1) {
    strokeWeight(5);
  }
  stroke((palette.skinColor[0] - 45), (palette.skinColor[1] - 45), (palette.skinColor[2] - 45));
  bezier(0 - face.mouthX, 0 + face.mouthY,
    0 - face.mouthCx, 0 + face.mouthCy,
    0 + face.mouthCx, 0 + face.mouthCy,
    0 + face.mouthX, 0 + face.mouthY);

  fill(palette.skinColor);
  bezier(0 - face.noseX, 0 + face.noseY,
    0 - face.noseCx, 0 + face.noseCy,
    0 + face.noseCx, 0 + face.noseCy,
    0 + face.noseX, 0 + face.noseY);

  noFill();
  stroke(0);
  strokeWeight(palette.strokeWeight);
  bezier(0 - face.mouthX, 0 + face.mouthY,
    0 - face.mouthCx, 0 + face.mouthCy,
    0 + face.mouthCx, 0 + face.mouthCy,
    0 + face.mouthX, 0 + face.mouthY);

  bezier(0 - face.noseX, 0 + face.noseY,
    0 - face.noseCx, 0 + face.noseCy,
    0 + face.noseCx, 0 + face.noseCy,
    0 + face.noseX, 0 + face.noseY);

  scale(10);
}

function makeHair() {
  noFill();
  for (i = 0; i <= face.hairk; i = i + face.hairstr) {
    fill(palette.hairColor);
    if (i >= face.hairk - 1) {
      noFill();
    }
    bezier(-face.hsx, (height / 2 + i * face.hairl) - height / 2, -face.hsx, height / 4 - height / 2 + i * i, 0, height / 2.5 - height / 2, 0, -height / 8 + face.hairln);
    bezier(face.hsx, (height / 2 + i * face.hairl) - height / 2, face.hsx, height / 4 - height / 2 + i * i, 0, height / 2.5 - height / 2, 0, -height / 8 + face.hairln);
  }
}

function Face() {
  this.hsx = 150; // Bezier control point x1 
  this.hsy = 0; // Bezier control point y2 
  this.hcp1x = 120; // Bezier control point x2
  this.hcp1y = 250; // Bezier control point y2

  this.bunx = 0; // Buns x-position
  this.buny = 50; // Buns y-position
  this.bunSize = 10; // Bun height/width

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

function randomizeFace() {
  let rand = Math.random();
  console.log(rand);

  face.hsx = random(140 * mult, 220 * mult);
  face.hcp1x = random(120 * mult, 300 * mult);
  face.hcp1y = random(210 * mult, 350 * mult);

  face.buny = random((-face.hcp1y / 2), 50);
  face.bunx = random(-100, (face.bunSize * 2));
  face.bunSize = random(6, 15);

  face.hairk = random(2, 5);
  face.hairstr = random(1.5, 3);
  face.hairl = random(0 * mult, 45 * mult);

  face.espac = random((face.espac / 2), (face.hsx));
  face.eypos = random(0, (face.hcp1y / 3.5));
  face.ew = random(45 * mult, 110 * mult);
  face.eh = face.ew - random(90 * mult, 150 * mult);

  face.p = random((face.eh / 4), (face.eh / 2));

  face.chSpacing = random(40, 60);
  face.chYpos = random((face.hcp1y / 4), (face.hcp1y / 2));
  face.ch = random(30 * mult, 80 * mult);

  face.mouthX = random(15, (face.hcp1x / 3));
  face.mouthY = random(125 * mult, 150 * mult);
  face.mouthCx = random((250 / 6), (250 / 4));
  face.mouthCy = random(125 * mult, 160 * mult);

  face.noseX = random(10 * mult, 25 * mult);
  face.noseY - random(90 * mult, 140 * mult);
  face.noseCx = random(5 * mult, 120 * mult);
  face.noseCy = random(0 * mult, 125 * mult);

  palette.skinColor = [random(55, 255)];
  palette.hairColor = [random(10, 255)];
  palette.eyeColor = [0, 0, 0, random(100, 255)];
  palette.cheeksColor = [0, 0, 0, random(0, 50)];
}

function Colors() {
  this.backgroundColor = [255, 255, 255];
  this.hairColor = [255, 255, 255];
  this.skinColor = [255, 255, 255, 0];
  this.eyeColor = [255, 255, 255];
  this.cheeksColor = [150, 150, 150];
  this.strokeWeight = 10;
}

function createGUI() {
  let gui = new dat.GUI();
  let colorsMenu = gui.addFolder('Colors');
  colorsMenu.addColor(palette, 'backgroundColor').name("Background");
  colorsMenu.addColor(palette, 'skinColor').name("Skin Color");
  colorsMenu.addColor(palette, 'hairColor').name("Hair Color");
  colorsMenu.addColor(palette, 'eyeColor').name("Eye Color");
  colorsMenu.addColor(palette, 'cheeksColor').name("Cheeks Color");
  colorsMenu.add(palette, 'strokeWeight', 0, 10).step(1);

  let faceMenu = gui.addFolder('Face Shape');
  faceMenu.add(face, 'hsx', 0, 500).name("Forehead Width");
  faceMenu.add(face, 'hcp1x', 0, 500).name("Chin Width");
  faceMenu.add(face, 'hcp1y', -500, 500).name("Chin Height");

  let bunsMenu = gui.addFolder('Hair Buns');
  bunsMenu.add(face, 'bunx', -500, 500).name("Bun Spacing");
  bunsMenu.add(face, 'buny', -500, 500).name("Bun Y-Position");
  bunsMenu.add(face, 'bunSize', 0, 20).name("Bun Size");

  let hairMenu = gui.addFolder('Hair');
  hairMenu.add(face, 'hairk', 0, 25).name("Hair Fullness");
  hairMenu.add(face, 'hairstr', 0.1, 5).name("Strand Thickness");
  hairMenu.add(face, 'hairl', -500, 500).name("Hair Length");
  hairMenu.add(face, 'hairln', -500, 500).name("Hairline");

  let eyesMenu = gui.addFolder('Eyes');
  eyesMenu.add(face, 'espac', -500, 500).name("Eye Spacing");
  eyesMenu.add(face, 'eypos', -500, 500).name("Eyes Y-Position");
  eyesMenu.add(face, 'ew', 0, 100).name("Eye Width");
  eyesMenu.add(face, 'eh', 0, 100).name("Eye Height");
  eyesMenu.add(face, 'p', 0, 100).name("Pupils Size");

  let mouthMenu = gui.addFolder('Mouth');
  mouthMenu.add(face, 'mouthX', -500, 500).name("Mouth Width");
  mouthMenu.add(face, 'mouthY', -500, 500).name("Mouth Y-Position");
  mouthMenu.add(face, 'mouthCx', -500, 500).name("Cheekiness");
  mouthMenu.add(face, 'mouthCy', -500, 500).name("Smile Intensity");

  let noseMenu = gui.addFolder('Nose');
  noseMenu.add(face, 'noseX', 0, 250).name("Nose Base Width");
  noseMenu.add(face, 'noseY', -250, 250).name("Nose Y-Position");
  noseMenu.add(face, 'noseCx', 0, 250).name("Nose Width");
  noseMenu.add(face, 'noseCy', -250, 250).name("Nose Length");

  let cheeksMenu = gui.addFolder('Cheeks');
  cheeksMenu.add(face, 'chSpacing', 0, 500).name("Cheeks Spacing");
  cheeksMenu.add(face, 'chYpos', -500, 500).name("Cheeks Y-Position");
  cheeksMenu.add(face, 'ch', 0, 500).name("Cheeks Size");
}

function keyPressed() {
  if (key === 's') {
    save("my-beautiful-face.svg");
  }
}

function draw() {
  renderer.drawingContext.__clearCanvas();
  background(palette.backgroundColor);


  for (p = 1; p < 20; p++) {
    for (q = 1; q < 20; q++) {
      scale(s);
      randomizeFace();
      translate(p * mult * off, q * mult * off);
      drawFace();
      translate(-p * mult * off, -q * mult * off);
    }
  }
  noLoop();
}

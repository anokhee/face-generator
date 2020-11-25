function Face() {
    this.hsx = 230;
    this.hsy = 0;
    this.hsy2 = 120;
    this.hcpx = 500;
    this.hcpy = 450;

    this.bunx = 10;
    this.buny = 50;
    this.bunSize = 10;

    this.hairStyleLeft = 1;
    this.hairStyleRight = 1;
    // To add: 
    // 1) More hairstyle options -- maybe 4 maximum, to learn about controlling Bezier curves.
    // 2) Eyebrows... cuz duh... that would be SO CUTE.  
    this.hairk = 20;
    this.hairstr = 3;
    this.hairl = 20;
    this.hairln = -25;

    this.espac = 100;
    this.eypos = 100;
    this.ew = 40;
    this.eh = 30;

    this.p = 20;

    this.chSpacing = -50;
    this.chYpos = 80;
    this.ch = 40;

    this.mouthX = 120;
    this.mouthY = 225;
    this.mouthCx = 100;
    this.mouthCy = 280;

    this.noseX = 20;
    this.noseY = 205;
    this.noseCx = 25;
    this.noseCy = 180;
}

function Palette() {
    this.skinColor = `rgba(245, 245, 245, 1)`;
    this.hairColor = `rgba(45, 45, 45, 1)`;
    this.pupilsColor = `rgba(1, 1, 1, 1)`;
    this.eyeColor = `rgba(255, 255, 255, 1)`;
    this.cheeksColor = `rgba(230, 230, 230, 1)`;
    this.backgroundColor = `rgba(255, 255, 255, 1)`;
}
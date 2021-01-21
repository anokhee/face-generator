const canvas = document.getElementById('canvas');
const c = canvas.getContext("2d");
width = 800;
height = 600;
canvas.width = width;
canvas.height = height;
canvas.style.position = "fixed";
canvas.style.top = "0";
let face, palette, background;
let centerX = width / 2;
let centerY = height / 3.25;

setup();

function setup() {
    c.clearRect(0, 0, canvas.width, canvas.height);
    face = new Face();
    palette = new Palette();
    background = new BackgroundPattern;
    draw();
};

function draw() {
    // Makes buns
    if (palette.strokeWeight === 0) {
        palette.stroke = `rgba(0, 0, 0, 0)`;
    } else {
        palette.stroke = `rgba(0, 0, 0, 1)`;
    }
    setBackground(palette.backgroundColor);
    c.lineCap = 'round';
    c.lineWidth = palette.strokeWeight;
    c.strokeStyle = palette.strokeStyle;
    document.body.style.backgroundColor = palette.backgroundColor;
    for (i = face.bunSize; i > 0; i = i - face.hairstr) {
        c.beginPath();
        c.ellipse(centerX - face.hsx - face.bunx,
            centerY - face.buny,
            i * i, i * i,
            0, 0, 2 * Math.PI, false);
        c.fillStyle = palette.hairColor;
        c.fill();
        c.stroke();

        c.beginPath();
        c.ellipse(centerX + face.hsx + face.bunx,
            centerY - face.buny,
            i * i, i * i,
            0, 0, 2 * Math.PI, false);
        c.fillStyle = palette.hairColor;
        c.fill();
        c.stroke();
    }

    // Makes head shape
    c.beginPath();
    c.moveTo(centerX - face.hsx, centerY + face.hsy);
    c.bezierCurveTo(centerX - face.hcpx / 10, centerY - face.hsy2,
        centerX + face.hcpx / 10, centerY - face.hsy2,
        centerX + face.hsx, centerY + face.hsy);
    c.moveTo(centerX - face.hsx, centerY + face.hsy);
    c.bezierCurveTo(centerX - face.hcpx, centerY + face.hcpy,
        centerX + face.hcpx, centerY + face.hcpy,
        centerX + face.hsx, centerY + face.hsy);
    c.fillStyle = palette.skinColor;
    c.fill();
    c.stroke();

    // Makes cheeks
    c.beginPath();
    c.ellipse(centerX + face.hsx + face.chSpacing, height / 2 + face.chYpos, face.ch, face.ch, 0, 0, 2 * Math.PI, false);
    c.fillStyle = palette.cheeksColor;
    c.fill();
    c.stroke();

    c.beginPath();
    c.ellipse(centerX - face.hsx - face.chSpacing, height / 2 + face.chYpos, face.ch, face.ch,
        0, 0, 2 * Math.PI, false);
    c.fillStyle = palette.cheeksColor;
    c.fill();
    c.stroke();

    // Makes eyes
    c.beginPath();
    c.ellipse(centerX - face.espac, centerY + face.eypos, face.ew, face.eh,
        0, 0, 2 * Math.PI, false);
    c.fillStyle = palette.eyeColor;
    c.fill();
    c.stroke();

    c.beginPath();
    c.ellipse(centerX + face.espac, centerY + face.eypos, face.ew, face.eh,
        0, 0, 2 * Math.PI, false);
    c.fillStyle = palette.eyeColor;
    c.fill();
    c.stroke();

    // Makes pupils
    c.beginPath();
    c.ellipse(centerX - face.espac, centerY + face.eypos, face.p, face.p,
        0, 0, 2 * Math.PI, false);
    c.fillStyle = palette.pupilsColor;
    c.fill();
    c.stroke();

    c.beginPath();
    c.ellipse(centerX + face.espac, centerY + face.eypos, face.p, face.p,
        0, 0, 2 * Math.PI, false);
    c.fillStyle = palette.pupilsColor;
    c.fill();
    c.stroke();

    makeNoseAndMouth();

    function makeNoseAndMouth() {
        if (palette.strokeWeight <= 0) {
            c.lineWidth = 5;
            c.strokeStyle = `rgba(0, 0, 0, .35)`;
        } else {
            c.strokeStyle = palette.stroke;
        }


        // Makes mouth
        c.beginPath();
        c.moveTo(centerX - face.mouthX, centerY + face.mouthY);
        c.bezierCurveTo(centerX - face.mouthCx, centerY + face.mouthCy,
            centerX + face.mouthCx, centerY + face.mouthCy,
            centerX + face.mouthX, centerY + face.mouthY);
        c.stroke();

        // Makes nose
        c.beginPath();
        c.moveTo(centerX - face.noseX, centerY + face.noseY);
        c.bezierCurveTo(centerX - face.noseCx, centerY + face.noseCy,
            centerX + face.noseCx, centerY + face.noseCy,
            centerX + face.noseX, centerY + face.noseY);
        c.fillStyle = palette.skinColor;
        c.fill();
        c.stroke();
    }



    function makeHair() {
        // Makes hair
        c.strokeStyle = palette.stroke;
        c.lineWidth = palette.strokeWeight;
        for (i = 1; i <= face.hairk; i = i + face.hairstr) {
            c.beginPath();
            if (face.hairStyle === 0) {
                c.moveTo(centerX, centerY / 2 - face.hairln);
                c.bezierCurveTo(
                    centerX, centerY / 2,
                    centerX - face.hsx, (centerY + i * face.hairl) - centerY,
                    centerX - face.hsx, centerY,
                );
            } else if (face.hairStyle === 1) {
                c.moveTo(centerX - face.hsx, centerY + i * face.hairl);
                c.bezierCurveTo(
                    centerX - face.hsx, centerY / 2 + i * i, centerX, centerY / 2, centerX, centerY - centerY / 4 + face.hairln
                );
            }

            if (i >= face.hairk - 1) {
                c.fillStyle = `rgba(0, 0, 0, 0)`;
            } else {
                c.fillStyle = palette.hairColor;
            }
            c.fill();

            c.stroke();

            c.beginPath();
            if (face.hairStyle === 0) {
                c.moveTo(centerX, centerY / 2 - face.hairln);
                c.bezierCurveTo(
                    centerX, centerY / 2,
                    centerX + face.hsx, (centerY + i * face.hairl) - centerY,
                    centerX + face.hsx, centerY,
                );
            } else if (face.hairStyle === 1) {
                c.moveTo(centerX + face.hsx, centerY + i * face.hairl);
                c.bezierCurveTo(
                    centerX + face.hsx, centerY / 2 + i * i, centerX, centerY / 2, centerX, centerY - centerY / 4 + face.hairln

                );
            }
            if (i >= face.hairk - 1) {
                c.fillStyle = `rgba(0, 0, 0, 0)`;
            } else {
                c.fillStyle = palette.hairColor;
            }
            c.fill();
            c.stroke();
        }
    }
    makeHair();


    setTimeout(draw);
}

function setBackground(color) {
    c.fillStyle = color;
    c.fillRect(0, 0, width, height);
    c.stroke();

    c.lineWidth = background.gridStrokeWeight;
    c.strokeStyle = background.gridStroke;
    c.strokeStyle = palette.stroke;

    let squareSize = 5;

    for (let i = -background.gridSpacingX; i < (width * 3.5) / background.gridSpacingX; i++) {
        c.beginPath();
        c.moveTo(i * background.gridSpacingX, 0);
        c.lineTo(i * background.gridSpacingX, height);
        c.stroke();

        c.beginPath();
        c.moveTo(0, i * background.gridSpacingY);
        c.lineTo(width, i * background.gridSpacingY);
        c.stroke();

        //Pattern maker 
        for (j = -background.gridSpacingY; j < (height * 2) / background.gridSpacingY / 2; j++) {
            c.beginPath();
            c.fillStyle = `rgba(0, 0, 200, .5)`;
            c.rect(i * background.gridSpacingX - squareSize / 2, j * background.gridSpacingY - squareSize / 2, squareSize, squareSize);
            c.fill();
            c.stroke();
        }

        c.lineWidth = background.gridStrokeWeight;
        c.strokeStyle = background.gridStroke;
    }
    c.strokeStyle = palette.stroke;
}

let tabs = document.querySelectorAll(".nav")
for (let tab of tabs) {
    tab.addEventListener('click', function (event) {
        window.scrollTo(0, 0);
    })
}

// Pattern maker
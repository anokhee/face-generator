const canvas = document.getElementById('canvas');
const c = canvas.getContext("2d");
width = 800
height = window.innerHeight;
canvas.width = width;
canvas.height = height;
let face, palette;
let centerX = width / 2;
let centerY = height / 3;

setup();

function setup() {
    c.clearRect(0, 0, canvas.width, canvas.height);
    face = new Face();
    palette = new Palette();
    c.lineWidth = 1;
    // c.strokeStyle = `rgba(0, 0, 0, 0)`;
    draw();
};

function draw() {
    setBackground(palette.backgroundColor);
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

    // Makes hair
    for (i = 1; i <= face.hairk; i = i + face.hairstr) {
        c.beginPath();
        if (face.hairStyleLeft === 0) {
            c.moveTo(centerX, centerY / 2 - face.hairln);
            c.bezierCurveTo(
                centerX, centerY / 2,
                centerX - face.hsx, (centerY + i * face.hairl) - centerY,
                centerX - face.hsx, centerY,
            );
        } else if (face.hairStyleLeft === 1) {
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
        if (face.hairStyleRight === 0) {
            c.moveTo(centerX, centerY / 2 - face.hairln);
            c.bezierCurveTo(
                centerX, centerY / 2,
                centerX + face.hsx, (centerY + i * face.hairl) - centerY,
                centerX + face.hsx, centerY,
            );
        } else if (face.hairStyleRight === 1) {
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
    setTimeout(draw);
}

function setBackground(color) {
    c.fillStyle = color;
    c.fillRect(0, 0, width, height);
}
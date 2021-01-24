function makePolygon(context, polygon, sides, squareSize, xPos, yPos, rotation, i, j) {
    var numberOfSides = sides,
        size = squareSize,
        Xcenter = xPos + i * background.gridSpacingX,
        Ycenter = yPos + j * background.gridSpacingY;


    context.translate(Xcenter, Ycenter);
    context.rotate(rotation * Math.PI/180);
    context.translate(-Xcenter, -Ycenter);
    context.beginPath();
    context.moveTo(Xcenter + size * Math.cos(0) + polygon.translateX,
        Ycenter + size * Math.sin(0) + polygon.translateY);



    for (var i = 1; i <= numberOfSides; i += 1) {

        context.lineTo(Xcenter + size * Math.cos(i * 2 * Math.PI / numberOfSides) + polygon.translateX,
            Ycenter + size * Math.sin(i * 2 * Math.PI / numberOfSides) + polygon.translateY);
    }

    context.fillStyle = polygon.color;
    context.strokeStyle = polygon.stroke;
    context.lineWidth = polygon.strokeWeight;

    context.fill();
    context.stroke();
    context.setTransform(1, 0, 0, 1, 0, 0);
}
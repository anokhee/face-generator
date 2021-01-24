let foreheadWidthSlider = document.getElementById('forehead-width-slider');
let cheeksWidthSlider = document.getElementById('cheeks-width-slider');
let chinHeightSlider = document.getElementById('chin-height-slider');

let cheeksSpacingSlider = document.getElementById('cheeks-spacing-slider');
let cheeksYPosSlider = document.getElementById('cheeks-ypos-slider');
let cheeksSizeSlider = document.getElementById('cheeks-size-slider');

let bunSpacingSlider = document.getElementById('bun-spacing-slider');
let bunYPosSlider = document.getElementById('bun-ypos-slider');
let bunSizeSlider = document.getElementById('bun-size-slider');

let hairFullnessSlider = document.getElementById('hair-fullness-slider');
let hairLengthSlider = document.getElementById('hair-length-slider');
let hairStrandSlider = document.getElementById('hair-strand-slider');

let eyeSpacingSlider = document.getElementById('eye-spacing-slider');
let eyeYPosSlider = document.getElementById('eye-ypos-slider');
let eyeWidthSlider = document.getElementById('eye-width-slider');
let eyeHeightSlider = document.getElementById('eye-height-slider');
let pupilSizeSlider = document.getElementById('pupil-size-slider');

let noseBaseWidthSlider = document.getElementById('nose-base-width-slider');
let noseYPosSlider = document.getElementById('nose-base-ypos-slider');
let noseWidthSlider = document.getElementById('nose-width-slider');
let noseLengthSlider = document.getElementById('nose-length-slider');

let smileWidthSlider = document.getElementById('mouth-width-slider');
let smileIntensitySlider = document.getElementById('mouth-smile-intensity-slider');
let mouthWidthSlider = document.getElementById('mouth-cheekiness-slider');
let mouthYPosSlider = document.getElementById('mouth-ypos-slider');

let faceOutlineSlider = document.getElementById('face-outline-slider');
let gridOutlineSlider = document.getElementById('background-grid-opacity-slider');
let backgroundGridXSpacingSlider = document.getElementById('background-grid-spacing-x-slider');
let backgroundGridYSpacingSlider = document.getElementById('background-grid-spacing-y-slider');


let arr = [
    [face, foreheadWidthSlider, `hsx`],
    [face, cheeksWidthSlider, `hcpx`],
    [face, chinHeightSlider, `hcpy`],
    [face, hairFullnessSlider, 'hairk'],
    [face, hairLengthSlider, 'hairl'],
    [face, hairStrandSlider, 'hairstr'],
    [face, bunSizeSlider, 'bunSize'],
    [face, bunSpacingSlider, 'bunx'],
    [face, bunYPosSlider, 'buny'],
    [face, eyeSpacingSlider, 'espac'],
    [face, eyeYPosSlider, 'eypos'],
    [face, eyeWidthSlider, 'ew'],
    [face, eyeHeightSlider, 'eh'],
    [face, pupilSizeSlider, 'p'],
    [face, noseBaseWidthSlider, 'noseCx'],
    [face, noseYPosSlider, 'noseY'],
    [face, noseWidthSlider, 'noseX'],
    [face, noseLengthSlider, 'noseCy'],
    [face, smileWidthSlider, 'mouthX'],
    [face, mouthWidthSlider, 'mouthCx'],
    [face, smileIntensitySlider, 'mouthCy'],
    [face, mouthYPosSlider, 'mouthY'],
    [face, cheeksSpacingSlider, 'chSpacing'],
    [face, cheeksYPosSlider, 'chYpos'],
    [face, cheeksSizeSlider, 'ch'],
    [palette, faceOutlineSlider, 'strokeWeight'],
    [background, backgroundGridXSpacingSlider, 'gridSpacingX'],
    [background, backgroundGridYSpacingSlider, 'gridSpacingY']
];


for (var i = 0; i < arr.length; i++) {
    arr[i][1].addEventListener("input", bindInput(i, arr[i]));
}

function bindInput(i) {
    return function () {
        arr[i][0][arr[i][2]] = parseInt(this.value);
    };
}

let skinColorPalette = document.getElementById('skinColorPalette');
let cheeksColorPalette = document.getElementById('cheeksColorPalette');
let eyesColorPalette = document.getElementById('eyesColorPalette');
let backgroundColorPalette = document.getElementById('backgroundColorPalette')

let skinColors = ['#5C3F0D', '#775925',
    '#8B6422', '#8B6E3D', '#9F7734',
    '#A28452', '#B58F4E', '#B4996B',
    '#CCA96E', '#CCB690', '#E5C99B',
    '#E0CFB3', '#F7E2BF', '#F7EEDF'
]

let cheeksColors = ['#945327', '#BF794A', '#D99669',
    '#CD4922', '#E56039', '#FA7953', '#F5B991'
];

let hairColors = ['#000000', '#5E3832', '#8A3D40', '#969090', '#D3C976', '#F8CD00',
    '#CD4922', '#008DE3', '#93BDC9', '#FF3C44',
    '#00CEB4', '#FF7F3A', '#A8428E', '#FF99AF', '#FFFFFF'
];

let eyeColors = ['#151005', '#36290C', '#097D60',
    '#456D6A', '#305ABA', '#0069B9', '#B8B4C6'
];

let backgroundColors = ['#F8F8F8', '#E6D200', '#7F7FC1', '#4FE1FF',
    '#CE8282', '#F2E87E', '#F7B0B0', '#FAF8E7', '#9E8F5E', '#4A363E',
    '#4FE1FF', '#E6D200', '#B80C09', '#2B3D41', '#0C7C59', '#1C110A',
    '#FD96A9', '#FC814A', '#0065FF', '#30292F', '#F2ED6F', '#32A287', '#E88873', '#F85E00',
    '#503047', '#BFDBF7', '#D7BCE8', '#E4572E'
];

function createColorSwatch(pal, arr, part, type) {
    part = Object.keys(type)[part];
    for (i = 0; i < arr.length; i++) {
        let swatch = document.createElement('div');
        swatch.className = 'color-swatch';
        pal.appendChild(swatch);
        swatch.style.backgroundColor = arr[i];

        function bindColor(part) {
            return function () {
                var selectedColors = document.querySelectorAll(".selected-swatch");

                [].forEach.call(selectedColors, function (el) {
                    el.classList.remove("selected-swatch");
                });

                swatch.classList.add('selected-swatch');

                type[part] = swatch.style.backgroundColor;

            }
        }

        swatch.addEventListener('click', bindColor(part));


    }
}

createColorSwatch(skinColorPalette, skinColors, 0, palette);
createColorSwatch(cheeksColorPalette, cheeksColors, 4, palette);
createColorSwatch(hairColorPalette, hairColors, 1, palette);
createColorSwatch(eyesColorPalette, eyeColors, 2, palette);
createColorSwatch(backgroundColorPalette, backgroundColors, 5, palette);


let boubaHairSelector = document.getElementById('bouba-hair-selector');
let kikiHairSelector = document.getElementById('kiki-hair-selector');

boubaHairSelector.addEventListener('click', function () {
    face.hairStyle = 0;
    face.hairln = 0;
});


kikiHairSelector.addEventListener('click', function () {
    face.hairStyle = 1;
    face.hairln = -50;
});

let polygonMakerContainer = document.getElementById('polygon-maker-container');

function createPolygonMaker(polygon) {
    let polygonMaker = document.createElement('div');
    polygonMaker.className = 'polygon-maker';
    polygonMakerContainer.appendChild(polygonMaker);

    let top = document.createElement('div');
    top.className = 'top';
    polygonMaker.appendChild(top);

    let title = document.createElement('h3');
    title.innerHTML = `Shape`;
    title.className = 'shape-name';
    top.appendChild(title);

    let xButton = document.createElement('div');
    xButton.className = 'close';
    top.appendChild(xButton);

    xButton.addEventListener('click', function () {
        let index = polygonsArr.indexOf(polygon);
        polygonMakerContainer.removeChild(polygonMaker);
        polygonsArr.splice(index, 1);


        
    });


    let polygonPreviewContainer = document.createElement('div');
    polygonPreviewContainer.className = 'polygon-preview-container';
    polygonMaker.appendChild(polygonPreviewContainer);


    const polygonPreview = document.createElement('canvas');
    polygonPreview.width = 200;
    polygonPreview.height = 200;
    const pCtx = polygonPreview.getContext('2d');


    function generatePreview() {
        pCtx.clearRect(0, 0, 200, 200);
        pCtx.lineJoin = 'round';
        pCtx.lineCap = 'round';
        pCtx.beginPath();
        makePolygon(pCtx, polygon, polygon.sides, polygon.size, background.gridSpacingX, background.gridSpacingY, polygon.rotation, 1, 1);
        pCtx.stroke();
    }

    generatePreview();

    polygonPreview.className = 'polygon-preview';
    polygonPreviewContainer.appendChild(polygonPreview);

    let colorModContainer = document.createElement('div');
    colorModContainer.className = 'color-mod-container'
    polygonMaker.appendChild(colorModContainer);

    let palette = document.createElement('div');
    palette.className = 'color-palette-container';
    createColorSwatch(palette, backgroundColors, 4, polygon);
    palette.addEventListener('click', function () {
        generatePreview();
    })

    colorModContainer.appendChild(palette);


    let sizeSliderLabel = document.createElement('label');
    sizeSliderLabel.innerHTML = 'Size of Shape';
    polygonMaker.appendChild(sizeSliderLabel);
    let sizeSlider = document.createElement('input');
    sizeSlider.type = 'range';
    sizeSlider.value = 10;
    polygonMaker.appendChild(sizeSlider);
    sizeSlider.addEventListener("input", function () {
        polygon.size = parseInt(this.value);
        generatePreview();
    });

    let sidesSliderLabel = document.createElement('label');
    sidesSliderLabel.innerHTML = '# of sides';
    polygonMaker.appendChild(sidesSliderLabel);
    let sidesSlider = document.createElement('input');
    sidesSlider.type = 'range';
    sidesSlider.value = 3;
    sidesSlider.min = 0;
    sidesSlider.max = 30;
    polygonMaker.appendChild(sidesSlider);
    sidesSlider.addEventListener('input', function () {
        polygon.sides = parseInt(this.value);
        generatePreview();
    });

    let translationXSliderLabel = document.createElement('label');
    translationXSliderLabel.innerHTML = 'Translate X';
    polygonMaker.appendChild(translationXSliderLabel);
    let translationXSlider = document.createElement('input');
    translationXSlider.type = 'range';
    translationXSlider.value = 0;
    translationXSlider.min = -100;
    translationXSlider.max = 100;
    polygonMaker.appendChild(translationXSlider);
    translationXSlider.addEventListener('input', function () {
        polygon.translateX = parseInt(this.value);
        generatePreview();
    });

    let translationYSliderLabel = document.createElement('label');
    translationYSliderLabel.innerHTML = 'Translate Y';
    polygonMaker.appendChild(translationYSliderLabel);
    let translationYSlider = document.createElement('input');
    translationYSlider.type = 'range';
    translationYSlider.value = 0;
    translationYSlider.min = -100;
    translationYSlider.max = 100;
    polygonMaker.appendChild(translationYSlider);
    translationYSlider.addEventListener('input', function () {
        polygon.translateY = parseInt(this.value);
        generatePreview();
    });

    let lineThicknessSliderLabel = document.createElement('label');
    lineThicknessSliderLabel.innerHTML = 'Rotation';
    polygonMaker.appendChild(lineThicknessSliderLabel);
    let lineThicknessSlider = document.createElement('input');
    lineThicknessSlider.type = 'range';
    lineThicknessSlider.value = 0;
    lineThicknessSlider.min = 0;
    lineThicknessSlider.max = 10;
    colorModContainer.appendChild(lineThicknessSlider);
    lineThicknessSlider.addEventListener('input', function () {
        if (this.value < 1) {
            polygon.stroke = `rgba(0, 0, 0, 0)`;
        } else {
            polygon.stroke = `rgba(0, 0, 0, 1)`;
        }
        polygon.strokeWeight = parseInt(this.value);
        generatePreview();
    });


    let rotationSliderLabel = document.createElement('label');
    rotationSliderLabel.innerHTML = 'Line Thickness';
    colorModContainer.appendChild(rotationSliderLabel);
    let rotationSlider = document.createElement('input');
    rotationSlider.type = 'range';
    rotationSlider.value = 0;
    rotationSlider.min = 0;
    rotationSlider.max = 360;
    polygonMaker.appendChild(rotationSlider);
    rotationSlider.addEventListener('input', function () {
        polygon.rotation = parseInt(this.value);
        generatePreview();
    });
}


let addShapeButton = document.getElementById('add-new-shape-to-pattern-btn');
addShapeButton.addEventListener('click', function () {
    const newPolygon = new Polygon(12, background.gridSpacingX, background.gridSpacingY);
    createPolygonMaker(newPolygon);
    polygonsArr.push(newPolygon);
});
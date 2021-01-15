let foreheadWidthSlider = document.getElementById('forehead-width-slider');
let cheeksWidthSlider = document.getElementById('cheeks-width-slider');
let chinHeightSlider = document.getElementById('chin-height-slider');

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

let arr = [
    [foreheadWidthSlider, `hsx`],
    [cheeksWidthSlider, `hcpx`],
    [chinHeightSlider, `hcpy`],
    [hairFullnessSlider, 'hairk'],
    [hairLengthSlider, 'hairl'],
    [hairStrandSlider, 'hairstr'],
    [bunSizeSlider, 'bunSize'],
    [bunSpacingSlider, 'bunx'],
    [bunYPosSlider, 'buny'],
    [eyeSpacingSlider, 'espac'],
    [eyeYPosSlider, 'eypos'],
    [eyeWidthSlider, 'ew'],
    [eyeHeightSlider, 'eh'],
    [pupilSizeSlider, 'p'],
    [noseBaseWidthSlider, 'noseX'],
    [noseYPosSlider, 'noseY'],
    [noseWidthSlider, 'noseCx'],
    [noseLengthSlider, 'noseCy']
];


for (var i = 0; i < arr.length; i++) {
    arr[i][0].addEventListener("input", bindInput(i, arr[i]));
}

function bindInput(i, part) {
    return function () {
        console.log([i]);
        face[arr[i][1]] = parseInt(this.value);
    };
}

let p = document.getElementById('color-swatch-container');

let skinColors = ['#5C3F0D', '#7E5714', '#775925',
    '#8B6422', '#8B6E3D', '#9F7734',
    '#A28452', '#B58F4E', '#B4996B',
    '#CCA96E', '#CCB690', '#E5C99B',
    '#E0CFB3', '#F7E2BF', '#F7EEDF'
]

function createColorSwatch(arr) {
    for (i = 0; i < 15; i++) {
        let swatch = document.createElement('div');
        swatch.className = 'color-swatch';
        p.appendChild(swatch);
        swatch.style.backgroundColor = arr[i]
    }
}

createColorSwatch(skinColors);

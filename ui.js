let foreheadWidthSlider = document.getElementById('forehead-width-slider');
let cheeksWidthSlider = document.getElementById('cheeks-width-slider');
let chinHeightSlider = document.getElementById('chin-height-slider');

let bunSpacingSlider = document.getElementById('bun-spacing-slider');
let bunYPosSlider = document.getElementById('bun-ypos-slider');
let bunSizeSlider = document.getElementById('bun-size-slider');

let hairThicknessSlider = document.getElementById('hair-thickness-slider');
let hairLengthSlider = document.getElementById('hair-length-slider');
let hairStrandSlider = document.getElementById('hair-strand-slider');



let arr = [
    [foreheadWidthSlider, `hsx`],
    [cheeksWidthSlider, `hcpx`],
    [chinHeightSlider, `hcpy`],
    [hairThicknessSlider, 'hairk']
];


for (var i = 0; i < arr.length; i++) {
    arr[i][0].addEventListener("input", bindInput(i));
}

function bindInput(i) {
    return function () {
        face[arr[i][1]] = parseInt(this.value);
    };
}
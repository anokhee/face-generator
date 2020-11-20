let foreheadWidthSlider = document.getElementById('forehead-width-slider');
let cheeksWidthSlider = document.getElementById('cheeks-width-slider');
let chinHeightSlider = document.getElementById('chin-height-slider');

let arr = [
    [foreheadWidthSlider, `hsx`],
    [cheeksWidthSlider, `hcpx`],
    [chinHeightSlider, `hcpy`]
];


for (var i = 0; i < arr.length; i++) {
    arr[i][0].addEventListener("input", bindInput(i));
}

function bindInput(i) {
    return function () {
        face[arr[i][1]] = parseInt(this.value);
    };
}
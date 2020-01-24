// Homeview.js : javascript used only in the home page
// Author: XCL (refactoring only)
// Jan 2020

function startCamera()
{
    $('#camera_wrap').camera({fx: 'scrollLeft', time: 2000, loader: 'none', playPause: false, navigation: true, height: '35%', pagination: true});
}

$(document).ready( function() {
    startCamera()
});


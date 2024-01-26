document.addEventListener('DOMContentLoaded', function() {
    const imageDivs = document.querySelectorAll('.imageblock.zoomable');
    var i = 1;
    imageDivs.forEach(imageDiv => {

        const imageUrl = imageDiv.querySelector('div img').getAttribute("src");
        imageDiv.innerHTML = '<div id="openseadragon'+i+'" style="width:100%;height:500px" />';

        OpenSeadragon({
            id: "openseadragon"+i,
            prefixUrl: toRoot+'js/openseadragon-4.1.0/images/',
            tileSources: {
                type: 'image',
                url:  imageUrl
            }
        });
        console.log(toRoot);
        i = i+1;
    });
});

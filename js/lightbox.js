const elements = document.querySelectorAll(".imageblock:not(.zoomable)")
for (let i = 0; i < elements.length; i++){
    elements[i].addEventListener("click",function() {
        if (this.className.includes("lb-active")) {
            this.className = this.className.replace("lb-active","");
        } else {
            this.className += " lb-active";
        }
    })
}


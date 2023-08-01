const elements = document.querySelectorAll(".imageblock")
console.log (elements);
console.log(elements.length)
for (let i = 0; i < elements.length; i++){
    console.log(i);
    elements[i].addEventListener("click",function() {
        if (this.className.includes("lb-active")) {
            this.className = this.className.replace("lb-active","");
        } else {
            this.className += " lb-active";
        }
    })
}


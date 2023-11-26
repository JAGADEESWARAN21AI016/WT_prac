function color(){
    var randomcolor = (Math.floor(Math.random()*16777216)).toString(16);
    console.log(randomcolor);
    document.body.style.backgroundColor = "#" + randomcolor;
    var text = document.querySelector(".text");
    text.innerText = "#" + randomcolor;
}
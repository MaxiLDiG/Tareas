const acc = document.getElementsByClassName("accordion"),
            imgArd = document.getElementById("img-ard");

for (let i = 0; i < acc.length; i++) {
  acc[i].addEventListener("click", function() {
    this.classList.toggle("active");
    let panel = this.nextElementSibling;
    if (panel.style.maxHeight) {
      panel.style.maxHeight = null;
    } else {
      panel.style.maxHeight = panel.scrollHeight + "px";
      panel.style.borderRadius = "0px";
    }
  });
}

if(window.screen.availWidth < 900) {
  while(imgArd.firstChild)
    imgArd.removeChild(imgArd.firstChild);
} else {
  imgArd.innerHTML = `<img src="img/Arduino-history.webp" alt="Placa Arduino" height="auto" width="500">`;
}
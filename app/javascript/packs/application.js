import "bootstrap";

const tarifs = document.getElementById("click-tarif-or");
tarifs.addEventListener("click", (event) => {
  event.currentTarget.classList.toggle("click-tarif");

});

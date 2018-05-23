import "bootstrap";

const tarifs = document.getElementById("click-tarif-or");
tarifs.addEventListener("click", (event) => {
  event.currentTarget.classList.toggle("click-tarif");
});

// const romain = document.getElementById("romain");
// romain.addEventListener("click", (event) => {
//   console.log(event);
//   console.log(event.currentTarget);
// });


// const romain = document.getElementById("romain");
// romain.addEventListener("click", (event) => {
//   console.log(event);
//   console.log(event.currentTarget);
// });

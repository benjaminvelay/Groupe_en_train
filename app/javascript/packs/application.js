import "bootstrap";


const tarifs = document.getElementById("click-tarif-or");
tarifs.addEventListener("click", (event) => {
  event.currentTarget.classList.toggle("click_tarif");
});



import flatpickr from "flatpickr";

flatpickr(".datepicker", {
    altInput: true,
    dateFormat: "d-m-Y H:i"
});


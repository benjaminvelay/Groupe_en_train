import "bootstrap";

const tarifs = document.querySelector(".click-tarif-or");
tarifs.addEventListener("click", (event) => {
  event.currentTarget.classList.toggle("click_tarif");
  console.log(event);
});

const select = document.querySelector(".select")
select.addEventListener("click", (event) => {
  event.currentTarget.classList.toggle("click_tarif");
  console.log(event);
});



import flatpickr from "flatpickr";

flatpickr(".datepicker", {
    altInput: true,
    dateFormat: "d-m-Y H:i"
});


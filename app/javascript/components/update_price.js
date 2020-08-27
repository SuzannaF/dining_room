// select container where we add the new price
// find actua price + select number_people
// add eventlistener

const numberPeople = document.querySelector("#booking_number_people");
const eventPrice = document.querySelector("#event-price");
const initialPrice = eventPrice.dataset.price;
// chef if the variable is defined
const initUpdatePrice = () => {
console.log("hello");
  if (numberPeople) {
    console.log(numberPeople);
    numberPeople.addEventListener("input", (event) => {
      // add id to price and store inside of an variable (inside of method)

      console.log(numberPeople.value);
      const finalPrice = parseInt(initialPrice, 10) * parseInt(numberPeople.value, 10);
      console.log(finalPrice);
      eventPrice.innerHTML = finalPrice + ' EUR';
      // store the  multiplied 80 value inside of a var
      // multiply the first value with second
    });
  }
};

export { initUpdatePrice };

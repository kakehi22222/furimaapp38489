function fee_count() {
const itemPrice = document.getElementById("item-price");

itemPrice.addEventListener('input',() => {
  const countVal = itemPrice.value;
  const addTaxPrice = document.getElementById("add-tax-price");
  addTaxPrice.innerHTML = `${Math.floor(countVal/10)}`;

  const profit = document.getElementById("profit");
  profit.innerHTML = `${countVal - Math.floor(countVal/10)}`;
});
};

window.addEventListener('load', fee_count);
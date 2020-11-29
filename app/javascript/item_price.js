window.addEventListener('load', () => {
const priceInput = document.getElementById("item-price");
priceInput.addEventListener("input", () => {
  const inputValue = priceInput.value;
  console.log(inputValue);
const addTaxDom = document.getElementById("add-tax-price");
const tax = inputValue*0.1;
addTaxDom.innerHTML = Math.floor(tax);
const addProfitDom = document.getElementById("profit");
const profit = (inputValue - tax);
addProfitDom.innerHTML = Math.floor(profit);
})
});
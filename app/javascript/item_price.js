window.addEventListener('load', () => {
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
   const inputValue = priceInput.value;
   const addTaxDom = document.getElementById("add-tax-price");
   const AddTaxPrice = inputValue * 0.1;
   addTaxDom.innerHTML = AddTaxPrice;
   const profitDom = document.getElementById("profit");
   const profit = inputValue * 0.9;
   profitDom.innerHTML = profit;
 
   }
  )
});
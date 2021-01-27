window.addEventListener(`load`,() =>{
  const priceInput = document.getElementById("item-price")
  priceInput.addEventListener("input",() => {
    const inputValue = priceInput.value;

    const addTaxDom = document.getElementById("add-tax-price");
    addTaxDom.innerHTML = Math.floor(priceInput.value * 0.1);

    const userProfit = document.getElementById("profit");
    userProfit.innerHTML = Math.floor(priceInput.value * 0.9);
  })
});
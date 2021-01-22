window.addEventListener(`load`,() =>{
  const priceInput = document.getElementById("item-price")
  priceInput.addEventListener("input",() => {
    const inputValue = priceInput.value;

    const addTaxDom = document.getElementById("add-tax-price");
    addTaxDom.innerHTML = Math.floor(priceInput.value * 0.1);

    const UserProfit = document.getElementById("profit");
    console.log(addTaxDom);
    UserProfit.innerHTML = Math.floor(priceInput.value * 0.9);
    console.log(UserProfit);
  })
});
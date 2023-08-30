function profitCalculation (){
  const calcProfit = document.getElementById("item-price");
  calcProfit.addEventListener("keyup", () => {
    const profit = Math.floor(calcProfit.value * 0.9);
    const profitResult  = document.getElementById("profit");
    profitResult.innerHTML = `${profit}`;
  });
};

window.addEventListener('turbo:load', profitCalculation);
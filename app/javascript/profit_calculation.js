function profitCalculation (){
  const calcProfit = document.getElementById("item-price");
  calcProfit.addEventListener("keyup", () => {
    const profit = calcProfit.value - Math.floor(calcProfit.value * 0.1);
    const profitResult  = document.getElementById("profit");
    profitResult.innerHTML = `${profit}`;
  });
};

window.addEventListener('turbo:load', profitCalculation);
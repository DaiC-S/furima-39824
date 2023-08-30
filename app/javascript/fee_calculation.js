function feeCalculation (){
  const calcFee = document.getElementById("item-price");
  calcFee.addEventListener("keyup", () => {
    const fee = Math.floor(calcFee.value * 0.1);
    const feeResult  = document.getElementById("add-tax-price");
    feeResult.innerHTML = `${fee}`;
  });
};

window.addEventListener('turbo:load', feeCalculation);
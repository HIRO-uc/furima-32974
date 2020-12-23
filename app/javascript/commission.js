function commissionCalc () {
  const itemPrice = document.getElementById('item-price');
  itemPrice.addEventListener('keyup', () => {
    const commissionVal = parseInt(itemPrice.value / 10);
    const profitVal = (itemPrice.value - commissionVal);
    const commission = document.getElementById('add-tax-price');
    commission.innerHTML = commissionVal;
    const profit = document.getElementById('profit')
    profit.innerHTML = profitVal;
  });
}

window.addEventListener('load', commissionCalc);
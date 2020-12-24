function commissionCalc () {
  const itemPrice = document.getElementById('item-price');
  itemPrice.addEventListener('keyup', () => {
    const commissionVal = parseInt(itemPrice.value / 10);
    const profitVal = (itemPrice.value - commissionVal);
    const commission = document.getElementById('add-tax-price');
    commission.innerHTML = commissionVal.toLocaleString();
    const profit = document.getElementById('profit')
    profit.innerHTML = profitVal.toLocaleString();
  });
}

window.addEventListener('load', commissionCalc);
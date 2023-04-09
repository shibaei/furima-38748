window.addEventListener('load', function(){

  const priceInput = document.getElementById('item-price');
  const addTaxPrice = document.getElementById('add-tax-price');
  const profit = document.getElementById('profit');

function calcCommission(price) {
  const commissionRate = 0.1;
  const commission = Math.floor(price * commissionRate);
  return commission;
}

function calcProfit(price, commission) {
  const profit = price - commission;
  return profit;
}

priceInput.addEventListener('input', function() {
  const price = priceInput.value;
  const commission = calcCommission(price);
  const profitValue = calcProfit(price, commission);
  addTaxPrice.innerHTML = commission.toLocaleString();
  profit.innerHTML = profitValue.toLocaleString();
});
});
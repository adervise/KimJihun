function factorial(number) {

  var product = 1;
  for (var i = number; i >= 1; --i) {
    console.log("i :", i);
    product *= i;
  }
  return product;
}

console.log(factorial(4));
console.log(factorial(5));
console.log(factorial(10));

console.log("*********************");

function curve(arr, amount) {
  for (var i = 0; i < arr.length; i++) {
    arr[i] += amount;
  }
}

var grades = [77, 73, 74, 81, 90];
curve(grades,5)
console.log(grades);

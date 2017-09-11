var number = 1;
var sum = 0;
while (number < 11) {
  console.log("first Sum :",sum,",first Num:",number);
  sum += number;
  console.log("second Sum :",number,",second Num:",sum);
  ++number;
  console.log("now Number :",number);
}
console.log(sum);

console.log("----------------------");
for (var number = 1; number < 11; number++) {
  sum += number
}
console.log("Sum (for) : ",sum);

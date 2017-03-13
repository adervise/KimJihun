function Checking(amount) {
  this.balance = amount; //프로퍼티
  this.deposit = deposit; //함수
  this.withdraw = withdraw; //함수
  this.toString = toString; //함수
}


function deposit(amount) {
  this.balance += amount;
}


function withdraw(amount) {
  if (amount <= this.balance) {
    this.balance -= amount;
  }
  if (amount > this.balance) {
    console.log("Insufficient Funds");
  }
}


function toString() {
  return "Balance " + this.balance;
}

var account = new Checking(500);
account.deposit(1000);
console.log(account.toString()); // Balance 1500 출력

account.withdraw(750);
console.log(account.toString()); // Balance 750 출력

account.withdraw(800) // Insufficient Funds 출력
console.log(account.toString());

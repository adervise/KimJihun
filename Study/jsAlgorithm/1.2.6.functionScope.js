/*
scope는 전역 변수이므로 showScope() 함수는 scope에 접근 할 수 있다.
전역 변수는 함수 정의 전이든 후든 관계없이 프로그램의 어느 곳에서나 선언할 수 있다.
*/

function showScope() {
  return scope;
}

var scope = "global";
console.log(scope); //global 출력
console.log(showScope()); //"global 출력"

console.log("---------------------------"); //"global 출력"

/*
showScope()함수 내부에 선언한 scope 변수는 지역 범위를 가지며 메인 프로그램에서 선언한 scope 변수는 전역 변수 이다.
두 변수의 이름은 같지만 서로 다른 범위를 갖는다. 따라서 변수는 자신이 정의되고 사용되는 곳이 어디냐에 따라 다른 값을 갖는다.
자바스크립트는 var 선언 없이도 변수를 선언 할 수 있지만 var 없이 변수를 선언하면 (함수내에 선언했다 할지라도) 그 변수는 자동으로 전역 범위를 갖는다.
*/

function showScope() {
  var scope = "local";
  return scope;
}
var scope = "global";
console.log(scope); //global 출력
console.log(showScope()); //"global 출력"

console.log("---------------------------"); //"global 출력"
/*
전역 변수 남용의 결과
*/

function showScope() {
  scope = "local";
  return scope;
}
scope = "global";
console.log(scope); //global 출력
console.log(showScope()); //"local 출력"
console.log(scope); //local 출력

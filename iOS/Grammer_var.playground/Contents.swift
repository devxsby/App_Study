import UIKit

/*
 변수 : 변할 수 있는 값을
 var 변수명: 데이터 타입 = 값
 */

var name: String = "Avery"
var age: Int = 25

name
name = "에이버리"

age
age = 30

/*
 상수 : 변하지 않는 일정한 값
 let 상수명: 데이터 타입 = 값
 */

let one: Int = 1
let two: Int = 2

/*
 함수: 어떤 작업을 수행하는 코드의 집합
 func 함수명(파라미터 이름: 데이터 타입) -> 반환타입 {
   // 특정 작업을 수행하는 코드를 작성
 }
 */

func sayHello(name: String) -> String {
    return "Nice to meet you, \(name)"
}

sayHello(name: "에이버리")

func introduce(name: String, age: Int) -> String {
    return "Hi, My name is \(name) , I'm \(age)"
}

introduce(name: name, age: age)

func add(a: Int, b: Int) -> Int {
    return a + b
}

add(a: 2, b: 3)

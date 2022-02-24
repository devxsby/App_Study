import UIKit

/*
    if 조건문 {
        // 조건문이 "참"일 때 실행
    }else{
    
    }
*/

var isChecked = false

if isChecked {
    print("체크되어 있습니다.") // true일때
}else{
    print("체크되어 있지 않습니다.") // false일때
}
/*
    if 조건문1 {
        // 해당 {조건문1}이 "참"일 때 실행
    }else if 조건문2 {
        // 해당 {조건문2}이 "참"일 때 실행
    }else{
    
    }
*/

var time = 10

if time == 9 {
    print("아침식사 시간입니다.")
}else if time == 12 {
    print("점심식사 시간입니다.")
}else if time == 19 {
    print("저녁식사 시간입니다.")
}else {
    print("자유시간입니다.")
}

/*
    switch 입력변수 {
    case 입력값1:
        // 입력변수가 입력값1과 일치할 때 실행
    case 입력값2:
    case 입력값3:
    default:
        // 어떤 입력값과 일치하지 않을 때 실행
    }
*/

let color = #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1) // #colorLiteral( 입력하고 왼쪽에 색상클릭함
switch color {
case #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1):
    print("흰색입니다.")
case #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1):
    print("검정색입니다.")
case #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1):
    print("하늘색입니다.")
default:
    print("비교할 수 있는 색상이 없습니다.")
}

/*
     guard 조건 else {
     // 조건에 맞지 않을 때 실행
     return
     }
 */

func getName(name: String?) -> String{
    guard let uName = name else {
        return "이름값이 존재하지 않습니다."
    }
    return uName
}

getName(name: "subin")
getName(name: nil)

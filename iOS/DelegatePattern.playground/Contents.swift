import UIKit

/*
 Delegate Pattern
 
 - 한 클래스와 다른 클래스의 상호작용을 간단하게 할 수 있다.
 - 프로토콜을 이용하여 클래스 간 요구사항의 전달이 수월해진다.
 - 클래스 또는 구조체를 상속할 필요가 없기 때문에 가볍게 사용할 수 있다.
 
 => 해야하는 일의 일부분을 위임하고 대신 처리해주는 것
 
 remind !
  에이버리에게 풀기 어려운 수학문제가 있다.
  수학 천재인 해리에게 숙제를 풀어달라 한다.
  에이버리가 해리에게 숙제를 풀어달라고 하면 풀어주는 약속
 */

protocol HomeDelegate {
    func solveMathProblem()
}

class Me: HomeDelegate {
    
    var harry = MathMaster()
    
    func askForHelp(){
        self.harry.delegate = self // 우항 self엔 avery가 들어감
        self.harry.didHomework()
    }
    func solveMathProblem() {
        print("숙제가 완료되었습니다.")
    }
}

class MathMaster {
    var delegate: HomeDelegate?
    
    func didHomework(){
        self.delegate?.solveMathProblem()
    }
}

var avery = Me()
avery.askForHelp()

//
//  ViewController.swift
//  OddOrEvenGame
//
//  Created by 윤수빈 on 2022/02/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var computerBallCountLbl: UILabel!
    @IBOutlet weak var userBallCountLbl: UILabel!
    
    var comBallCount: Int = 20
    var userBallCount: Int = 20
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        computerBallCountLbl.text = String(comBallCount)
        userBallCountLbl.text = String(userBallCount)
    }

    @IBAction func gameStartPressed(_ sender: Any) {
        print("게임 시작 ~~!")
    }
}

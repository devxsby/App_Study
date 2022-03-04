//
//  ViewController.swift
//  OddOrEvenGame
//
//  Created by subinyoon on 2022/02/23.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, SettingDelegate {
    
    @IBOutlet weak var computerBallCountLbl: UILabel!
    @IBOutlet weak var userBallCountLbl: UILabel!
    @IBOutlet weak var resultLbl: UILabel!
    @IBOutlet weak var imageContainer: UIView!
    @IBOutlet weak var fistImage: UIImageView!
    
    var player: AVAudioPlayer?
    var comBallCount: Int = 20
    var userBallCount: Int = 20
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        computerBallCountLbl.text = String(comBallCount)
        userBallCountLbl.text = String(userBallCount)
        self.imageContainer.isHidden = true
        
        self.play(fileName: "intro")
    }
    
    func play(fileName: String){
        let filePath = Bundle.main.url(forResource: fileName, withExtension: "mp3")
        guard let path = filePath else{
            return
        }
        
        do {
            self.player = try AVAudioPlayer(contentsOf: path)
            
            guard let soundPlayer = self.player else{
                return
            }
            
            soundPlayer.prepareToPlay()
            soundPlayer.play()
            
        } catch let error {
            print("\(error.localizedDescription)")
        }
    }

    @IBAction func gameStartPressed(_ sender: Any) {
        self.imageContainer.isHidden = false
        
        self.play(fileName: "gamestart")
        
        UIView.animate(withDuration: 3.0) {
            self.fistImage.transform = CGAffineTransform(scaleX: 5, y: 5)
            self.fistImage.transform = CGAffineTransform(scaleX: 1, y: 1)
        } completion: { _ in
            self.imageContainer.isHidden = true
            self.showAlert()
        }
    }
    
    
    @IBAction func settingBtnPressed(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let settingVC = storyboard.instantiateViewController(identifier: "SettingViewController") as! SettingViewController
        settingVC.settingDelegate = self
        settingVC.modalPresentationStyle = .fullScreen
        self.present(settingVC, animated: true, completion: nil)
        
    }
    
    func showAlert(){
        let alert = UIAlertController.init(title: "GAME START", message: "홀 짝을 선택해주세요.", preferredStyle: .alert) // actionSheet : 하단에서 나오는 거
        
        let oddBtn = UIAlertAction.init(title: "홀", style: .default) { _ in
            self.play(fileName: "click")
            
            guard let input = alert.textFields?.first?.text, let value = Int(input) else {
                return
            }
            
            self.getWinner(count: value, select: "홀")
        }
        
        let evenBtn = UIAlertAction.init(title: "짝", style: .default) { _ in
            self.play(fileName: "click")
            
            guard let input = alert.textFields?.first?.text else {
                return
            }
            
            guard let value = Int(input) else {
                return
            }
            
            self.getWinner(count: value, select: "짝")
        }
        
        alert.addTextField { textField in
            textField.placeholder = "베팅할 구슬의 개수를 입력해주세요."
        }
        
        alert.addAction(oddBtn)
        alert.addAction(evenBtn)
        
        self.present(alert, animated: true) {
            print("화면이 띄워졌습니다.")
        }
    }
    
    func getWinner(count: Int, select: String){
        
        let com = self.getRandom()
        let comType = com % 2 == 0 ? "짝" : "홀"
        
        var result = comType
        if comType == select {
            print("User Win")
            result = result + "(User Win)"
            self.resultLbl.text = result
            self.calculateBalls(winner: "user", count: count)
        }else{
            print("Computer Win")
            result = result + "(Computer Win)"
            self.resultLbl.text = result
            self.calculateBalls(winner: "com", count: count)
        }
    }
    
    func checkAccountEmpty(balls: Int) -> Bool {
        return balls == 0
    }
    
    func calculateBalls(winner: String, count: Int){
        
        if winner == "user" {
            self.userBallCount = self.userBallCount + count
            self.comBallCount = self.comBallCount - count
            
            if self.checkAccountEmpty(balls: self.comBallCount) {
                self.resultLbl.text = "사용자 최종승리"
        }
            
        }else{
            self.userBallCount = self.userBallCount - count
            self.comBallCount = self.comBallCount + count
            
            if self.checkAccountEmpty(balls: self.userBallCount) {
                self.resultLbl.text = "컴퓨터 최종승리"
            }
        }
        
        self.userBallCountLbl.text = "\(self.userBallCount)"
        self.computerBallCountLbl.text = "\(self.comBallCount)"
    }
    
    func getRandom() -> Int {
        return Int(arc4random_uniform(10) + 1)
    }
    func getBallsCount(ballsCount: Int) {
        self.userBallCountLbl.text = "\(ballsCount)"
        self.computerBallCountLbl.text = "\(ballsCount)"
    }
}

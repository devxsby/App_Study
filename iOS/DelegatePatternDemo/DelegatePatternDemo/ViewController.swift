//
//  ViewController.swift
//  DelegatePatternDemo
//
//  Created by 윤수빈 on 2022/03/02.
//

import UIKit

class ViewController: UIViewController, UserInfoDelegate {
    @IBOutlet weak var userNameLbl: UILabel!
    @IBOutlet weak var userAgeLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func btnPressed(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(identifier: "InputViewController") as InputViewController
        
        viewController.delegate = self
        
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
    func getUserInfo(name: String, age: String) {
        print("userName \(name) , userAge \(age)")
        self.userNameLbl.text = name
        self.userAgeLbl.text = age
    }
}

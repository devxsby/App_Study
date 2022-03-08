//
//  SignOutViewController.swift
//  SignUp
//
//  Created by 윤수빈 on 2022/03/07.
//

import UIKit
import Firebase

protocol UserLogDelegate {
    func getUserLog(email: String)
}

class SignOutViewController: UIViewController {
    @IBOutlet weak var loginEmail: UILabel!
    
    var userLogDelegate: UserLogDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if Auth.auth().currentUser != nil {
            let user = Auth.auth().currentUser
            self.loginEmail.text = "\(user!.email ?? "")"
        }
    }
    
    @IBAction func confirmBtnPressed(_ sender: UIButton) {
        // 여기부터~~~~~시작
    }
    
    @IBAction func logOutBtnPressed(_ sender: UIButton) {
        
        do {
            try Auth.auth().signOut()
        } catch let signOutError as NSError {
            print("Error signing out: %@", signOutError)
        }
        self.dismiss(animated: true, completion: nil)
    }
}


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
            self.loginEmail.text = "\(String(describing: Auth.auth().currentUser))"
            }
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


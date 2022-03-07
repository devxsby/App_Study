//
//  ViewController.swift
//  SignUp
//
//  Created by 윤수빈 on 2022/03/05.
//

import UIKit
import Firebase

class ViewController: UIViewController, UserInfoDelegate, UserLogDelegate {
    
    @IBOutlet weak var userEmailTextField: UITextField!
    @IBOutlet weak var userPasswordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func loginBtnPressed(_ sender: UIButton) {
        guard let userEmail = userEmailTextField.text else { return }
        guard let userPassword = userPasswordTextField.text else { return }
        
        Auth.auth().signIn(withEmail: userEmail, password: userPassword) { [weak self] authResult, error in
            guard self != nil else { return }
            
            if authResult != nil {
                print("로그인 성공")
                let board = UIStoryboard(name: "Main", bundle: nil)
                let signoutVC = board.instantiateViewController(identifier: "SignOutViewController") as! SignOutViewController
                signoutVC.userLogDelegate = self
                signoutVC.modalPresentationStyle = .fullScreen
                self?.present(signoutVC, animated: true, completion: nil)
            } else {
                self?.showAlert()
                print("로그인 실패", error?.localizedDescription ?? "")
            }
        }
    }
    
    func showAlert(){
        let alert = UIAlertController.init(title: "로그인 실패", message: "아이디, 비밀번호를 다시 확인해주세요.", preferredStyle: UIAlertController.Style.alert)
        let defaultAction = UIAlertAction(title: "확인", style: UIAlertAction.Style.default)
        alert.addAction(defaultAction)
        self.present(alert, animated: false)
    }
    
    @IBAction func SignUpRegisterBtn(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let signupVC = storyboard.instantiateViewController(identifier: "SignUpViewController") as! SignUpViewController
        
        signupVC.delegate = self
        self.present(signupVC, animated: true, completion: nil)
    }
    
    func getUserInfo(email: String, password: String) {
        print("userEmail \(email) , userPassword \(password) ")
        self.userEmailTextField.text = email
        self.userPasswordTextField.text = password
    }
    
    func getUserLog(email: String) {
        self.userEmailTextField.text = email
    }
}


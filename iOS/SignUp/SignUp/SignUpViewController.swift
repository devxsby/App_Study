//
//  SignUpViewController.swift
//  SignUp
//
//  Created by 윤수빈 on 2022/03/05.
//

import UIKit
import Firebase

protocol UserInfoDelegate {
    func getUserInfo(email: String, password: String)
}

class SignUpViewController: UIViewController, UITextFieldDelegate {

    var delegate: UserInfoDelegate?
    var ref: DatabaseReference!
    
    @IBOutlet weak var emailSignUpTF: UITextField!
    @IBOutlet weak var passwordSignUpTF: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        emailSignUpTF.delegate = self
        passwordSignUpTF.delegate = self
    }
    
    @IBAction func SignUpRegisterBtn(_ sender: UIButton) {
        
        guard let signUpEmail = emailSignUpTF.text else { return }
        guard let signUpPassword = passwordSignUpTF.text else { return }
        
        Auth.auth().createUser(withEmail: signUpEmail, password: signUpPassword) { [self] authResult, error in
            print(error?.localizedDescription as Any)
    
            guard let user = authResult?.user, error == nil else { return }
            print("\(user.email!) 회원가입 완료")
            self.dismiss(animated: true, completion: nil)
        }
    }
    
    // 취소버튼 누르면 action segue로 팝업된 현재 뷰 컨트롤러를 사라지게 한다.
    @IBAction func SignUpCancelBtn(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
}

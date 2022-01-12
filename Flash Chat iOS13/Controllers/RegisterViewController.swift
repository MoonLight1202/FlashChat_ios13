//
//  RegisterViewController.swift
//  Flash Chat iOS13
//
//  Created by Angela Yu on 21/10/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit
import Firebase
class RegisterViewController: UIViewController {
    
    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    
    @IBAction func registerPressed(_ sender: UIButton) {
        
        if let email = emailTextfield.text, let password = passwordTextfield.text{
            Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
                if let e = error {
                    let alert = UIAlertController(title: K.warringNotice, message: e.localizedDescription, preferredStyle: .alert)
                    
                    //Khởi tạo các action (các nút) cho alert
                    let alertActionOk = UIAlertAction(title: "OK", style: .default) { (act) in
                        self.passwordTextfield.text = "" //action khi nhấn nút OK
                    }
                    //Thêm các action vào alert
                    alert.addAction(alertActionOk)
                    
                    //Hiển thị alert
                    self.present(alert, animated: true, completion: nil)
                    print(e.localizedDescription)
                } else {
                    self.performSegue(withIdentifier: K.registerSegue, sender: self)
                }
            }
        }
    }
}

//
//  AuthViewController.swift
//  Coppel App
//
//  Created by Etwan on 10/11/23.
//

import UIKit

class AuthViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var logInButton: UIButton!
    @IBOutlet weak var secureText: UIButton!
    @IBOutlet weak var splash: UIView!
    
    @IBOutlet weak var mailError: UILabel!
    @IBOutlet weak var passwordError: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.title = "Inicia Sesión"
        self.navigationController?.isNavigationBarHidden = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        checkVersionApp()
    }
    
    func checkVersionApp(){
        print("Está corriendo la versión \(Bundle.main.releaseVersionNumber ?? "1.0")")
        FirebaseConnection().getRemoteVersion(view: self)
    }
    
    @IBAction func logInButtonAction(_ sender: Any) {
        if let email = AuthController().checkEmail(view: self).text, let password = AuthController().checkPassword(view: self).text {
            if email != "" && password != "" {
                AuthController().login(user: User(email: email, password: password), view: self)
            }
        }
        //self.navigationController?.pushViewController(HomeViewController(), animated: true)
    }
    @IBAction func secureText(_ sender: Any) {
        if passwordTextField.isSecureTextEntry == true {
            passwordTextField.isSecureTextEntry = false
            secureText.setImage(UIImage(named: "visible"), for: .normal)
        }else {
            passwordTextField.isSecureTextEntry = true
            secureText.setImage(UIImage(named: "not visible"), for: .normal)
        }
    }
    
}


//
//  AuthController.swift
//  Coppel App
//
//  Created by Etwan on 13/11/23.
//

import Foundation
import FirebaseCore
import FirebaseAuth
import UIKit

class AuthController: NSObject{
    
    func checkEmail(view:AuthViewController) -> UITextField {
        view.mailError.isHidden = true
        if view.emailTextField.text == "" {
            view.mailError.isHidden = false
        }
        return view.emailTextField
    }
    
    func checkPassword(view:AuthViewController) -> UITextField {
        view.passwordError.isHidden = true
        if view.passwordTextField.text == "" {
            view.passwordError.isHidden = false
        }
        return view.passwordTextField
    }
        
    func login(user: User, view: AuthViewController){
        Auth.auth().signIn(withEmail: user.email, password: user.password){ (result, error) in
            if let result = result, error == nil{
                print(result)
                view.navigationController?.pushViewController(HomeViewController(), animated: true)
            }else{
                var message = ""
                if error.debugDescription.contains("INVALID_LOGIN_CREDENTIALS"){
                    message = "Verifica tus datos de usuario"
                }else {
                    message = error!.localizedDescription
                }
                
                let alertController = UIAlertController(title: "Error de Autenticación", message: message, preferredStyle: .alert)
                alertController.addAction(UIAlertAction(title: "Aceptar", style: .default))
                view.present(alertController, animated: true, completion: nil)
                print("-----------------------------------------------------")
                if error.debugDescription.contains("INVALID_LOGIN_CREDENTIALS"){
                    print("Error de credenciales")
                }
            }
        }
    }
    
}

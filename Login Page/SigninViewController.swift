//
//  SigninViewController.swift
//  Login Page
//
//  Created by Catalin Palade on 02/10/2018.
//  Copyright © 2018 Catalin Palade. All rights reserved.
//

import UIKit
import LocalAuthentication

class SigninViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var biometricOutlet: UIButton!
    
    // uncomment the line in viewDidLoad to hide the registration after first registration because can change the user details
    @IBOutlet weak var registerStackOutlet: UIStackView!
    
    
    @IBAction func biometricTapped(_ sender: UIButton) {
        authenticate()
    }
    
    @IBAction func singinTapped(_ sender: UIButton) {

        let username = usernameTextField.text
        let password = passwordTextField.text
        
        checkLogin(username, password)
        
    }
    
    var loginEmail = ""
    var loginPassword = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        
        passwordTextField.delegate = self

        let status = UserDefaults.standard.bool(forKey: "status") ?? false
        if status {
            
        }
        
        if status {
            loginEmail = UserDefaults.standard.string(forKey: "email") ?? ""
            loginPassword = UserDefaults.standard.string(forKey: "password") ?? ""
            
            biometricOutlet.isHidden = false
//            registerStackOutlet.isHidden = true
            
        } else {
            biometricOutlet.isHidden = true
//            registerStackOutlet.isHidden = false
        }
        
    }
    

    fileprivate func checkLogin(_ username: String?, _ password: String?) {
        // check if username or password is empty
        if (username?.isEmpty)! || (password?.isEmpty)! {
            
            showAlert(withTitle: "Incomplete", message: "User name or password is missing. Please try again.")
            
        } else {
            
            // check if username and password match
            if checkLoginMatch(username!, password!) {
                let vc = storyboard?.instantiateViewController(withIdentifier: "MasterViewController") as? UINavigationController
                present(vc!, animated: true)
            } else {
                
                showAlert(withTitle: "Incorrect" ,message: "User name or password is incorrect. Please try again.")
                
            }
        }
    }
    
    fileprivate func checkLoginMatch(_ username: String, _ password: String) -> Bool {
        return username == loginEmail && password == loginPassword
    }
   
    fileprivate func showAlert(withTitle title: String, message: String) {
        let ac = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default)
        ac.addAction(action)
        present(ac, animated: true)
    }
    
    fileprivate func authenticate() {
        let context = LAContext()
        var error: NSError?
        
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics,
                                     error: &error) {
            let reason = "Secret photos"
            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics,
                                   localizedReason: reason) { [unowned self] (success, authenticationError) in
                                    DispatchQueue.main.async {
                                        if success {
                                            let vc = self.storyboard?.instantiateViewController(withIdentifier: "MasterViewController") as? UINavigationController
                                            self.present(vc!, animated: true)
                                        } else {
                                            let ac = UIAlertController(title: "Authentication failed",
                                                                       message: "You could not be verified, please try again.",
                                                                       preferredStyle: .alert)
                                            ac.addAction(UIAlertAction(title: "OK", style: .default))
                                            self.present(ac, animated: true)
                                        }
                                    }
            }
        } else {
            //no biometry
            let ac = UIAlertController(title: "Biometry unavailable",
                                       message: "your device in not configured for biometric authentication.",
                                       preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "OK", style: .default))
            self.present(ac, animated: true)
        }
    }
    
}

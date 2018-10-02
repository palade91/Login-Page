//
//  RegisterViewController.swift
//  Login Page
//
//  Created by Catalin Palade on 02/10/2018.
//  Copyright © 2018 Catalin Palade. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController{
    
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
   
    
    
    @IBAction func SingupTapped(_ sender: UIButton) {
        
        
//        passwordTextField.delegate = self
        
        let firstName = firstNameTextField.text
        let lastName = lastNameTextField.text
        let email = emailTextField.text
        let password = passwordTextField.text
        
        if (firstName?.isEmpty)! || (lastName?.isEmpty)! || (email?.isEmpty)! || (password?.isEmpty)! {
            
            showAlert(withTitle: "Incomplete", message: "Please fill all the fields.")
            
        } else {
            let user = User(firstName: firstName!, lastName: lastName!, email: email!, password: password!)
            UserDefaults.standard.set(true, forKey: "status")
        
            UserDefaults.standard.set(user.firstName, forKey: "firstName")
            UserDefaults.standard.set(user.lastName, forKey: "lastName")
            UserDefaults.standard.set(user.email, forKey: "email")
            UserDefaults.standard.set(user.password, forKey: "password")
            
            let vc = storyboard?.instantiateViewController(withIdentifier: "SigninViewController") as! SigninViewController
            present(vc, animated: true, completion: nil)
            
        }
        
        
        
        
        
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        
        textField.resignFirstResponder()
        
        return true
    }
    
    fileprivate func showAlert(withTitle title: String, message: String) {
        let ac = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default)
        ac.addAction(action)
        present(ac, animated: true)
    }
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    

}

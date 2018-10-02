//
//  ViewController.swift
//  Login Page
//
//  Created by Catalin Palade on 02/10/2018.
//  Copyright © 2018 Catalin Palade. All rights reserved.
//

import UIKit

class MasterViewController: UIViewController {
    
    let user = User(firstName: UserDefaults.standard.string(forKey: "firstName") ?? "",
                    lastName: UserDefaults.standard.string(forKey: "lastName") ?? "",
                    email: UserDefaults.standard.string(forKey: "email") ?? "",
                    password: UserDefaults.standard.string(forKey: "password") ?? "")

    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(user.firstName)
        print(user.lastName)
        print(user.email)
        print(user.password)
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }


}


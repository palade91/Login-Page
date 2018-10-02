//
//  User.swift
//  Login Page
//
//  Created by Catalin Palade on 02/10/2018.
//  Copyright © 2018 Catalin Palade. All rights reserved.
//

import Foundation

class User {
    
    let firstName: String
    let lastName: String
    let email: String
    let password: String
    
    
    init(firstName: String, lastName: String, email: String, password: String) {
        self.firstName = firstName
        self.lastName = lastName
        self.email = email
        self.password = password
    }
    
}

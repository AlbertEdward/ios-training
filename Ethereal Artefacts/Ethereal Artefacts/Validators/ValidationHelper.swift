//
//  EmailValidator.swift
//  Ethereal Artefacts
//
//  Created by Albert Khurshudyan on 8.05.23.
//

import Foundation

struct ValidationHelper{
    
    static func validateEmail(_ email: String) -> Bool {
        let emailRegex = Authentication.emailRegex
        let emailPredicate = NSPredicate(format:"SELF MATCHES %@", emailRegex)
        return emailPredicate.evaluate(with: email)
    }
    
    static func validatePassword(_ password: String) -> Bool {
        let minPasswordLength = Authentication.minPasswordLength
        return password.count >= minPasswordLength && !password.contains(" ")
    }
}

//
//  EmailValidator.swift
//  Ethereal Artefacts
//
//  Created by Albert Khurshudyan on 8.05.23.
//

import Foundation

func validateEmail(_ email: String) -> Bool {
    let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
    let emailPredicate = NSPredicate(format:"SELF MATCHES %@", emailRegex)
    return emailPredicate.evaluate(with: email)
}

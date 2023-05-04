//
//  LoginView.swift
//  Ethereal Artefacts
//
//  Created by Albert Khurshudyan on 3.05.23.
//

import SwiftUI

struct LoginView: View {
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var isEmailValid: Bool = true
    @State private var showPassword: Bool = false
    @State private var loginError: String? = nil
    
    let validUsername = "user@example.com"
    let validPassword = "1122"
    
    var body: some View {
        ZStack {
            Image("EtherealArtefacts_login_background")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .edgesIgnoringSafeArea(.all)
            VStack{
                VStack{
                    Image("Ethereal Artefacts_Logo")
                        .resizable()
                        .frame(width: 256, height: 161)
                        .padding(.bottom, 20)
                }
                VStack (alignment: .leading, spacing: 20) {
                    Text("Log in")
                        .font(.system(size: 22, weight: .bold))
                        .foregroundColor(Color.purple)
                    
                    TextField("Email", text: $username, onEditingChanged: { isEditing in
                        if !isEditing {
                            self.isEmailValid = self.validateEmail(self.username)
                        }
                    })
                    .padding()
                    .background(Color.white)
                    .foregroundColor(isEmailValid ? Color(.black) : Color.red)
                    .cornerRadius(10)
                    .padding(.bottom, 10)
                    
                    SecureField("Password", text: $password)
                        .padding()
                        .foregroundColor(Color.black)
                        .background(Color.white)
                        .cornerRadius(10)
                        .padding(.bottom, 20)
                        .overlay(
                            HStack {
                                Spacer()
                                Button(action: {
                                    self.showPassword.toggle()
                                }) {
                                    Image(systemName: showPassword ? "eye.fill" : "eye.slash.fill")
                                        .foregroundColor(.gray)
                                }
                                .padding(.trailing, 20)
                                .accentColor(.gray)
                            }
                                .padding(.bottom, 20)
                        )
                    
                    
                    Button(action: {
                        if self.username == validUsername && self.password == validPassword {
                            self.loginError = nil
                            self.password = ""
                        } else {
                            self.loginError = "Invalid credentials"
                        }
                    }) {
                        Text("Log in")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding()
                            .frame(minWidth: 0, maxWidth: .infinity)
                            .background(Color.purple)
                            .cornerRadius(24)
                    }
                    .padding(20)
                    
                    if let error = loginError {
                        Text(error)
                            .foregroundColor(.red)
                    }
                    
                    Spacer()
                }
                
                .padding()
            }
            .padding(.top, 110)
        }
    }
    
    func validateEmail(_ email: String) -> Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let emailPredicate = NSPredicate(format:"SELF MATCHES %@", emailRegex)
        return emailPredicate.evaluate(with: email)
    }
}


struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}

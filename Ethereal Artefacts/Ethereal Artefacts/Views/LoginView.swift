//
//  LoginView.swift
//  Ethereal Artefacts
//
//  Created by Albert Khurshudyan on 3.05.23.
//

import SwiftUI

struct LoginView: View {
    @State private var userEmail: String = ""
    @State private var password: String = ""
    @State private var isEmailValid: Bool = true
    @State private var showPassword: Bool = false
    @State private var loginError: String? = nil
    @State private var isLoggedIn: Bool = false
    
    let validUserEmail = "user@example.com"
    let validPassword = "112233"
    
    var body: some View {
        NavigationStack {
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
                            .foregroundColor(Color("DeepPurple"))
                        
                        TextField("Email", text: $userEmail, onEditingChanged: { isEditing in
                            if !isEditing {
                                isEmailValid = ValidationHelper.validateEmail(userEmail.lowercased())
                            }
                        })
                        .padding()
                        .background(Color.white)
                        .foregroundColor(isEmailValid ? Color(.black) : Color.red)
                        .cornerRadius(10)
                        .padding(.bottom, 10)
                        
                        HStack {
                            if showPassword {
                                TextField("Password", text: $password)
                            } else {
                                SecureField("Password", text: $password)
                            }
                            Button(action: { showPassword.toggle() }) {
                                Image(systemName: showPassword ? "eye.slash.fill" : "eye.fill")
                                    .foregroundColor(.gray)
                            }
                        }
                        .padding()
                        .background(Color.white)
                        .cornerRadius(10)
                        .padding(.bottom, 10)
                        
                        loginButton()
                            .navigationDestination(isPresented: $isLoggedIn, destination: {HomepageView()})
                        
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
            .background()
        }
    }
    
    func loginButton() -> some View {
        Button(action: {
            if userEmail == validUserEmail && password == validPassword {
                loginError = nil
                isLoggedIn = true
            } else {
                loginError = "Invalid email address."
                password = ""
            }
        }) {
            Text("Log in")
                .font(.headline)
                .fontWeight(.bold)
                .foregroundColor(.white)
                .padding()
                .frame(minWidth: 20, maxWidth: .infinity)
                .background(Color("DeepPurple"))
                .cornerRadius(24)
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}

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
        NavigationView {
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
                            .foregroundColor(Color(hex: "47337A"))
                        
                        TextField("Email", text: $userEmail, onEditingChanged: { isEditing in
                            if !isEditing {
                                isEmailValid = validateEmail(userEmail.lowercased())
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
                                        showPassword.toggle()
                                    }) {
                                        Image(systemName: showPassword ? "eye" : "eye.slash")
                                            .foregroundColor(.gray)
                                    }
                                    .padding(.trailing, 20)
                                    .accentColor(.gray)
                                }
                                    .padding(.bottom, 20)
                            )
                        
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
                                .background(Color(hex: "47337A"))
                                .cornerRadius(24)
                        }
                        .padding()
                        
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
            .background(
                NavigationLink(
                    destination: HomepageView().navigationBarBackButtonHidden(true),
                    isActive: $isLoggedIn
                ) {
                    EmptyView()
                }
            )
        }
    }
}

extension Color {
    init(hex: String) {
        let scanner = Scanner(string: hex)
        var rgbValue: UInt64 = 0
        
        scanner.scanHexInt64(&rgbValue)
        
        let red = Double((rgbValue & 0xff0000) >> 16) / 255.0
        let green = Double((rgbValue & 0x00ff00) >> 8) / 255.0
        let blue = Double(rgbValue & 0x0000ff) / 255.0
        
        self.init(red: red, green: green, blue: blue)
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}

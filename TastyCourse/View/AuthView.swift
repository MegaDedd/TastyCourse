//
//  ContentView.swift
//  TastyCourse
//
//  Created by Константин on 01.06.2023.
//

import SwiftUI

struct AuthView: View {
    
    @State private var isTabViewShow = false
    @State private var isAuth = true
    
    @State private var email = ""
    @State private var password = ""
    @State private var confirmPassword = ""
    
    var body: some View {
        VStack(spacing: 20) {
            Text(isAuth ? "Авторизация" : "Регистрация")
                .padding(isAuth ? 16 : 24)
                .padding(.horizontal, 30)
                .font(.title2.bold())
                .background(Color("whiteAlfa"))
                .cornerRadius(isAuth ? 30 : 60)
            
            VStack {
                TextField("Введите email", text: $email)
                    .padding()
                    .background(Color("whiteAlfa"))
                    .cornerRadius(12)
                    .padding(8)
                    .padding(.horizontal, 12)
                
                SecureField("Введите пароль", text: $password)
                    .padding()
                    .background(Color("whiteAlfa"))
                    .cornerRadius(12)
                    .padding(8)
                    .padding(.horizontal, 12)
                
                if !isAuth {
                    SecureField("Повторите пароль", text: $confirmPassword)
                        .padding()
                        .background(Color("whiteAlfa"))
                        .cornerRadius(12)
                        .padding(8)
                        .padding(.horizontal, 12)
                }
                
                Button {
                    if isAuth {
                        print("Авторизация user через firebase")
                        isTabViewShow.toggle()
                    } else {
                        print("Регистрация пользователя")
                        self.email = ""
                        self.password = ""
                        self.confirmPassword = ""
                        self.isAuth.toggle()
                    }
                } label: {
                    Text(isAuth ? "Войти" : "Создать аккаунт")
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(LinearGradient(colors: [Color("yellow"), Color("orange")], startPoint: .leading, endPoint: .trailing))
                        .cornerRadius(12)
                        .padding(8)
                        .padding(.horizontal, 12)
                        .font(.title3.bold())
                        .foregroundColor(.black)
                }
                
                Button {
                        isAuth.toggle()
                } label: {
                    Text(isAuth ? "Еще не с нами?" : "Уже есть аккаунт?")
                        .padding(.horizontal)
                        .frame(maxWidth: .infinity)
                        .cornerRadius(12)
                        .padding(1)
                        .padding(.horizontal, 12)
                        .font(.title3.bold())
                        .foregroundColor(Color.blue)
                }
            }
            .padding()
            .padding(.top)
            .background(Color("whiteAlfa"))
            .cornerRadius(24)
            .padding(isAuth ? 30 : 12)
        }
        
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Image("pizzaBack")
            .ignoresSafeArea()
            .blur(radius: isAuth ? 0 : 6)
        )
        .animation(Animation.easeInOut(duration: 0.5), value: isAuth)
        .fullScreenCover(isPresented: $isTabViewShow) {
            TabBarView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        AuthView()
    }
}

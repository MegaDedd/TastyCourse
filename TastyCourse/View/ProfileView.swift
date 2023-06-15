//
//  ProfileView.swift
//  TastyCourse
//
//  Created by Константин on 01.06.2023.
//

import SwiftUI

struct ProfileView: View {
    
    @State var isAvaAlertPresented = false
    @State var isQuitAlertPresented = false
    @State var isAuthViewPresented = false
    
    @StateObject var viewModel: ProfileViewModel
    
    var body: some View {
        VStack(alignment: .center, spacing: 20) {
            HStack(spacing: 16) {
                Image(systemName: "person")
                    .resizable()
                    .frame(width: 80, height: 80)
                    .padding(8)
                    .background(Color("profilePerson"))
                    .clipShape(Circle())
                    .onTapGesture {
                        isAvaAlertPresented.toggle()
                    }
                    .confirmationDialog("Откуда взять фото", isPresented: $isAvaAlertPresented) {
                        Button {
                            print("Библиотека")
                        } label: {
                            Text("галерея")
                        }
                        Button {
                            print("Камера")
                        } label: {
                            Text("камера")
                        }

                    }
                
                VStack(alignment: .leading, spacing: 12) {
                    TextField("Имя", text: $viewModel.profile.name)
                        .fontWeight(.bold)
                    HStack {
                        Text("+7")
                        TextField("Номер тлф", value: $viewModel.profile.phone, format: .number)
                    }
                }
            }
            VStack(alignment: .leading, spacing: 8) {
                Text("Адресс доставки:")
                    .bold()
                TextField("Введите ваш адресс", text: $viewModel.profile.address)
            }
            .padding(.horizontal, 12)
            
            // таблица с заказами
            List {
                Text("ваши заказы будут здесь")
            }
            .listStyle(.plain)
            Button {
                isQuitAlertPresented.toggle()
            } label: {
                Text("выйти")
                    .padding()
                    .padding(.horizontal, 30)
                    .background(Color.red)
                    .cornerRadius(20)
                    .foregroundColor(.white)
                    .padding()
            }
            .confirmationDialog("Уверены что хотите выйти?", isPresented: $isQuitAlertPresented) {
                Button {
                    isAuthViewPresented.toggle()
                } label: {
                    Text("Yes")
                }
            }
            .fullScreenCover(isPresented: $isAuthViewPresented) {
                AuthView()
            }
        }
        
        .onSubmit {
            viewModel.setProfile()
        }
        
        .onAppear {
            self.viewModel.getProfile()
        }
        .padding(3)
        
    
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(viewModel: ProfileViewModel(profile: MWUser(id: "", name: "Konstantin topor", phone: 9277614241, address: "мой дом находиттся где то там")))
    }
}

//
//  TabView.swift
//  TastyCourse
//
//  Created by Константин on 01.06.2023.
//

import SwiftUI

struct TabBarView: View {
    var body: some View {
        TabView {
            NavigationStack {
                CatalogView()
            }
                .tabItem {
                    Label("Каталог", systemImage: "menucard")
                }
            
            CartView(viewModel: CartViewModel())
                .tabItem {
                    Label("Корзина", systemImage: "cart")
                }
            
            ProfileView()
                .tabItem {
                    Label("Профиль", systemImage: "person.circle")
                }
        }
    }
}

struct TabView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView()
    }
}

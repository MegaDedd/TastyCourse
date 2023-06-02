//
//  ProductCell.swift
//  TastyCourse
//
//  Created by Константин on 01.06.2023.
//

import SwiftUI

struct ProductCell: View {
    
    var product: Product
    
    var body: some View {
        VStack(spacing: 1) {
            Image("pizzaCell")
                .resizable()
                .aspectRatio(contentMode: .fill) // соотношение сторон .fill заполняет все достпуное прострнаство
                .frame(maxWidth: screen.width * 0.45)
                .clipped()
//                .cornerRadius(16)
                .padding(.bottom)
            HStack {
                Text(product.title)
                    .font(.custom("AvenirNext-regular", size: 12))
                Spacer()
                Text("\(product.price)₽")
            }
            .padding(.horizontal, 6)
            .padding(.bottom, 6)
        }
        .frame(width: screen.width * 0.45, height: screen.width * 0.55)
        .background(.white)
        .cornerRadius(16)
        .shadow(radius: 8)
    }
}

struct ProductCell_Previews: PreviewProvider {
    static var previews: some View {
        ProductCell(product: Product(id: "1", title: "Margarita Gurme", imageURL: "Not Found", price: 450, description: "самая простая пицца"))
    }
}

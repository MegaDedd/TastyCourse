//
//  ProductDetailView.swift
//  TastyCourse
//
//  Created by Константин on 01.06.2023.
//

import SwiftUI

struct ProductDetailView: View {
    
    @State var size = "маленькая"
    @State var count = 1
    
    var viewModel: ProductDetailViewModel
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        
        VStack {
            VStack(alignment: .leading) {
                Image("pizzaShop")
                    .resizable()
                    .frame(maxWidth: .infinity,maxHeight: 360)
                
                HStack {
                    Text("\(viewModel.product.title)!")
                        .font(.title2.bold())
                    Spacer()
                    Text("\(viewModel.getPrice(size: self.size))₽")
                        .font(.title2)
                }
                .padding(.horizontal)
                Text("\(viewModel.product.description)")
                    .padding(.horizontal)
                    .padding(.vertical, 4)
                
                HStack {
                    Stepper("Количество", value: $count, in: 1...10)
                    Text("\(self.count)")
                        .padding(.leading)
                }
                .padding(.horizontal)
                
                Picker("Размер пиццы", selection: $size) {
                    ForEach(viewModel.sizes, id: \.self) { item in
                        Text(item)
                    }
                }
                .padding()
                .pickerStyle(.segmented)
            }
            
            Button {
                var position = Position(id: UUID().uuidString,
                                        product: viewModel.product,
                                        count: self.count)
                
                position.product.price = viewModel.getPrice(size: size)
                
                CartViewModel.shared.addPosition(position)
                dismiss()
            } label: {
                Text("В корзину")
                    .padding()
                    .padding(.horizontal, 40)
                    .foregroundColor(.black)
                    .font(.title3.bold())
                    .background(LinearGradient(colors: [Color("yellow"), Color("orange")], startPoint: .leading, endPoint: .trailing))
                    .cornerRadius(30)
            }

            Spacer()
        }
    }
}


struct ProductDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ProductDetailView(viewModel: ProductDetailViewModel(product: Product(id: "1",
                                                                             title: "Margarita Gurme",
                                                                             imageURL: "Not Found",
                                                                             price: 450,
                                                                             description: "Cамая простая пицца")
        ))
        
    }
}

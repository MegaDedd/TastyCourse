//
//  CardView.swift
//  TastyCourse
//
//  Created by Константин on 01.06.2023.
//

import SwiftUI

struct CartView: View {
    
    var viewModel: CartViewModel
    
    var body: some View {
        Text("CardView")
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CartView(viewModel: CartViewModel())
    }
}

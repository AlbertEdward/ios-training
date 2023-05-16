//
//  CartButton.swift
//  Ethereal Artefacts
//
//  Created by Albert Khurshudyan on 7.05.23.
//

import SwiftUI

struct CartButton: View {
    var numberOfProducts: Int = 0
    
    var body: some View {
        ZStack(alignment: .topTrailing){
            Image(systemName: "cart.fill")
                .font(.system(size: 25))
            
            if numberOfProducts > 0 {
                Text("\(numberOfProducts)")
                    .font(.caption2).bold()
                    .foregroundColor(.white)
                    .frame(width: 15, height: 15)
                    .background(Color("DeepPurple"))
                    .cornerRadius(50)
            }
        }
    }
}

struct CartButton_Previews: PreviewProvider {
    static var previews: some View {
        CartButton(numberOfProducts: 1)
    }
}


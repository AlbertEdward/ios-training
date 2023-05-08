//
//  ProductCard.swift
//  Ethereal Artefacts
//
//  Created by Albert Khurshudyan on 8.05.23.
//

import SwiftUI

struct ProductCard: View {
    var product: Product
    
    var body: some View {
        NavigationLink(destination: ProductDetailsView(product: product)){
            HStack{
                Image(product.image)
                    .frame(width: 130, height: 130)
                
                VStack(alignment: .leading){
                    Text("Category: " + product.category)
                        .font(.system(size: 12))
                    
                    Text(product.name)
                        .font(.system(size: 16))
                        .bold()
                        .foregroundColor(.black)
                    
                    Text(product.description.prefix(15) + "...")
                        .font(.system(size: 14))
                    
                    Rating(rating: product.rating)
                        .padding(.bottom)
                    
                    Text(String(format: "$%.2f", product.price))
                        .font(.system(size: 16))
                        .foregroundColor(.black)
                }
            }
        }
    }
}

struct ProductCard_Previews: PreviewProvider {
    static var previews: some View {
        ProductCard(product: productList[0])
    }
}

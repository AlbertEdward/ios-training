//
//  ProductDetails.swift
//  Ethereal Artefacts
//
//  Created by Albert Khurshudyan on 7.05.23.
//

import SwiftUI

struct ProductDetailsView: View {
    var product: Product
    
    var body: some View {
        VStack(alignment: .leading) {
            Spacer()
            
            Image(product.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .opacity(1)
                .frame(maxWidth: .infinity)

            Spacer()
            
            HStack{
                Text(product.name)
                    .font(.system(size: 16))
                    .fontWeight(.bold)
                    .padding(.top)
                    .padding(.leading)
                
                Spacer()
                
                Rating(rating: product.rating)
                    .padding(.trailing)
            }
            
            Text("Category: " + product.category)
                .font(.system(size: 12))
                .padding(.leading)
            
            Text(product.description)
                .font(.body)
                .padding()
            
            Text(String(format: "$%.2f", product.price))
                .font(.system(size: 24))
                .fontWeight(.bold)
                .padding()
            Button(action: {
            }) {
                Text("Add to Cart")
                    .font(.headline)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding()
                    .frame(minWidth: 20, maxWidth: .infinity)
                    .background(Color("DeepPurple"))
                    .cornerRadius(24)
            }
            .padding()
            
            Spacer()
        }
        .navigationBarTitle("Product Details")
        .font(.system(size: 22))
        .toolbar{
            NavigationLink{
            } label: {
                CartButton()
            }
        }
    }
}

struct ProductDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        ProductDetailsView(product: productList[0])
    }
}

//
//  ProductDetails.swift
//  Ethereal Artefacts
//
//  Created by Albert Khurshudyan on 7.05.23.
//

import SwiftUI

struct ProductDetailsView: View {
    var body: some View {
        VStack(alignment: .leading) {
            HStack(){
                Spacer()
                Text("Product Details")
                    .font(.headline)
                    .fontWeight(.bold)
                Spacer()
                CartButton(numberOfProducts: 4)
                    .padding(20)
            }
            
            Image("Mask Group 3")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding()
                .opacity(1)
            
            HStack{
                Text("Stargazer’s Tea Set")
                    .font(.system(size: 16))
                    .fontWeight(.bold)
                    .padding()
                
                RatingView(rating: 4)
            }
            
            Text("Category: Home")
                .font(.system(size: 12))
                .fontWeight(.bold)
                .padding()
            
            Text("Indulge in a heavenly tea experience with our Stargazer’s Tea Set, featuring a constellation-themed teapot and matching teacups. Crafted from fine porcelain, this elegant set will transport you to the cosmos with every sip.")
                .font(.body)
                .padding()
            
            Text("$90.00")
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
                    .background(Color(hex: "47337A"))
                    .cornerRadius(24)
            }
            .padding()
            
            Spacer()
        }
        .navigationBarTitle("Name")
    }
}

struct ProductDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        ProductDetailsView()
    }
}


struct RatingView: View {
    let rating: Int
    let maxRating: Int = 5
    
    var body: some View {
        HStack(spacing: 2) {
            ForEach(1...maxRating, id: \.self) { index in
                Image(systemName: index <= rating ? "star.fill" : "star")
                    .foregroundColor(.yellow)
            }
        }
    }
}

//
//  HomepageView.swift
//  Ethereal Artefacts
//
//  Created by Albert Khurshudyan on 7.05.23.
//

import SwiftUI

struct HomepageView: View {    
    var body: some View {
        NavigationView() {
            VStack {
                HStack {
                    Text("Home")
                        .font(.title)
                        .fontWeight(.bold)
                    Spacer()
                    
                    Image(systemName: "person.circle.fill")
                        .font(.title)
                        .padding(.trailing, 8)
                    
                    CartButton(numberOfProducts: 4)
                }
                .padding(.horizontal)
                
                SearchField()
                
                HStack{
                    Text("New Products")
                        .font(.system(size: 24))
                    Spacer()
                    Filter(numberOfFilters: 3)
                }
                .padding(.horizontal)
                
                Spacer()
                
                ScrollView {
                    LazyVGrid(columns: [GridItem(.adaptive(minimum: 400))], alignment: .leading){
                        ForEach(productList, id: \.id)
                        {
                            product in ProductCard(product: product)
                            Divider()
                        }
                    }
                    .padding()
                }
            }
        }
        .accentColor(.black)
    }
}

struct HomepageView_Previews: PreviewProvider {
    static var previews: some View {
        HomepageView()
    }
}

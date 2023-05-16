//
//  HomepageView.swift
//  Ethereal Artefacts
//
//  Created by Albert Khurshudyan on 7.05.23.
//

import SwiftUI

struct HomepageView: View {
    @State private var searchText = ""
    
    var body: some View {
        VStack {
            VStack {
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
                        ForEach(productList, id: \.id) {
                          ProductCard(product: $0)
                          Divider()
                        }
                    }
                    .padding()
                }
            }
            .navigationBarTitle("Home")
            .font(.title)
            .navigationBarBackButtonHidden(true)
            .searchable(text: $searchText)
            .navigationBarItems(trailing:
                                    HStack(spacing: 16) {
                Image(systemName: "person.circle.fill")
                    .font(.system(size: 25))
                
                CartButton(numberOfProducts: 4)
                    .font(.system(size: 25))
            }
            )
        }
        .accentColor(.black)
    }
}

struct HomepageView_Previews: PreviewProvider {
    static var previews: some View {
        HomepageView()
    }
}

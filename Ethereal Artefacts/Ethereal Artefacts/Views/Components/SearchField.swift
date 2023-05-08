//
//  Search.swift
//  Ethereal Artefacts
//
//  Created by Albert Khurshudyan on 8.05.23.
//

import SwiftUI

struct SearchField: View {
    @State private var searchText = ""
    
    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundColor(.gray)
                .padding(.leading, 8)
            TextField("Search", text: $searchText)
                .padding(.vertical, 8)
                .padding(.horizontal, 8)
                .background(Color.gray.opacity(0.2))
                .cornerRadius(8)
            .padding(.horizontal, 8)
        }
        .padding(.horizontal)
    }
}

struct SearchField_Previews: PreviewProvider {
    static var previews: some View {
        SearchField()
    }
}

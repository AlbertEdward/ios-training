//
//  Rating.swift
//  Ethereal Artefacts
//
//  Created by Albert Khurshudyan on 7.05.23.
//

import SwiftUI

struct Rating: View {
    let rating: Int
    let maxRating: Int = 5
    
    var body: some View {
        HStack(spacing: 2) {
            Text("\(rating)")
                .bold()
                .font(.subheadline)
            
            ForEach(1...maxRating, id: \.self) { index in
                Image(systemName: index <= rating ? "star.fill" : "star")
                    .font(.caption2)
                    .foregroundColor(Color(hex: "67548B"))
            }
        }
    }
}

struct Rating_Previews: PreviewProvider {
    static var previews: some View {
        Rating(rating: 4)
    }
}

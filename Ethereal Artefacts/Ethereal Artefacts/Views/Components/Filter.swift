//
//  Filter.swift
//  Ethereal Artefacts
//
//  Created by Albert Khurshudyan on 8.05.23.
//

import SwiftUI

struct Filter: View {
    var numberOfFilters: Int = 0
    
    var body: some View {
        ZStack(alignment: .topTrailing){
            Image(systemName: "line.3.horizontal.decrease")
                .font(.system(size: 30))
                .bold()
            
            if numberOfFilters > 0 {
                Text("\(numberOfFilters)")
                    .font(.caption2).bold()
                    .foregroundColor(.white)
                    .frame(width: 15, height: 15)
                    .background(Color(hex: "47337A"))
                    .cornerRadius(50)
            }
        }
    }
}

struct Filter_Previews: PreviewProvider {
    static var previews: some View {
        Filter(numberOfFilters: 3)
    }
}

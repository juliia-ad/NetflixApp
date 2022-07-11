//
//  MoreLikeThis.swift
//  Netflix
//
//  Created by Júlia Dien on 6/3/22.
//

import SwiftUI

struct MoreLikeThis: View {
    
    var movies: [Movie]
    
    var columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        LazyVGrid(columns: columns) {
            ForEach(movies) { index in
                FrontPageMovie(movie: index)
                    .frame(width: 130, height: 200)
                    .clipped()
            }
        }
    }
}

struct MoreLikeThis_Previews: PreviewProvider {
    static var previews: some View {
        MoreLikeThis(movies: exampleMovies)
    }
}

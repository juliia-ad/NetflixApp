//
//  FrontPageMovie.swift
//  Netflix
//
//  Created by Júlia Dien on 9/2/22.
//

import SwiftUI
import KingfisherSwiftUI

struct FrontPageMovie: View {
    var movie: Movie
    
    var body: some View {
        KFImage(movie.thumbnail)
            .resizable()    //Adaptar tamaño de la imagen
            .aspectRatio(contentMode: .fill)
    }
}

struct FrontPageMovie_Previews: PreviewProvider {
    static var previews: some View {
        FrontPageMovie(movie: exampleMovie2)
    }
}

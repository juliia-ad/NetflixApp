//
//  TopMoviePreview.swift
//  Netflix
//
//  Created by Júlia Dien on 12/2/22.
//

import SwiftUI
import KingfisherSwiftUI

struct TopMoviePreview: View {
    var movie: Movie
    
    func isCategoryFirst(_ cat: String) -> Bool {
        return movie.categories.first == cat
    }
    
    var body: some View {
        ZStack {
            KFImage(movie.thumbnail)
                .resizable()
                .scaledToFill()
                .clipped()
            
            VStack {
                Spacer()
                
                HStack {
                    ForEach(movie.categories, id: \.self) { category in
                        if !isCategoryFirst(category) {
                            Image(systemName: "circle.fill")
                                .foregroundColor(.blue)
                                .font(.system(size: 5))
                        }
                        Text(category)
                            .font(.footnote)
                    }
                    
                }
                
                HStack {
                    Spacer()
                    
                    VerticalButton(title: "My List", imageOn: "checkmark", imageOff: "plus") {
                        //
                    }
                    
                    Spacer()
                    
                    PlayButton(title: "Play", image: "play.fill") {
                        //
                    }
                    .frame(width: 120)  //Reduces the available space of the button
                    
                    Spacer()
                    
                    VerticalButton(title: "Info", imageOn: "info.circle", imageOff: "info.circle") {
                        //
                    }
                    
                    Spacer()
                }
                
            }
            .background(
                LinearGradient.blackGradient
                    .padding(.top, 300)
            )
            .foregroundColor(.white)
        }
        
    }
}

struct TopMoviePreview_Previews: PreviewProvider {
    static var previews: some View {
        TopMoviePreview(movie: exampleMovie5)
    }
}

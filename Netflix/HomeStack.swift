//
//  HomeStack.swift
//  Netflix
//
//  Created by Júlia Dien on 12/4/22.
//

import Foundation
import SwiftUI

struct HomeStack: View {
    
    var vm: HomeVM
    var topRow: HomeTopRow
    var genre: HomeGenre
    
    @Binding var movieDetailShowing: Movie?
    
    var body: some View {
        ForEach(vm.Categories, id: \.self) { category in
            VStack {
                HStack {
                    Text(category)
                        .font(.title3)
                        .bold()
                    Spacer()
                }
                
                ScrollView(.horizontal, showsIndicators: false) {
                    LazyHStack{
                        ForEach(vm.getMovie(forCat: category, forTopRow: topRow, forGenre: genre)){ movie in
                            FrontPageMovie(movie: movie)
                                .frame(width: 150, height: 220)
                                .clipped()
                                .padding(.horizontal, 3)
                                .onTapGesture {
                                    movieDetailShowing = movie
                                }
                        }
                    }
                }
            }
        }
    }
}

struct HomeStack_Previews: PreviewProvider {
    static var previews: some View {
        ZStack{
            Color.black
                .edgesIgnoringSafeArea(.all)
            ScrollView{
                HomeStack(vm: HomeVM(), topRow: .home, genre: .AllGenres, movieDetailShowing: .constant(nil))
            }
        }
        .foregroundColor(.white)
    }
}


//
//  HomeView.swift
//  Netflix
//
//  Created by Júlia Dien on 9/2/22.
//

import SwiftUI

struct HomeView: View {
    
    var vm: HomeVM = HomeVM()
    
    let screen = UIScreen.main.bounds
    
    @State private var movieDetailShowing: Movie? = nil
    
    @State private var topRowSelection: HomeTopRow = .home
    @State private var genreSelection: HomeGenre = .AllGenres
    
    @State private var showGenreSelection: Bool = false
    @State private var showTopRowSelection: Bool = false
    
    var body: some View {
        ZStack{
            Color.black
                .edgesIgnoringSafeArea(.all)
            
            ScrollView(.vertical, showsIndicators: false) {
                LazyVStack {
                    
                    TopRowButtons(topRowSelection: $topRowSelection, genreSelection: $genreSelection, showGenreSelection: $showGenreSelection, showTopRowSelection: $showTopRowSelection)
                    
                    
                    TopMoviePreview(movie: exampleMovie4)
                        .frame(width: screen.width)
                        .padding(.top, -110)
                        .zIndex(-1) //puts the object behind
                    
                    HomeStack(vm: vm, topRow: topRowSelection, genre: genreSelection, movieDetailShowing: $movieDetailShowing)
                }
            }
            
            if movieDetailShowing != nil {
                MovieDetail(movie: movieDetailShowing!, movieDetailShowing: $movieDetailShowing)
                    .animation(.easeIn, value: movieDetailShowing)
                    .transition(.opacity)
            }
            
            if showTopRowSelection {
                Group {
                    Color.black.opacity(0.9)
                    
                    VStack(spacing: 30) {
                        Spacer()
                        
                        ForEach(HomeTopRow.allCases, id: \.self) { topRow in
                            Button {
                                topRowSelection = topRow
                                showTopRowSelection = false
                            } label: {
                                if topRow == topRowSelection {
                                    Text("\(topRow.rawValue)")
                                        .bold()
                                } else {
                                    Text("\(topRow.rawValue)")
                                        .foregroundColor(.gray)
                                }
                            }
                            .font(.system(.title2))

                        }
                        
                        Spacer()
                        
                        Button {
                            showTopRowSelection = false
                        } label: {
                            Image(systemName: "xmark.circle.fill")
                                .font(.system(size: 40))
                        }
                        .padding(.bottom, 30)

                    
                    }
                    
                }
                .foregroundColor(.white)
                .edgesIgnoringSafeArea(.all)
            }
            
            if showGenreSelection {
                Group {
                    Color.black.opacity(0.9)
                    
                    VStack(spacing: 30) {
                        Spacer()
                        
                        ScrollView {
                            ForEach(HomeGenre.allCases, id: \.self) { genre in
                                Button {
                                    genreSelection = genre
                                    showGenreSelection = false
                                } label: {
                                    if genre == genreSelection {
                                        Text("\(genre.rawValue)")
                                            .bold()
                                    } else {
                                        Text("\(genre.rawValue)")
                                            .foregroundColor(.gray)
                                    }
                                }
                                .font(.system(.title2))
                                .padding(.bottom, 30)
                            }
                        }
                        
                        Spacer()
                        
                        Button {
                            showGenreSelection = false
                        } label: {
                            Image(systemName: "xmark.circle.fill")
                                .font(.system(size: 40))
                        }
                        .padding(.bottom, 30)

                    
                    }
                    
                }
                .foregroundColor(.white)
                .edgesIgnoringSafeArea(.all)
            }
            
            
        }
        .foregroundColor(.white)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

struct TopRowButtons: View {
    @Binding var topRowSelection: HomeTopRow
    @Binding var genreSelection: HomeGenre
    
    @Binding var showGenreSelection: Bool
    @Binding var showTopRowSelection: Bool
    
    var body: some View {
        switch topRowSelection {
        case .home:
            HStack {
                Button {
                    topRowSelection = .home
                } label: {
                    Image("netflix_logo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 50)
                }
                
                Spacer()
                
                Button {
                    topRowSelection = .tvshows
                } label: {
                    Text("TV Shows")
                }
                
                Spacer()
                
                Button {
                    topRowSelection = .movies
                } label: {
                    Text("Movies")
                }
                
                Spacer()
                
                Button {
                    topRowSelection = .myList
                } label: {
                    Text("My List")
                }
                
                
            }
            .padding(.leading, 10)
            .padding(.trailing, 30)
            
        case .tvshows, .movies, .myList:
            HStack(spacing: 20) {
                Button {
                    topRowSelection = .home
                } label: {
                    Image("netflix_logo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 50)
                }
                
                
                Button {
                    showTopRowSelection = true
                } label: {
                    Text(topRowSelection.rawValue)
                        .font(.system(size: 20))
                    Image(systemName: "triangle.fill")
                        .font(.system(size: 12))
                        .rotationEffect(.degrees(180))
                }
                
                
                Button {
                    showGenreSelection = true
                } label: {
                    Text(genreSelection.rawValue)
                        .font(.system(size: 15))
                    
                    Image(systemName: "triangle.fill")
                        .font(.system(size: 10))
                        .rotationEffect(.degrees(180))
                }
                
                Spacer()
                
            }
            .padding(.leading, 30)
            .padding(.trailing, 30)
        }
    }
}

enum HomeTopRow: String, CaseIterable {
    case home = "Home"
    case tvshows = "TV Shows"
    case movies = "Movies"
    case myList = "My List"
}

enum HomeGenre: String, CaseIterable {
    case AllGenres
    case Action
    case Comedy
    case Horror
    case Romance
    case Thriller
}

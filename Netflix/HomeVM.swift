//
//  HomeVM.swift
//  Netflix
//
//  Created by Júlia Dien on 10/2/22.
//

import Foundation

class HomeVM: ObservableObject {
    @Published var movies: [String: [Movie]] = [:]  //Map -> String (category), [Movies] (all the movies belonging to the category).
    
    public var Categories: [String] {
        return movies.keys.map({$0})    //Returns an array (.map) of the keys of 'movies'.
    }
    
    //Returns the array of movies of the category 'cat'. If 'cat' doesn't exists, returns an empty array.
    public func getMovie(forCat cat: String, forTopRow topRow: HomeTopRow, forGenre genre: HomeGenre) -> [Movie] {
        
        switch topRow {
        case .home:
            return movies[cat] ?? []
        case .tvshows:
            return (movies[cat] ?? []).filter({ ($0.movieType == .tvShow) && ($0.genre == genre) })
        case .movies:
            return (movies[cat] ?? []).filter({ ($0.movieType == .movie) && ($0.genre == genre) })
        case .myList:
            return movies[cat] ?? []
        }
    }
    
    init() {
        setUpMovies()
    }
    
    func setUpMovies(){
        movies["Trending Now"] = exampleMovies
        movies["Romantic movies"] = exampleMovies
        movies["TV series"] = exampleMovies
        movies["Only on Netflix"] = exampleMovies
        movies["Award-winning movies"] = exampleMovies
        
    }
    
    
}

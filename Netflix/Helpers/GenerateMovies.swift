//
//  GenerateMovies.swift
//  iOS
//
//  Created by Nikita Thomas on 8/9/20.
//

import Foundation

func generateMovies(_ count: Int) -> [Movie] {
    guard count > 0 else { return [] }
    
    var allMovies: [Movie] = []
    
    for _ in 0..<count {
        let id = UUID().uuidString
        
        let nameLength = Int.random(in: 9..<20)
        let name = randomString(length: nameLength)
        
        let randThumbnail = Int.random(in: 0...9)
        let thumbnail = URL(string: "https://picsum.photos/300/10\(randThumbnail)")!
        
        let year = Int.random(in: 2000...2020)
        
        let cast = "Lorem ipsum, dolor sit"
        let creators = "felis non, libero consectetur"
        let categories = ["consectetur", "neque", "felis", "libero"]
        
        let headline = "Watch now!"
        
        let numSeasons = Int.random(in: 1...3)
        
        var allEpisodes: [Episode] = []
        
        for i in 1...numSeasons {
            allEpisodes.append(contentsOf: generateEpisodes(5, forSeason: i))
        }
        
        let epinameLength = Int.random(in: 9..<20)
        let epiname = randomString(length: epinameLength)
        
        let epidescLength = Int.random(in: 150..<200)
        let epidesc = randomString(length: epidescLength)
        let defEpiInfo = CurrentEpisodeInfo(episode: 1, season: 1, name: epiname, resume: epidesc)
        
        let allTrailers = generateTrailers(3)
        
        let moreLikeThis = exampleMovies
        
        let movie = Movie(id: id, name: name, thumbnail: thumbnail, categories: categories, genre: .AllGenres, year: year, rating: "PG-13", numberOfSeasons: numSeasons, episodes: allEpisodes, headline: headline, currentEpisode: defEpiInfo, defaultEpisodeInfo: defEpiInfo, creators: creators, cast: cast, moreLikeThis: moreLikeThis, trailers: allTrailers)
        allMovies.append(movie)
    }
    
    return allMovies
}

func generateTrailers(_ count: Int) -> [Trailer] {
    var allTrailers: [Trailer] = []
    
    for _ in 0..<count {
        let id = UUID().uuidString
        
        let nameLength = Int.random(in: 9..<20)
        let name = randomString(length: nameLength)
        
        let randThumbnail = Int.random(in: 0...9)
        let thumbnail = URL(string: "https://picsum.photos/300/10\(randThumbnail)")!
        
        let trailer = Trailer(id: id, name: name, videoURL: exampleVideoURL, thumbnailURL: thumbnail)
        allTrailers.append(trailer)
    }
    
    return allTrailers
}

func generateEpisodes(_ count: Int, forSeason season: Int) -> [Episode] {
    var allEpisodes: [Episode] = []
    
    for num in 0..<count {
        let id = UUID().uuidString
        
        let nameLength = Int.random(in: 9..<20)
        let name = randomString(length: nameLength)
        
        let randThumbnail = Int.random(in: 0...9)
        let thumbnail = "https://picsum.photos/300/10\(randThumbnail)"
        
        let desc = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse at purus diam. Nullam a nulla a augue eleifend convallis ac vitae neque. Curabitur sit amet felis non libero consectetur euismod."
        let randLength = Int.random(in: 20..<59)
        
        let episode = Episode(id: id, name: name, number: num + 1, season: season, thumbnailImageURL: thumbnail, description: desc, length: randLength, videoURL: exampleVideoURL)
        
        allEpisodes.append(episode)
    }
    
    return allEpisodes
}

func randomString(length: Int) -> String {
  let letters = "abcdefghijklmnopqrstuvwxyz"
  return String((0..<length).map{ _ in letters.randomElement()! })
}

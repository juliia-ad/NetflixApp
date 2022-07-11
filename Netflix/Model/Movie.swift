//
//  Movie.swift
//  Netflix
//
//  Created by Júlia Dien on 9/2/22.
//

import Foundation

struct Movie: Identifiable {
    var id: String
    var name: String
    var thumbnail: URL
    
    var categories: [String]
    var genre: HomeGenre = .AllGenres
    
    //Movie Detail View
    var year: Int
    var rating: String
    var numberOfSeasons: Int?
    
    var episodes: [Episode]?    //optional because movies don't have episodes
    
    var movieType: MovieType {
        return episodes == nil ? .movie : .tvShow
    }
    
    var headline: String?
    
    var currentEpisode: CurrentEpisodeInfo?
    var defaultEpisodeInfo: CurrentEpisodeInfo
    var creators: String
    var cast: String
    
    var moreLikeThis: [Movie]
    var trailers: [Trailer]
    
    var numberOfSeasonsDisplay: String {
        if let num = numberOfSeasons {
            switch num {
                case 1:
                    return "1 season"
                default:
                    return "\(num) seasons"
            }
        }
        return ""
    }
    
    var episodeInfoDisplay: String {
        if let info = currentEpisode {
            return "S\(info.season):E\(info.episode) \(info.name)"
        } else {
            return "S\(defaultEpisodeInfo.season):E\(defaultEpisodeInfo.episode) \(defaultEpisodeInfo.name)"
        }
    }
    
    var episodeResumeDisplay: String {
        if let current = currentEpisode {
            return "\(current.resume)"
        } else {
            return "\(defaultEpisodeInfo.resume)"
        }
    }
}

extension Movie: Equatable {
    static func == (lhs: Movie, rhs: Movie) -> Bool {
        return
            lhs.name == rhs.name &&
            lhs.id == rhs.id
    }
}



struct CurrentEpisodeInfo: Hashable, Equatable {
    var episode: Int
    var season: Int
    var name: String
    var resume: String
}

enum MovieType {
    case movie
    case tvShow
}

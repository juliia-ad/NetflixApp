//
//  GlobalPreviews.swift
//  Netflix
//
//  Created by Júlia Dien on 9/2/22.
//

import Foundation
import SwiftUI


let exampleVideoURL = URL(string: "https://www.google.com/url?sa=t&rct=j&q=&esrc=s&source=video&cd=&cad=rja&uact=8&ved=2ahUKEwicmsn0zrj2AhVFg_0HHcQiC3kQtwJ6BAgCEAI&url=https%3A%2F%2Fwww.youtube.com%2Fwatch%3Fv%3Db9EkMc79ZSU&usg=AOvVaw0vGueKvM7xSg23hl1m6-Cy")!
let exampleThumbnailURL = URL(string: "https://occ-0-2794-2219.1.nflxso.net/dnm/api/v6/6AYY37jfdO6hpXcMjf9Yu5cnmO0/AAAABXq_vQJf0hxGmUQqHnb8nXwpz8iEmzC2upISv1MYxfE2kXO-IouDyL-TuAAkSqEn-iPui5s3ax8In2XqquIQkQ7L7csL.jpg?r=a42")!

let exampleTrailer = Trailer(name: "Season 1: Official Trailer", videoURL: exampleVideoURL, thumbnailURL: exampleThumbnailURL)
let exampleTrailer2 = Trailer(name: "Stranger Things Trailer", videoURL: exampleVideoURL, thumbnailURL: exampleThumbnailURL)
let exampleTrailers = [exampleTrailer, exampleTrailer2, exampleTrailer]


let exampleEpisode1 = Episode(name: "Chapter 1: The Vanishing of Will Byers", number: 1, season: 1, thumbnailImageURL: "https://occ-0-2794-2219.1.nflxso.net/dnm/api/v6/6AYY37jfdO6hpXcMjf9Yu5cnmO0/AAAABXq_vQJf0hxGmUQqHnb8nXwpz8iEmzC2upISv1MYxfE2kXO-IouDyL-TuAAkSqEn-iPui5s3ax8In2XqquIQkQ7L7csL.jpg?r=a42", description: "On his way home from a friend's house, young Will sees something terrifying. Nearby, a sinister secret lurks in the depths of a government lab.", length: 49, videoURL: exampleVideoURL)
let exampleEpisode2 = Episode(name: "Chapter Two: The Weirdo on Maple Street", number: 2, season: 1, thumbnailImageURL: "https://occ-0-2794-2219.1.nflxso.net/dnm/api/v6/6AYY37jfdO6hpXcMjf9Yu5cnmO0/AAAABXq_vQJf0hxGmUQqHnb8nXwpz8iEmzC2upISv1MYxfE2kXO-IouDyL-TuAAkSqEn-iPui5s3ax8In2XqquIQkQ7L7csL.jpg?r=a42", description: "Lucas, Mike and Dustin try to talk to the girl they found in the woods. Hopper questions an anxious Joyce about an unsettling phone call.", length: 56, videoURL: exampleVideoURL)
let exampleEpisode3 = Episode(name: "Chapter Three: Holly, Jolly", number: 3, season: 1, thumbnailImageURL: "https://occ-0-2794-2219.1.nflxso.net/dnm/api/v6/6AYY37jfdO6hpXcMjf9Yu5cnmO0/AAAABXq_vQJf0hxGmUQqHnb8nXwpz8iEmzC2upISv1MYxfE2kXO-IouDyL-TuAAkSqEn-iPui5s3ax8In2XqquIQkQ7L7csL.jpg?r=a42", description: "An increasingly concerned Nancy looks for Barb and finds out what Jonathan's been up to. Joyce is convinced Will is trying to talk to her.", length: 52, videoURL: exampleVideoURL)
let exampleEpisode4 = Episode(name: "Chapter Three: Holly, Jolly", number: 3, season: 2, thumbnailImageURL: "https://occ-0-2794-2219.1.nflxso.net/dnm/api/v6/6AYY37jfdO6hpXcMjf9Yu5cnmO0/AAAABXq_vQJf0hxGmUQqHnb8nXwpz8iEmzC2upISv1MYxfE2kXO-IouDyL-TuAAkSqEn-iPui5s3ax8In2XqquIQkQ7L7csL.jpg?r=a42", description: "An increasingly concerned Nancy looks for Barb and finds out what Jonathan's been up to. Joyce is convinced Will is trying to talk to her.", length: 52, videoURL: exampleVideoURL)
let exampleEpisode5 = Episode(name: "Chapter Two: The Weirdo on Maple Street", number: 2, season: 2, thumbnailImageURL: "https://occ-0-2794-2219.1.nflxso.net/dnm/api/v6/6AYY37jfdO6hpXcMjf9Yu5cnmO0/AAAABXq_vQJf0hxGmUQqHnb8nXwpz8iEmzC2upISv1MYxfE2kXO-IouDyL-TuAAkSqEn-iPui5s3ax8In2XqquIQkQ7L7csL.jpg?r=a42", description: "Lucas, Mike and Dustin try to talk to the girl they found in the woods. Hopper questions an anxious Joyce about an unsettling phone call.", length: 56, videoURL: exampleVideoURL)


let allEpisodes = [exampleEpisode1, exampleEpisode2, exampleEpisode3, exampleEpisode4, exampleEpisode5]



let exampleMovie1 = Movie(id: UUID().uuidString, name: "Stranger Things", thumbnail: URL(string: "https://cdn.hobbyconsolas.com/sites/navi.axelspringer.es/public/styles/1200/public/media/image/2016/08/stranger-things-cartel.jpg?itok=zFE5Kr_J")!, categories: ["Dystopian", "Exciting", "Suspensfull"], year: 2016, rating: "TV-MA", numberOfSeasons: 3, episodes: allEpisodes, headline: "Best Rated Show", defaultEpisodeInfo: exampleEpisodeInfo, creators: "The Duffer Brothers", cast: "Millie Bobby Brown, Winona Ryder, David Harbour, Finn Wolfhard", moreLikeThis: [exampleMovie2, exampleMovie3, exampleMovie4, exampleMovie5, exampleMovie6, exampleMovie7], trailers: exampleTrailers)
let exampleMovie2 = Movie(id: UUID().uuidString, name: "La Casa de Papel", thumbnail: URL(string: "https://i.redd.it/1ace5qxjr9m41.jpg")!, categories: ["Dystopian", "Exciting", "Suspensfull"], year: 2020, rating: "TV-MA", numberOfSeasons: 2, defaultEpisodeInfo: exampleEpisodeInfo, creators: "The Duffer Brothers", cast: "Millie Bobby Brown, Winona Ryder, David Harbour, Finn Wolfhard", moreLikeThis: [], trailers: exampleTrailers)
let exampleMovie3 = Movie(id: UUID().uuidString, name: "Emily in Paris", thumbnail: URL(string: "https://es.web.img3.acsta.net/pictures/21/11/19/12/18/1742388.jpg")!, categories: ["Dystopian", "Exciting", "Suspensfull"], year: 2020, rating: "TV-MA", numberOfSeasons: 2, defaultEpisodeInfo: exampleEpisodeInfo, creators: "The Duffer Brothers", cast: "Millie Bobby Brown, Winona Ryder, David Harbour, Finn Wolfhard", moreLikeThis: [], trailers: exampleTrailers)
let exampleMovie4 = Movie(id: UUID().uuidString, name: "Django", thumbnail: URL(string: "https://static.posters.cz/image/1300/posters/django-unchained-i13361.jpg")!, categories: ["Dystopian", "Exciting", "Suspensfull"], year: 2020, rating: "TV-MA", headline: "Award-winning Movie", defaultEpisodeInfo: exampleEpisodeInfo, creators: "The Duffer Brothers", cast: "Millie Bobby Brown, Winona Ryder, David Harbour, Finn Wolfhard", moreLikeThis: [], trailers: exampleTrailers)
let exampleMovie5 = Movie(id: UUID().uuidString, name: "Now you see me 2", thumbnail: URL(string: "https://m.media-amazon.com/images/I/A1EnnhQOmPL._AC_SL1500_.jpg")!, categories: ["Dystopian", "Exciting", "Suspensfull"], year: 2020, rating: "TV-MA", defaultEpisodeInfo: exampleEpisodeInfo, creators: "The Duffer Brothers", cast: "Millie Bobby Brown, Winona Ryder, David Harbour, Finn Wolfhard", moreLikeThis: [], trailers: exampleTrailers)
let exampleMovie6 = Movie(id: UUID().uuidString, name: "Peaky Blinders", thumbnail: URL(string: "https://i.pinimg.com/736x/e2/41/9b/e2419b45c5064a7dca59df26a853e500.jpg")!, categories: ["Dystopian", "Exciting", "Suspensfull"], year: 2020, rating: "TV-MA", numberOfSeasons: 6, headline: "Watch Season 6 Now", defaultEpisodeInfo: exampleEpisodeInfo, creators: "The Duffer Brothers", cast: "Millie Bobby Brown, Winona Ryder, David Harbour, Finn Wolfhard", moreLikeThis: [], trailers: exampleTrailers)
let exampleMovie7 = Movie(id: UUID().uuidString, name: "Emily in Paris", thumbnail: URL(string: "https://es.web.img3.acsta.net/pictures/21/11/19/12/18/1742388.jpg")!, categories: ["Dystopian", "Exciting", "Suspensfull"], year: 2020, rating: "TV-MA", numberOfSeasons: 2, defaultEpisodeInfo: exampleEpisodeInfo, creators: "The Duffer Brothers", cast: "Millie Bobby Brown, Winona Ryder, David Harbour, Finn Wolfhard", moreLikeThis: [], trailers: exampleTrailers)

let exampleEpisodeInfo = CurrentEpisodeInfo(episode: 1, season: 1, name: "Beginnings and Endings", resume: "Set in the fictional town of Hawkins, Indiana in the 1980s, the first season focuses on the investigation into the disappearance of a young boy amid supernatural events occurring around the town.")


let exampleMovies: [Movie] = [exampleMovie1, exampleMovie2, exampleMovie3, exampleMovie4, exampleMovie5, exampleMovie6]



extension LinearGradient {
    static let blackGradient = LinearGradient(colors: [Color.black.opacity(0), Color.black], startPoint: .top, endPoint: .bottom)
    
}

extension String {
   func widthOfString(usingFont font: UIFont) -> CGFloat {
        let fontAttributes = [NSAttributedString.Key.font: font]
        let size = self.size(withAttributes: fontAttributes)

        return size.width
    }
}

extension View {
    func hideKeyboard() {
        let resign = #selector(UIResponder.resignFirstResponder)
        UIApplication.shared.sendAction(resign, to: nil, from: nil, for: nil)
    }
}

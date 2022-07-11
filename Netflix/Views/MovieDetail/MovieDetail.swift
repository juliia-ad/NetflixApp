//
//  MovieDetail.swift
//  Netflix
//
//  Created by Júlia Dien on 16/2/22.
//

import SwiftUI

struct MovieDetail: View {
    
    var movie: Movie
    
    let screen = UIScreen.main.bounds
    
    @State private var showingSeasonPicker: Bool = false
    @State private var selectedSeason: Int = 1
    
    @Binding var movieDetailShowing: Movie?
    
    var body: some View {
        ZStack{
            Color.black
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                HStack {
                    Spacer()
                    Button {
                        movieDetailShowing = nil
                    } label: {
                        Image(systemName: "xmark.circle")
                            .font(.system(size: 26))
                    }
                }
                .padding(.horizontal, 10)
                    
                
                ScrollView {
                    VStack(spacing: 5) {
                        FrontPageMovie(movie: movie)
                            .frame(width: screen.width / 2.5)
                        
                        InfoSubheadline(movie: movie)
                            .padding(.vertical, 5)
                        
                        if movie.headline != nil {
                            Text(movie.headline!)   //we force unwrap
                                .bold()
                                .font(.headline)
                        }
                        
                        PlayButton(title: "Play", image: "play.fill", background: .red) {
                            //
                        }
                        .padding(.bottom, 4)
                        
                        EpisodeInfo(movie: movie)
                        
                        Credits(movie: movie)
                        
                        HStack(spacing: 50) {
                            VerticalButton(title: "My List", imageOn: "checkmark", imageOff: "plus") {
                                //
                            }
                            
                            VerticalButton(title: "Rated", imageOn: "hand.thumbsup.fill", imageOff: "hand.thumbsup") {
                                //
                            }
                            
                            VerticalButton(title: "Share", imageOn: "square.and.arrow.up", imageOff: "square.and.arrow.up") {
                                //
                            }
                            
                            Spacer()
                        }
                        .padding(.leading, 20)
                        .padding(.top, 10)
                        
                        TabSwitcher(showingSeasonPicker: $showingSeasonPicker, selectedSeason: $selectedSeason, movie: movie, tabs: [.episodes, .trailers, .more])
                        
                        
                    }
                    .padding(.horizontal, 10)
                }
                
                Spacer()
                    
                
            }
            .foregroundColor(.white)
            
            if showingSeasonPicker {
                Group {
                    Color.black.opacity(0.9)
                
                    VStack(spacing: 30) {
                        Spacer()
                        
                        ForEach(0..<(movie.numberOfSeasons ?? 0)) { season in
                            Button {
                                selectedSeason = season + 1
                                showingSeasonPicker = false
                            } label: {
                                Text("Season \(season+1)")
                                    .foregroundColor(season + 1 == selectedSeason ? .white : .gray)
                                    .font(season + 1 == selectedSeason ? .title : .title2)
                                    .bold()
                            }

                            
                        }
                        
                        Spacer()
                        
                        Button {
                            showingSeasonPicker = false
                        } label: {
                            Image(systemName: "xmark.circle.fill")
                                .font(.system(size: 40))
                                .foregroundColor(.white)
                        }
                        .padding(.bottom, 30)
                    }
                }
                .edgesIgnoringSafeArea(.all)
                
            }
                
            
        }
    }
}

struct MovieDetail_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetail(movie: exampleMovie1, movieDetailShowing: .constant(nil))
    }
}

struct InfoSubheadline: View {
    var movie: Movie
    var body: some View {
        HStack(spacing: 15) {
            Image(systemName: "hand.thumbsup.fill")
                .foregroundColor(.white)
            Text(String(movie.year))
            RatingView(movie: movie)
            Text(movie.numberOfSeasonsDisplay)
            HDRectangle()
        }
        .foregroundColor(.gray)
    }
}

struct RatingView: View {
    var movie: Movie
    
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(.gray)
                .cornerRadius(2)
            Text(movie.rating)
                .foregroundColor(.white)
                .font(.system(size: 12))
                .bold()
        }
        .frame(width: 50, height: 20)
    }
}

struct HDRectangle: View {
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(.black)
                .border(.gray)
                .cornerRadius(2)
            Text("HD")
                .font(.system(size: 15))
                .bold()
        }
        .frame(width: 27, height: 20)
    }
}

struct Credits: View {
    var movie: Movie
    var body: some View {
        VStack(spacing: 3) {
            HStack {
                Text("Cast: \(movie.cast)")
                Spacer()
                
            }
            
            HStack {
                Text("Creators: \(movie.creators)")
                Spacer()
            }
        }
        .font(.caption)
        .foregroundColor(.gray)
        .padding(.vertical, 1)
    }
}

struct EpisodeInfo: View {
    var movie: Movie
    
    var body: some View {
        Group {
            HStack {
                Text(movie.episodeInfoDisplay)
                    .bold()
                
                Spacer()
            }
            .padding(.vertical, 1)
            
            HStack {
                Text(movie.episodeResumeDisplay)
                    .font(.subheadline)
                
                Spacer()
            }
        }
    }
}

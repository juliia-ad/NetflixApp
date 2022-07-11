//
//  EpisodesView.swift
//  Netflix
//
//  Created by Júlia Dien on 12/3/22.
//

import SwiftUI

struct EpisodesView: View {
    
    var episodes: [Episode]
    
    @Binding var showingSeasonPicker: Bool
    @Binding var selectedSeason: Int
    
    func getEpisodes(forSeason season: Int) -> [Episode] {
        return episodes.filter({ $0.season == season })
    }
    
    var body: some View {
        VStack {
            //Season picker
            HStack{
                Button {
                    showingSeasonPicker = true
                } label: {
                    Group {
                        Text("Season \(selectedSeason)")
                        Image(systemName: "chevron.down")
                    }
                    .font(.system(size: 16))
                }
                
                Spacer()

            }
        
            //Episodes list
            ForEach(getEpisodes(forSeason: selectedSeason)) { episode in
                HStack {
                    VideoPreviewImage(imageURL: episode.thumbnail, videoURL: episode.videoURL)
                        .frame(width: 120, height: 70)
                        .clipped()
                    VStack(alignment: .leading) {
                        Text("\(episode.number). \(episode.name)")
                        Text("\(episode.length)m")
                            .font(.system(size: 13))
                            .foregroundColor(.gray)
                    }
                    
                    Spacer()
                    
                    Image(systemName: "arrow.down.to.line.alt")
                        .font(.system(size: 20))
                        .padding(.leading, 10)
                    
                }
                
                Text("\(episode.description)")
                    .font(.system(size: 13))
                    .lineLimit(3)
            }
            .padding(.bottom, 20)
            
            Spacer()
            
            
        }
        .foregroundColor(.white)
        .padding(.horizontal, 10)
    }
}

struct EpisodesView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.black
                .edgesIgnoringSafeArea(.all)
            EpisodesView(episodes: allEpisodes, showingSeasonPicker: .constant(false), selectedSeason: .constant(1))
        }
    }
}

//
//  TabSwitcher.swift
//  Netflix
//
//  Created by Júlia Dien on 6/3/22.
//

import SwiftUI

struct TabSwitcher: View {
    
    @State private var currentTab: Tabs = .episodes
    
    @Binding var showingSeasonPicker: Bool
    @Binding var selectedSeason: Int
    
    var movie: Movie
    
    var tabs: [Tabs]
    
    func widthForRectangle(_ tab: Tabs) -> CGFloat {    //calculates the width of the rectangle, based on the width of his string.
        let string = tab.rawValue
        return string.widthOfString(usingFont: .systemFont(ofSize: 16, weight: .bold))
        
    }
    
    var body: some View {
        VStack {
            //Selection
            ScrollView(.horizontal, showsIndicators: false, content: {
                
                HStack(spacing: 20) {
                    ForEach(tabs, id: \.self) { tab in
                        VStack {
                            Rectangle()
                                .frame(width: widthForRectangle(tab), height: 6)
                                .foregroundColor(currentTab == tab ? Color.red : Color.clear)
                            
                            Button {
                                currentTab = tab
                            } label: {
                                Text(tab.rawValue)
                                    .font(.system(size: 16, weight: .bold))
                                    .foregroundColor(currentTab == tab ? Color.white : Color.gray)
                            }
                            .buttonStyle(.plain)
                            .frame(width: widthForRectangle(tab), height: 30)   //makes sure all the words are displayed and not overlapping.
                        }
                    }
                }
            })
            

            
            //Custom View
            switch currentTab {
            case .episodes:
                EpisodesView(episodes: movie.episodes ?? [], showingSeasonPicker: $showingSeasonPicker, selectedSeason: $selectedSeason)
            case .trailers:
                TrailerList(trailers: exampleTrailers)
            case .more:
                MoreLikeThis(movies: movie.moreLikeThis)
                    
            }
            
            
        }
        .foregroundColor(.white)
        
        
    }
}


enum Tabs: String {
    case episodes = "EPISODES"
    case trailers = "TRAILERS & MORE"
    case more = "MORE LIKE THIS"
}

struct TabSwitcher_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.black
                .edgesIgnoringSafeArea(.all)
            
            TabSwitcher(showingSeasonPicker: .constant(false), selectedSeason: .constant(1), movie: exampleMovie1, tabs: [.episodes, .trailers, .more])
        }
    }
}

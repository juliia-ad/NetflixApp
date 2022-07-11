//
//  ContentView.swift
//  Netflix
//
//  Created by Júlia Dien on 9/2/22.
//

import SwiftUI

struct ContentView: View {
    
    init(){
        UITabBar.appearance().isTranslucent = false
        UITabBar.appearance().barTintColor = UIColor.black
    }
    
    var body: some View {
        TabView{
            HomeView()
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                } .tag(0)
            
            Text("Search")
                .tabItem {
                    Image(systemName: "magnifyingglass")
                    Text("Search")
                } .tag(1)
           
            Text("Previews")
                .tabItem {
                    Image(systemName: "play.rectangle")
                    Text("Previews")
                } .tag(2)
            
            Text("Downloads")
                .tabItem {
                    Image(systemName: "arrow.down.to.line.alt")
                    Text("Downloads")
                } .tag(3)
            
            Text("More")
                .tabItem {
                    Image(systemName: "equal")
                    Text("More")
                } .tag(4)
        }
        .accentColor(.white)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//
//  SearchVM.swift
//  Netflix
//
//  Created by Júlia Dien on 15/4/22.
//

import Foundation
import SwiftUI

class SearchVM: ObservableObject {
    
    @Published var viewState: ViewState = .ready
    
    @Published var isShowingPopularMovies: Bool = true
    @Published var popularMovies: [Movie] = []
    @Published var searchMovies: [Movie] = []
    
    var isLoading: Bool {
        return viewState == .loading
    }
    
    init(){
        getPopularMovies()
    }
    
    //func to simulate search results
    private func getSearchResults(forText text: String) {
            
            let haveResult = Int.random(in: 0...3)
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {   //we wait a couple of seconds before we show the content in the {}
                if haveResult == 0 {
                    // empty view
                    self.searchMovies = []
                    self.setViewState(to: .empty)
                } else {
                    // ready view
                    let movies = generateMovies(21)
                    self.searchMovies = movies
                    self.setViewState(to: .ready)
                }
            }
            
        }
    
    private func getPopularMovies(){
        self.popularMovies = generateMovies(40)
    }
    
    private func setViewState(to state: ViewState){
        DispatchQueue.main.async {
            self.viewState = state
        }
    }
    
    public func updateSearchText(with text: String){
        setViewState(to: .loading)
        
        if (!text.isEmpty){
            isShowingPopularMovies = false
            getSearchResults(forText: text)
        } else {
            isShowingPopularMovies = true
        }
    }
    
}

enum ViewState {
    case empty
    case loading
    case ready
    case error
}

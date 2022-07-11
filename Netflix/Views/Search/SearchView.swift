//
//  SearchView.swift
//  Netflix
//
//  Created by Júlia Dien on 15/4/22.
//

import SwiftUI

struct SearchView: View {
    
    @ObservedObject var vm = SearchVM()
    
    @State private var searchText = ""

    
    var body: some View {
        let searchTextBinding = Binding {   //we create manually the binding for the searchText variable
            return searchText
        } set: {
            searchText = $0
            vm.updateSearchText(with: $0)
        }
        
        return ZStack {
            Color.black
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                SearchBar(text: searchTextBinding, isLoading: vm.isLoading)
                
                ScrollView {
                    if vm.isShowingPopularMovies {
                        //popularMovies
                    } else if vm.viewState == .empty {
                        //error
                    } else if vm.viewState == .ready {
                        //search movies
                    }
                }
                
                Spacer()
            }
            
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}

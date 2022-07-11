//
//  SearchBar.swift
//  Netflix
//
//  Created by Júlia Dien on 13/4/22.
//

import SwiftUI

struct SearchBar: View {
    
    @Binding var text: String
    var isLoading: Bool
    
    @State private var isEditing: Bool = true
    
    var body: some View {
        ZStack(alignment: .leading) {
            Color.graySearchBackground
                .frame(width: 330, height: 36)
                .cornerRadius(6)
            
            HStack {
                Image(systemName: "magnifyingglass")
                    .foregroundColor(.graySearchText)
                    .padding(.leading, 10)  //Inside the TextField rectangle
                
                TextField("Search", text: $text)
                    .padding(7)
                    .padding(.trailing, 15)
                    .foregroundColor(.white)
                    .background(Color.graySearchBackground)
                    .cornerRadius(6)
                    .onTapGesture {
                        isEditing = true
                    }
                    .animation(.default, value: text)
                
                if !text.isEmpty {
                    if isLoading {
                        Button {
                           text = ""
                        } label: {
                            ActivityIndicator(isAnimating: .constant(true), style: .medium)
                                .configure {
                                    $0.color = .white
                                }
                        }
                        .padding(.trailing, 12)
                    } else {
                        Button {
                            text = ""
                        } label: {
                            Image(systemName: "xmark.circle.fill")
                                .foregroundColor(.graySearchText)
        //                                                .frame(width: 35, height: 35)
                        }
                        .padding(.trailing, 12)
                    }
                }
                
                if isEditing {
                    Button {
                        text = ""
                        isEditing = false
                        hideKeyboard()
                    } label: {
                        Text("Cancel")
                            .foregroundColor(.white)
                        
                    }
                    .transition(.move(edge: .trailing))
                    .animation(.default, value: isEditing)
                }
            }
            
        }
        .padding(10)
    }
    
}

struct SearchBar_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.black
                .edgesIgnoringSafeArea(.all)
            SearchBar(text: .constant("d"), isLoading: false)
        }
    }
}

//
//  WhiteButton.swift
//  Netflix
//
//  Created by Júlia Dien on 12/2/22.
//

import SwiftUI

struct PlayButton: View {
    var title: String
    var image: String
    var background: Color = .white
    
    var action: () -> Void
    
    var letterColor: Color {
        return background == .white ? .black : .white
    }
    
    
    var body: some View {
        Button {
            action()
        } label: {
            HStack {
                Spacer()
                Image(systemName: image)
                Text(title)
                    .bold()
                Spacer()
            }
            .padding(.vertical, 5)
            .background(background)
            .cornerRadius(3)
            .foregroundColor(letterColor)
        }
        
        

    }
}

struct WhiteButton_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color(.black)
                .edgesIgnoringSafeArea(.all)
            PlayButton(title: "Play", image: "play.fill", background: .red){
                print("Tapped")
            }
        }
    }
}

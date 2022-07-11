//
//  VerticalButton.swift
//  Netflix
//
//  Created by Júlia Dien on 12/2/22.
//

import SwiftUI

struct VerticalButton: View {
    var title: String
    
    var imageOn: String
    var imageOff: String
    var isOn: Bool = false
    
    var image: String {
        return isOn ? imageOn : imageOff
    }
    
    var action: () -> Void
    
    var body: some View {
        Button {
            action()
        } label: {
            VStack {
                Image(systemName: image)
                Text(title)
                    .font(.system(size: 15))
                    .bold()
                
            }
            .foregroundColor(.white)
        }
    }
}

struct VerticalButton_Previews: PreviewProvider {
    static var previews: some View {
        
        ZStack {
            Color.black
                .edgesIgnoringSafeArea(.all)
            VerticalButton(title: "My List", imageOn: "checkmark", imageOff: "plus") {
                print("Tapped")
            }
        }
    }
}

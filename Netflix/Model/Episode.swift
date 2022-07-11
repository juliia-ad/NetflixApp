//
//  Episode.swift
//  Netflix
//
//  Created by Júlia Dien on 16/2/22.
//

import Foundation
import UIKit

struct Episode: Identifiable {
    var id = UUID().uuidString
    
    var name: String
    var number: Int
    var season: Int
    var thumbnailImageURL: String
    var description: String
    var length: Int
    
    var videoURL: URL
    
    var thumbnail: URL {
        return URL(string: thumbnailImageURL)!
    }
    
    
    
}

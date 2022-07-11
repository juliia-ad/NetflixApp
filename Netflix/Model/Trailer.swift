//
//  Trailer.swift
//  Netflix
//
//  Created by Júlia Dien on 9/3/22.
//

import Foundation

struct Trailer: Identifiable, Hashable {
    var id: String = UUID().uuidString
    var name: String
    var videoURL: URL
    var thumbnailURL: URL

}

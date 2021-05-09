//
//  PostData.swift
//  HackNewsSwiftUI
//
//  Created by Shubham Mishra on 09/05/21.
//

import Foundation

struct Results: Decodable {
    let hits: [Post]
}

struct Post: Decodable, Identifiable {
    var id: String {
        objectID
    }
    let objectID: String
    let title: String
    let url: String?
    let points: Int
}

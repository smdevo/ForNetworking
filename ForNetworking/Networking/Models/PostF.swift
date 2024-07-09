//
//  PostF.swift
//  ForNetworking
//
//  Created by Samandar on 09/07/24.
//

import Foundation

struct PostF: Decodable {
    var userId: Int?
    var id: Int?
    var title: String?
    var body: String?
    
    init(title: String, body: String) {
        self.userId = 1
        self.id = 1
        self.title = title
        self.body = body
    }
}

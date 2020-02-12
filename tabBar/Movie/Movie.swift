//
//  MovieModel.swift
//  tabBar
//
//  Created by Farhana Mustafa on 2/11/20.
//  Copyright © 2020 Farhana Mustafa. All rights reserved.
//

import Foundation

struct Movie: Codable {
    var id: String
    var title: String
    var description: String
    var director: String
    var producer: String
}

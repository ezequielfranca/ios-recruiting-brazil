//
//  Movie.swift
//  Movies
//
//  Created by Ezequiel França on 15/08/19.
//  Copyright © 2019 Ezequiel França. All rights reserved.
//

import Foundation

struct Movie: Codable {
    
    let id : Int
    let title : String
    let poster_path : String?
    let overview : String
    let vote_average : Float
    let release_date : String
    let genre_ids : [Int]
    
}

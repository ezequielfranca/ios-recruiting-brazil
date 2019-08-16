//
//  MovieResponse.swift
//  Movies
//
//  Created by Ezequiel França on 15/08/19.
//  Copyright © 2019 Ezequiel França. All rights reserved.
//

import Foundation

struct MovieResponse: Codable {
    
    var results : [Movie]
    var total_results : Int

}

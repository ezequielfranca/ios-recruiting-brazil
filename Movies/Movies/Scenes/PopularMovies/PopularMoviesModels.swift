//
//  PopularMoviesModels.swift
//  Movies
//
//  Created by Ezequiel França on 15/08/19.
//  Copyright (c) 2019 Ezequiel França. All rights reserved.

import UIKit

typealias Movies = [Movie]
enum PopularMovies
{
    // MARK: Use cases
    
    enum Something
    {
        struct Request
        {
        }
        struct Response
        {
            private let response : MovieResponse
            
            func movies() -> Movies {
                return self.response.results
            }
            
            init(response: MovieResponse) {
                self.response = response
            }
        }
        struct ViewModel
        {
            private let movies : Movies
            
            init(movies: Movies) {
                self.movies = movies
            }
        }
    }
}

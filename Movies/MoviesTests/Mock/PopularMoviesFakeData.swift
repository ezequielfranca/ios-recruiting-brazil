//
//  PopularMoviesFakeData.swift
//  MoviesTests
//
//  Created by Ezequiel França on 16/08/19.
//  Copyright © 2019 Ezequiel França. All rights reserved.
//

@testable import Movies
import Foundation

struct PopularMoviesFakeData {
    
    static func generateData() -> MovieResponse? {
        let filename = "movies"
        guard
            let filePath = Bundle.main.path(forResource: filename, ofType: "json")
            else { fatalError("Could not mock data!") }
        do {
            let jsonData = try Data(contentsOf: URL(fileURLWithPath: filePath),
                                    options: .mappedIfSafe)
            
            if let responseObject = try? JSONDecoder().decode(MovieResponse.self, from: jsonData) {
                return responseObject
            }
            
        } catch {
            fatalError(error.localizedDescription)
        }
        return nil
    }
    
    static func generateDataMusic() -> Data? {
        let filename = "music"
        guard
            let filePath = Bundle.main.path(forResource: filename, ofType: "json")
            else { fatalError("Could not mock data!") }
        do {
            let jsonData = try Data(contentsOf: URL(fileURLWithPath: filePath),
                                    options: .mappedIfSafe)
            
            return jsonData
            
        } catch {
            fatalError(error.localizedDescription)
        }
    }
}

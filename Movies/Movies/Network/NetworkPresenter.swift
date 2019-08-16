//
//  Presenter.swift
//  Shuffle
//
//  Created by Ezequiel França on 13/08/19.
//  Copyright © 2019 Ezequiel França. All rights reserved.
//

import Foundation

enum ServiceURL : String {
    case base = "https://api.themoviedb.org/3/"
    case popularMovies = "movie/popular"
    case searchMovie = "search/movie"
    case genres = "genre/movie/list"
    case movieImage = "https://image.tmdb.org/t/p/w500"
}

//protocol NetworkPresenterServices {
//    func popularMovies(request:APIRequest, query:String?, page:Int?, callback: @escaping  (Result<MovieResponse>) -> Void)
//    func genre(callback: @escaping (Result<[Genre]>) -> Void)
//}

class NetworkPresenter {
    
    static let apiKey = "86bbd30010bba2437158ac43bb23683b"
    
    let networkLayer: NetworkLayer
    
    init(networkLayer: NetworkLayer = NetworkLayer()) {
        self.networkLayer = networkLayer
    }
    
    func fetchPopularMovies(service : ServiceURL,
                            parameters : String? = nil,
                            page : Int? = nil,
                            success: @escaping (Result<MovieResponse>) -> Void,
                            error: @escaping (Result<NetworkError>) -> Void) {
        
        let _successHandler: (Result<MovieResponse>) -> Void = { (movieResponse) in
            success(movieResponse)
        }
        
        let _errorHandler: (Result<NetworkError>) -> Void = { (_error) in
            error(_error)
        }
        
        var components = URLComponents(string: ServiceURL.base.rawValue + service.rawValue)
        
        var queryItems: [URLQueryItem] = [URLQueryItem(name: "api_key", value: NetworkPresenter.apiKey)]
        
        if let query = parameters?.replacingOccurrences(of: " ", with: "%20"){
            queryItems.append(URLQueryItem(name: "query", value: query))
        }
        
        if let page = page{
            queryItems.append(URLQueryItem(name: "page", value: "\(page)"))
        }
        
        components?.queryItems = queryItems
        
        guard let url = components?.url else { error(.error(NetworkError.urlError)); return }
    
        networkLayer.get(urlString: url.absoluteString,
                         successHandler: _successHandler,
                         errorHandler: _errorHandler)
                    
    }
}







//class MoviesServiceImplementation: MoviesService{
//
//    var isFetchInProgress = false
//
//    func fetchPopularMovies(request: APIRequest, query:String? = nil, page:Int? = nil, callback: @escaping (Result<MovieResponse>) -> Void) {
//
//        guard !isFetchInProgress else {
//            return
//        }
//        isFetchInProgress = true
//
//        var components = URLComponents(string: APIRequest.base.rawValue + request.rawValue)
//
//        var queryItems: [URLQueryItem] = [
//            URLQueryItem(name: "api_key", value: MoviesAPIConfig.apikey),
//        ]
//
//        if let query = query?.replacingOccurrences(of: " ", with: "%20"){
//            queryItems.append(URLQueryItem(name: "query", value: query))
//        }
//
//        if let page = page{
//            queryItems.append(URLQueryItem(name: "page", value: "\(page)"))
//        }
//
//        components?.queryItems = queryItems
//        guard let url = components?.url else{
//            callback(.error(NSError()))
//            return
//        }
//
//        let task = URLSession.shared.dataTask(with: url){ data, response, error in
//            guard let data = data else{
//                return
//            }
//
//            let jsonDecoder = JSONDecoder()
//
//            do{
//                let responseObj = try jsonDecoder.decode(MovieResponse.self, from: data)
//                DispatchQueue.main.async { [weak self] in
//                    self?.isFetchInProgress = false
//                    callback(.success(responseObj))
//                }
//            }catch{
//                DispatchQueue.main.async { [weak self] in
//                    self?.isFetchInProgress = false
//                    callback(.error(error))
//                }
//
//            }
//        }
//        task.resume()
//    }
//
//    func fetchGenre(callback: @escaping (Result<[Genre]>) -> Void){
//        var components = URLComponents(string: APIRequest.base.rawValue + APIRequest.fetchGenres.rawValue)
//
//        let queryItems: [URLQueryItem] = [
//            URLQueryItem(name: "api_key", value: MoviesAPIConfig.apikey),
//        ]
//
//        components?.queryItems = queryItems
//        guard let url = components?.url else{
//            callback(.error(NSError()))
//            return
//        }
//
//        let task = URLSession.shared.dataTask(with: url){ data, response, error in
//            guard let data = data else {return}
//
//            let jsonDecoder = JSONDecoder()
//
//            do{
//                let responseObj = try jsonDecoder.decode(GenreResponse.self, from: data)
//                DispatchQueue.main.async {
//                    callback(.success(responseObj.genres))
//                }
//            }catch{
//                callback(.error(error))
//            }
//        }
//        task.resume()
//    }
//}


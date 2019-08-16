//
//  PopularMoviesInteractor.swift
//  Movies
//
//  Created by Ezequiel França on 15/08/19.
//  Copyright (c) 2019 Ezequiel França. All rights reserved.

import UIKit

protocol PopularMoviesBusinessLogic
{
    func getPopularMovies(request: PopularMovies.Something.Request)
}

protocol PopularMoviesDataStore {}

class PopularMoviesInteractor: PopularMoviesBusinessLogic, PopularMoviesDataStore
{    
    var presenter: PopularMoviesPresentationLogic?
    var worker: PopularMoviesWorkerProtocol = PopularMoviesWorker()
    
    // MARK: getPopularMovies
    func getPopularMovies(request: PopularMovies.Something.Request) {
        var requester : NetworkPresenter
        requester = NetworkPresenter()
        worker.getPopularMovies(presenter: requester, service: .popularMovies, parameters: nil, page: nil, success: { (success) in
            switch success {
                
            case .success(let popularMovies):
                print(popularMovies)
                self.presenter?.presentPopularMovies(response: PopularMovies.Something.Response(response: popularMovies))
            case .error(_):
                break
            @unknown default:
                break
            }
        }) { (failure) in
            print(failure)
        }
    }
}

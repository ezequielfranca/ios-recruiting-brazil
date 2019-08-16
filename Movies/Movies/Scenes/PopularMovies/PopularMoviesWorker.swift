//
//  PopularMoviesWorker.swift
//  Movies
//
//  Created by Ezequiel França on 15/08/19.
//  Copyright (c) 2019 Ezequiel França. All rights reserved.

import UIKit

protocol PopularMoviesWorkerProtocol {
    func getPopularMovies( presenter: NetworkPresenter,
                           service : ServiceURL,
                           parameters : String?,
                           page : Int?,
                           success: @escaping (Result<MovieResponse>) -> Void,
                           error: @escaping (Result<NetworkError>) -> Void)
}

class PopularMoviesWorker : PopularMoviesWorkerProtocol
{
    func getPopularMovies(presenter: NetworkPresenter, service: ServiceURL, parameters: String?, page: Int?, success: @escaping (Result<MovieResponse>) -> Void, error: @escaping (Result<NetworkError>) -> Void) {
        presenter.fetchPopularMovies(service: service, parameters: parameters, page: page, success: success, error: error)
    }
}

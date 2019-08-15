//
//  PopularMoviesInteractor.swift
//  Movies
//
//  Created by Ezequiel França on 15/08/19.
//  Copyright (c) 2019 Ezequiel França. All rights reserved.

import UIKit

protocol PopularMoviesBusinessLogic
{
  func doSomething(request: PopularMovies.Something.Request)
}

protocol PopularMoviesDataStore
{
  //var name: String { get set }
}

class PopularMoviesInteractor: PopularMoviesBusinessLogic, PopularMoviesDataStore
{
  var presenter: PopularMoviesPresentationLogic?
  var worker: PopularMoviesWorker?
  //var name: String = ""
  
  // MARK: Do something
  
  func doSomething(request: PopularMovies.Something.Request)
  {
    worker = PopularMoviesWorker()
    worker?.doSomeWork()
    
    let response = PopularMovies.Something.Response()
    presenter?.presentSomething(response: response)
  }
}

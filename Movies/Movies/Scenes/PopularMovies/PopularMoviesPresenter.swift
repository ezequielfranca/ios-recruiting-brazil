//
//  PopularMoviesPresenter.swift
//  Movies
//
//  Created by Ezequiel França on 15/08/19.
//  Copyright (c) 2019 Ezequiel França. All rights reserved.

import UIKit

protocol PopularMoviesPresentationLogic
{
  func presentPopularMovies(response: PopularMovies.Something.Response)
}

class PopularMoviesPresenter: PopularMoviesPresentationLogic
{
  weak var viewController: PopularMoviesDisplayLogic?
  
  // MARK: Do something
  
  func presentPopularMovies(response: PopularMovies.Something.Response)
  {
    let viewModel = PopularMovies.Something.ViewModel(movies: response.movies())
    viewController?.displaySomething(viewModel: viewModel)
  }
}

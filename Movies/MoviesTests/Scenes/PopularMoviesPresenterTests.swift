//
//  PopularMoviesPresenterTests.swift
//  Movies
//
//  Created by Ezequiel França on 16/08/19.
//  Copyright (c) 2019 Ezequiel França. All rights reserved.


@testable import Movies
import XCTest

class PopularMoviesPresenterTests: XCTestCase
{
  // MARK: Subject under test
  
  var sut: PopularMoviesPresenter!
  
  // MARK: Test lifecycle
  
  override func setUp()
  {
    super.setUp()
    setupPopularMoviesPresenter()
  }
  
  override func tearDown()
  {
    super.tearDown()
  }
  
  // MARK: Test setup
  
  func setupPopularMoviesPresenter()
  {
    sut = PopularMoviesPresenter()
  }
  
  // MARK: Test doubles
  
  class PopularMoviesDisplayLogicSpy: PopularMoviesDisplayLogic
  {
    var displaySomethingCalled = false
    
    func displaySomething(viewModel: PopularMovies.Something.ViewModel)
    {
      displaySomethingCalled = true
    }
  }
  
  // MARK: Tests
  
  func testPresentSomething()
  {
    // Given
    let spy = PopularMoviesDisplayLogicSpy()
    sut.viewController = spy
    let response = PopularMovies.Something.Response(response: MovieResponse(results: [], total_results: 0))
    
    // When
    sut.presentPopularMovies(response: response)
    
    // Then
    XCTAssertTrue(spy.displaySomethingCalled, "presentSomething(response:) should ask the view controller to display the result")
  }
}

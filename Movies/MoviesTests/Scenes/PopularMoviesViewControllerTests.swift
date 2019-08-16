//
//  PopularMoviesViewControllerTests.swift
//  Movies
//
//  Created by Ezequiel França on 16/08/19.
//  Copyright (c) 2019 Ezequiel França. All rights reserved.


@testable import Movies
import XCTest

class PopularMoviesViewControllerTests: XCTestCase
{
  // MARK: Subject under test
  
  var sut: PopularMoviesViewController!
  var window: UIWindow!
  
  // MARK: Test lifecycle
  
  override func setUp()
  {
    super.setUp()
    window = UIWindow()
    setupPopularMoviesViewController()
  }
  
  override func tearDown()
  {
    window = nil
    super.tearDown()
  }
  
  // MARK: Test setup
  
  func setupPopularMoviesViewController()
  {
    let bundle = Bundle.main
    sut = PopularMoviesViewController(nibName: "PopularMoviesViewController", bundle: bundle)
  }
  
  func loadView()
  {
    window.addSubview(sut.view)
    RunLoop.current.run(until: Date())
  }
  
  // MARK: Test doubles
  
  class PopularMoviesBusinessLogicSpy: PopularMoviesBusinessLogic
  {
    
    var getPopularMoviesCalled = false
    
    func getPopularMovies(request: PopularMovies.Something.Request) {
        getPopularMoviesCalled = true
    }
    
  }
  
  // MARK: Tests
  
  func testShouldDoSomethingWhenViewIsLoaded()
  {
    // Given
    let spy = PopularMoviesBusinessLogicSpy()
    sut.interactor = spy
    
    // When
    loadView()
    
    // Then
    XCTAssertTrue(spy.getPopularMoviesCalled, "viewDidLoad() should ask the interactor to do something")
  }
  
  func testDisplaySomething()
  {
    // Given
    let viewModel = PopularMovies.Something.ViewModel(movies: [])
    
    // When
    loadView()
    sut.displaySomething(viewModel: viewModel)
    
    // Then
    //XCTAssertEqual(sut.nameTextField.text, "", "displaySomething(viewModel:) should update the name text field")
  }
}

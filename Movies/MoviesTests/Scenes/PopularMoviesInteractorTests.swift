//
//  PopularMoviesInteractorTests.swift
//  Movies
//
//  Created by Ezequiel França on 16/08/19.
//  Copyright (c) 2019 Ezequiel França. All rights reserved.


@testable import Movies
import XCTest

class PopularMoviesInteractorTests: XCTestCase {
    // MARK: Subject under test
    
    var sut: PopularMoviesInteractor!
    
    // MARK: Test lifecycle
    
    override func setUp() {
        super.setUp()
        setupPopularMoviesInteractor()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    // MARK: Test setup
    
    func setupPopularMoviesInteractor() {
        sut = PopularMoviesInteractor()
    }
    
    // MARK: Test doubles
    
    class PopularMoviesPresentationLogicSpy: PopularMoviesPresentationLogic {
        
        var presentPopularMoviesCalled = false
        
        func presentPopularMovies(response: PopularMovies.Something.Response)
        {
            presentPopularMoviesCalled = true
        }
        
    }
    
    class WorkerSpy: PopularMoviesWorkerProtocol {
        func getPopularMovies(presenter: NetworkPresenter, service: ServiceURL, parameters: String?, page: Int?, success: @escaping (Result<MovieResponse>) -> Void, error: @escaping (Result<NetworkError>) -> Void) {
            success(.success(PopularMoviesFakeData.generateData()!))
        }
        
        //success(ShuffleFakeData.generateData()!)
    }
    
    // MARK: Tests
    
    func test_InitialLoad() {
        // Given
        let spy = PopularMoviesPresentationLogicSpy()
        sut.presenter = spy
        sut.worker = WorkerSpy()
        let request = PopularMovies.Something.Request()
        
        // When
        sut.getPopularMovies(request: request)
        
        // Then
        XCTAssertTrue(spy.presentPopularMoviesCalled, "getPopularMovies(request:) should ask the presenter to format the result")
        
    }
}

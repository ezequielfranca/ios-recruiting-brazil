//
//  PopularMoviesWorkerTests.swift
//  Movies
//
//  Created by Ezequiel França on 16/08/19.
//  Copyright (c) 2019 Ezequiel França. All rights reserved.


@testable import Movies
import XCTest

class PopularMoviesWorkerTests: XCTestCase
{
  // MARK: Subject under test
  
  var sut: PopularMoviesWorker!
  
  // MARK: Test lifecycle
  
  override func setUp()
  {
    super.setUp()
    setupPopularMoviesWorker()
  }
  
  override func tearDown()
  {
    super.tearDown()
  }
  
  // MARK: Test setup
  
  func setupPopularMoviesWorker()
  {
    sut = PopularMoviesWorker()
  }
  
  // MARK: Test doubles
  
  // MARK: Tests
  
  func testSomething()
  {
    // Given
    
    // When
    
    // Then
  }
}

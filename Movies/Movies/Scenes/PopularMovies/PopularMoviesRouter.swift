//
//  PopularMoviesRouter.swift
//  Movies
//
//  Created by Ezequiel França on 15/08/19.
//  Copyright (c) 2019 Ezequiel França. All rights reserved.

import UIKit

@objc protocol PopularMoviesRoutingLogic
{
  //func routeToSomewhere(segue: UIStoryboardSegue?)
}

protocol PopularMoviesDataPassing
{
  var dataStore: PopularMoviesDataStore? { get }
}

class PopularMoviesRouter: NSObject, PopularMoviesRoutingLogic, PopularMoviesDataPassing
{
  weak var viewController: PopularMoviesViewController?
  var dataStore: PopularMoviesDataStore?
  
  // MARK: Routing
  
  //func routeToSomewhere(segue: UIStoryboardSegue?)
  //{
  //  if let segue = segue {
  //    let destinationVC = segue.destination as! SomewhereViewController
  //    var destinationDS = destinationVC.router!.dataStore!
  //    passDataToSomewhere(source: dataStore!, destination: &destinationDS)
  //  } else {
  //    let storyboard = UIStoryboard(name: "Main", bundle: nil)
  //    let destinationVC = storyboard.instantiateViewController(withIdentifier: "SomewhereViewController") as! SomewhereViewController
  //    var destinationDS = destinationVC.router!.dataStore!
  //    passDataToSomewhere(source: dataStore!, destination: &destinationDS)
  //    navigateToSomewhere(source: viewController!, destination: destinationVC)
  //  }
  //}
  // MARK: Navigation
  
  //func navigateToSomewhere(source: PopularMoviesViewController, destination: SomewhereViewController)
  //{
  //  source.show(destination, sender: nil)
  //}
  
  // MARK: Passing data
  
  //func passDataToSomewhere(source: PopularMoviesDataStore, destination: inout SomewhereDataStore)
  //{
  //  destination.name = source.name
  //}
}

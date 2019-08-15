//
//  PopularMoviesViewController.swift
//  Movies
//
//  Created by Ezequiel França on 15/08/19.
//  Copyright (c) 2019 Ezequiel França. All rights reserved.


import UIKit

protocol PopularMoviesDisplayLogic: class
{
  func displaySomething(viewModel: PopularMovies.Something.ViewModel)
}

class PopularMoviesViewController: UIViewController, PopularMoviesDisplayLogic
{
  var interactor: PopularMoviesBusinessLogic?
  var router: (NSObjectProtocol & PopularMoviesRoutingLogic & PopularMoviesDataPassing)?

  // MARK: Object lifecycle
  
  override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?)
  {
    super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    setup()
  }
  
  required init?(coder aDecoder: NSCoder)
  {
    super.init(coder: aDecoder)
    setup()
  }
  
  // MARK: Setup
  
  private func setup()
  {
    let viewController = self
    let interactor = PopularMoviesInteractor()
    let presenter = PopularMoviesPresenter()
    let router = PopularMoviesRouter()
    viewController.interactor = interactor
    viewController.router = router
    interactor.presenter = presenter
    presenter.viewController = viewController
    router.viewController = viewController
    router.dataStore = interactor
  }
  
  // MARK: Routing
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?)
  {
    if let scene = segue.identifier {
      let selector = NSSelectorFromString("routeTo\(scene)WithSegue:")
      if let router = router, router.responds(to: selector) {
        router.perform(selector, with: segue)
      }
    }
  }
  
  // MARK: View lifecycle
  
  override func viewDidLoad()
  {
    super.viewDidLoad()
    doSomething()
  }
  
  // MARK: Do something
  
  //@IBOutlet weak var nameTextField: UITextField!
  
  func doSomething()
  {
    let request = PopularMovies.Something.Request()
    interactor?.doSomething(request: request)
  }
  
  func displaySomething(viewModel: PopularMovies.Something.ViewModel)
  {
    //nameTextField.text = viewModel.name
  }
}

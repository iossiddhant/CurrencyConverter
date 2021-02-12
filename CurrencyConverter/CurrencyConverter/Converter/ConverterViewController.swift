//
//  ConverterViewController.swift
//  CurrencyConverter
//
//  Created by siddhant mahapatra on 12/02/21.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol ConverterView: class {
  func displaySomething(viewModel: ConverterModel.ViewModel)
}

class ConverterViewController: UIViewController {
    
    var interactor: ConverterInteractorDelegate?
    var router:  ConverterRouterDelegate?
    
    required init?(coder aDecoder: NSCoder) {
      super.init(coder: aDecoder)
      setUp()
    }
    
    private func setUp() {
        let viewController = self
        let interactor = ConverterInteractor()
        let presenter = ConverterPresenter()
        let router = ConverterRouter()
        interactor.presenter = presenter
        presenter.viewController = viewController
        viewController.interactor = interactor
        viewController.router = router
    }
    
    override func viewDidLoad() {
        self.doSomeThing()
    }
    
    private func doSomeThing() {
        let request = ConverterModel.Request()
        self.interactor?.doSomething(request: request)
    }
    
    func naviagteToNextViewController() {
        router?.navigateToNextViewController()
    }
}

extension ConverterViewController: ConverterView {
    
    func displaySomething(viewModel: ConverterModel.ViewModel) {
        // display here
    }
}

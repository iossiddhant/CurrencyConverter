//
//  ConverterPresenter.swift
//  CurrencyConverter
//
//  Created by siddhant mahapatra on 12/02/21.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol ConverterPresenterDelegate {
  func presentSomething(response: ConverterModel.Response)
}

class ConverterPresenter: ConverterPresenterDelegate {
    weak var viewController: ConverterView?
    
    func presentSomething(response: ConverterModel.Response) {
        let viewData = ConverterModel.ViewModel()
        viewController?.displaySomething(viewModel: viewData)
    }
}

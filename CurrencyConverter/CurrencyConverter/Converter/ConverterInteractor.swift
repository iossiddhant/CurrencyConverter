//
//  ConverterInteractor.swift
//  CurrencyConverter
//
//  Created by siddhant mahapatra on 12/02/21.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol ConverterInteractorDelegate {
  func doSomething(request: ConverterModel.Request)
}


class ConverterInteractor: ConverterInteractorDelegate {
    var presenter: ConverterPresenterDelegate!
    var worker = ConverterWorker()
    
    func doSomething(request: ConverterModel.Request) {
        worker.doSomething(request: request) { (any) in
            self.presenter.presentSomething(response: ConverterModel.Response())
        }
    }
    
}

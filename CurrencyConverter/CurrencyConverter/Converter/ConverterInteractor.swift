//
//  ConverterInteractor.swift
//  CurrencyConverter
//
//  Created by siddhant mahapatra on 12/02/21.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol ConverterInteractorDelegate {
  func fetchCurrency(request: ConverterModel.Request)
}


class ConverterInteractor: ConverterInteractorDelegate {
    var presenter: ConverterPresenterDelegate!
    var worker = ConverterWorker()
    
    func fetchCurrency(request: ConverterModel.Request) {
        worker.fetchCurrency(request: request) { (_response) in
            self.presenter.presentfetchedCurrency(response:_response )
        }
    }
    
}

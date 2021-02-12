//
//  ConverterPresenter.swift
//  CurrencyConverter
//
//  Created by siddhant mahapatra on 12/02/21.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol ConverterPresenterDelegate {
    func presentfetchedCurrency(response: ConverterModel.Response.CurrencyConverter)
}

class ConverterPresenter: ConverterPresenterDelegate {
    weak var viewController: ConverterView?
    
    func presentfetchedCurrency(response: ConverterModel.Response.CurrencyConverter) {
        let viewData = ConverterModel.ViewModel(quotes: response.quotes, source: response.source)
        viewController?.displayfetchedCurrency(viewModel: viewData)
    }
}

//
//  ConverterWorker.swift
//  CurrencyConverter
//
//  Created by siddhant mahapatra on 12/02/21.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit
import Alamofire

class ConverterWorker {
    func fetchCurrency(request: ConverterModel.Request, aCompletion: @escaping (ConverterModel.Response.CurrencyConverter) -> Void) {
        let url = "http://api.currencylayer.com/historical?access_key=7a24e82244f5a2d2cd08be4d551f35ab&date=2010-02-12&currencies=USD,AUD,CAD,PLN,MXN&format=1"
        
        AF.request(url).responseData { (data) in
            let decoder = JSONDecoder()
            if let _data = data.value {
                if let currencyJson = try? decoder.decode(ConverterModel.Response.CurrencyConverter.self, from: _data ) {
                  aCompletion(currencyJson)
                }
            }
        }
    }
}


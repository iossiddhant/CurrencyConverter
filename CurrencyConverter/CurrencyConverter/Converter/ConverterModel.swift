//
//  ConverterModel.swift
//  CurrencyConverter
//
//  Created by siddhant mahapatra on 12/02/21.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

struct ConverterModel {
    struct Request {
    }
    struct Response {
        // MARK: - CurrencyConverter
        struct CurrencyConverter: Codable {
            let success: Bool
            let terms, privacy: String
            let historical: Bool
            let date: String
            let timestamp: Int
            let source: String
            let quotes: [String: Double]
        }
    }
    struct ViewModel {
        var quotes: [String: Double]
        var source: String
    }
}

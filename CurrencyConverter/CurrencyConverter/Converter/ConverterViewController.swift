//
//  ConverterViewController.swift
//  CurrencyConverter
//
//  Created by siddhant mahapatra on 12/02/21.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol ConverterView: class {
    func displayfetchedCurrency(viewModel: ConverterModel.ViewModel)
}

class ConverterViewController: UIViewController {
    
    var interactor: ConverterInteractorDelegate?
    var router:  ConverterRouterDelegate?
    private var quotes =  [String: Double]()
    private var sourceCurrency = ""
    private var amount :Double = 0.0
  
    
    
    @IBOutlet weak var amountTF: UITextField!
    @IBOutlet weak var currencyTV: UITableView!
    @IBOutlet weak var currencyPV: UIPickerView!
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
        currencyTV.delegate = self
        currencyTV.dataSource = self
        currencyPV.delegate = self
        currencyPV.dataSource = self
        amountTF.delegate = self
        amountTF.addDoneCancelToolbar()
        currencyTV.register(UINib(nibName: "CurrencyCell", bundle: nil), forCellReuseIdentifier: "CurrencyCell")
        self.fetchCurencies()
    }
    
    private func fetchCurencies() {
        let request = ConverterModel.Request()
        self.interactor?.fetchCurrency(request: request)
    }
    
    func naviagteToNextViewController() {
        router?.navigateToNextViewController()
    }
}

extension ConverterViewController: ConverterView,UITableViewDelegate,UITableViewDataSource,  UIPickerViewDelegate,UIPickerViewDataSource, UITextFieldDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        self.quotes.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.quotes.count
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CurrencyCell",
                                                 for: indexPath) as! CurrencyCell
        let value = Array(self.quotes.values)[indexPath.row]
        let key = Array(self.quotes.keys)[indexPath.row]
        cell.currencyLbl.text = " \(key)  \(amount * value)"
        return cell
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 50
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return Array(self.quotes.keys)[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
    }
    
    func displayfetchedCurrency(viewModel: ConverterModel.ViewModel) {
        // display here
        self.quotes = viewModel.quotes
        self.sourceCurrency = viewModel.source
        self.currencyTV.reloadData()
        self.currencyPV.reloadAllComponents()
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        if string == "\n" {
            textField.resignFirstResponder()
        } else {
            if let text = textField.text {
                amount = Double(text + string) ?? 0.0
            }
            
            currencyTV.reloadData()
        }
        
        return true
    }
}

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
        currencyTV.register(UINib(nibName: "CurrencyCell", bundle: nil), forCellReuseIdentifier: "CurrencyCell")
        self.fetchCurencies()
    }
    
    private func fetchCurencies() {
        let request = ConverterModel.Request()
        self.interactor?.doSomething(request: request)
    }
    
    func naviagteToNextViewController() {
        router?.navigateToNextViewController()
    }
}

extension ConverterViewController: ConverterView,UITableViewDelegate,UITableViewDataSource,  UIPickerViewDelegate,UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        4
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CurrencyCell",
                                                 for: indexPath) as! CurrencyCell
        return cell
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 50
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return "USD"
    }
    
    func displaySomething(viewModel: ConverterModel.ViewModel) {
        // display here
    }
}

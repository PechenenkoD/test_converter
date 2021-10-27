//
//  ConverterScreenVC.swift
//  test_converter
//
//  Created by Bazzz on 23.10.2021.
//

import UIKit

protocol ConverterScreenVCProtocol: AnyObject {
    func display()
}

final class ConverterScreenVC: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    private enum Constants {
        enum NumberComponents {
            static let number: Int = 1
        }
    }
    
    @IBOutlet weak var labelTF: UILabel!
    @IBOutlet weak var priceTF: UITextField!
    @IBOutlet weak var enterTX: UITextField!
    @IBOutlet weak var pickerView: UIPickerView!
    
    var currencyModel = [Currency]()
    var activeCurrency = 0.0

    private(set) var router: ConverterRouterProtocol?
    private var interactor: ConverterInteractorProtocol?
    
    private func setup() {
        let viewController = self
        let interactor = ConverterInteractor()
        let presenter = ConverterPresenter()
        viewController.interactor = interactor
        interactor.presenter = presenter
        presenter.viewController = viewController
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Converter"
        setup()
        
        pickerView.delegate = self
        pickerView.dataSource = self
        priceTF.addTarget(self, action: #selector(updateViews), for: .editingChanged)
        
        downloadJSON{}
    }
    
    @objc func updateViews(input: Double) {
        guard let amountText = priceTF.text, let theAmountText = Double(amountText) else { return }
        if priceTF.text != "" {
            let total = theAmountText * activeCurrency
            enterTX.text = String(format: "%.2f", total)
        }
    }

    func downloadJSON( completed: @escaping () -> () ) {
        let url = URL(string: "https://bank.gov.ua/NBUStatService/v1/statdirectory/exchange?json")
        URLSession.shared.dataTask(with: url!) { (data, response, error) in
            if error == nil {
                do {
                    self.currencyModel = try JSONDecoder().decode([Currency].self, from: data!)
                    DispatchQueue.main.async {
                        completed()
                    }
                } catch {
                    print("error")
                }
                DispatchQueue.main.async {
                    self.pickerView.reloadComponent(0)
                }
            }
        }.resume()
    }

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return Constants.NumberComponents.number
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return currencyModel.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return currencyModel[row].cc
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let selected = currencyModel[row].cc
        labelTF.text = selected
        
        activeCurrency = currencyModel[row].rate!
        updateViews(input: activeCurrency)
    }
}

extension ConverterScreenVC: ConverterScreenVCProtocol {
    func display() {
        // MARK
    }
}

//
//  CurrenciesScreenVC.swift
//  test_converter
//
//  Created by Bazzz on 23.10.2021.
//

import UIKit

protocol CurrenciesScreenVCProtocol: AnyObject {
    func display()
}

final class CurrenciesScreenVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var currencyModel = [Currency]()
        
    private(set) var router: CurrenciesRouterProtocol?
    private var interactor: CurrenciesInteractorProtocol?
    
    private func setup() {
        let viewController = self
        let interactor = CurrenciesInteractor()
        let presenter = CurrenciesPresenter()
        viewController.interactor = interactor
        interactor.presenter = presenter
        presenter.viewController = viewController
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Currencies"
        self.navigationItem.setHidesBackButton(true, animated: false)
        setup()
        self.showNavigationBar()
    
        downloadJSON {
            self.tableView.reloadData()
        }
        
        tableView.delegate = self
        tableView.dataSource = self
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
            }
        }.resume()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return currencyModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
             if let cell = tableView.dequeueReusableCell(withIdentifier: "Cell"){
                cell.textLabel?.text = currencyModel[indexPath.row].cc.capitalized.uppercased()
                if let rate = currencyModel[indexPath.row].rate {
                    cell.detailTextLabel?.text = String(format: "%.1f", rate)
                } else {
                    cell.detailTextLabel?.text = "-"
                }
                return cell
             }
                return UITableViewCell()
    }
    
    @IBAction private func converterScreen(_ sender: Any) {
        let storyboard = UIStoryboard.init(name: "ConverterScreenVC", bundle: nil)
        guard let currenciesVC = storyboard.instantiateViewController(identifier: "ConverterScreenVC") as? ConverterScreenVC else { return }
        
        navigationController?.pushViewController(currenciesVC, animated: true)
    }
}

extension CurrenciesScreenVC: CurrenciesScreenVCProtocol {
    func display() {
        // MARK
    }
}

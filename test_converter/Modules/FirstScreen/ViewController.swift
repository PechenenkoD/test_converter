//
//  ViewController.swift
//  test_converter
//
//  Created by Bazzz on 21.10.2021.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideNavigationBar()  
    }

    @IBAction private func nextScreenCurrencies(_ sender: Any) {
        let storyboard = UIStoryboard.init(name: "CurrenciesScreenVC", bundle: nil)
        guard let currenciesVC = storyboard.instantiateViewController(identifier: "CurrenciesScreenVC") as? CurrenciesScreenVC else { return }
        
        navigationController?.pushViewController(currenciesVC, animated: true)
    }

}

extension UIViewController {
    func hideNavigationBar() {
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }

    func showNavigationBar() {
        self.navigationController?.setNavigationBarHidden(false, animated: true)
    }
}

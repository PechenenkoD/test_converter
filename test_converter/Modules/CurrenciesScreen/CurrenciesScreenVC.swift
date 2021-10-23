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

final class CurrenciesScreenVC: UIViewController {
    
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
        setup()
    }

}

extension CurrenciesScreenVC: CurrenciesScreenVCProtocol {
    func display() {
        // MARK
    }
}

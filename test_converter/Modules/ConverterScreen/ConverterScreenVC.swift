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

final class ConverterScreenVC: UIViewController {

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
        setup()
    }
    
}

extension ConverterScreenVC: ConverterScreenVCProtocol {
    func display() {
        // MARK
    }
}

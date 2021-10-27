//
//  CurrenciesPresenter.swift
//  test_converter
//
//  Created by Pechenenko Dima on 23.10.2021.
//

import Foundation

protocol CurrenciesPresenterProtocol {
    func present()
}

final class CurrenciesPresenter {
    weak var viewController: CurrenciesScreenVCProtocol?
}

extension CurrenciesPresenter: CurrenciesPresenterProtocol {
    func present() {
        // MARK
    }
}

//
//  InteractorVC.swift
//  test_converter
//
//  Created by Pechenenko Dima on 23.10.2021.
//

import Foundation

protocol CurrenciesInteractorProtocol {
    func fetchData()
}

final class CurrenciesInteractor {
    var presenter: CurrenciesPresenterProtocol?
}

extension CurrenciesInteractor: CurrenciesInteractorProtocol {
    func fetchData() {
        //MARK
    }
}

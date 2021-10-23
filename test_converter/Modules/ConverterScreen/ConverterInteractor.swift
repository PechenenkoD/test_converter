//
//  ConverterInteractor.swift
//  test_converter
//
//  Created by Bazzz on 23.10.2021.
//

import Foundation

protocol ConverterInteractorProtocol {
    func fetchData()
}

final class ConverterInteractor {
    var presenter: ConverterPresenterProtocol?
}

extension ConverterInteractor: ConverterInteractorProtocol {
    func fetchData() {
        // MARK
    }
}

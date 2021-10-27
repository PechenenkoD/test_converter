//
//  ConverterPresenter.swift
//  test_converter
//
//  Created by Pechenenko Dima on 23.10.2021.
//

import Foundation

protocol ConverterPresenterProtocol {
    func present()
}

final class ConverterPresenter {
    weak var viewController: ConverterScreenVCProtocol?
}

extension ConverterPresenter: ConverterPresenterProtocol {
    func present() {
        // MARK
    }
}

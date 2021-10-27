//
//  CurrenciesRouter.swift
//  test_converter
//
//  Created by Pechenenko Dima on 23.10.2021.
//

import Foundation
import UIKit

protocol CurrenciesRouterProtocol {
    func navigateToDetails()
}

final class CurrenciesRouter {
    weak var viewController: UIViewController?
}

extension CurrenciesRouter: CurrenciesRouterProtocol {
    func navigateToDetails() {
        // MARK
    }
}

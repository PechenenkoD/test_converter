//
//  ConverterRouter.swift
//  test_converter
//
//  Created by Bazzz on 23.10.2021.
//

import Foundation
import UIKit

protocol ConverterRouterProtocol {
    func navigateToDetails()
}

final class ConverterRouter {
    weak var viewController: UIViewController?
}

extension ConverterRouter: ConverterRouterProtocol {
    func navigateToDetails() {
        // MARK
    }
}

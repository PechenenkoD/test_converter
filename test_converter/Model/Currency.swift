//
//  Currency.swift
//  test_converter
//
//  Created by Bazzz on 24.10.2021.
//

import Foundation

struct Currency: Decodable {
    let r030: Int
    let txt: String
    let rate: Double?
    let cc: String
    let exchangedate: String
}

//
//  RatesList.swift
//  RatePage
//
//  Created by Melalujka on 12.12.2021.
//

import Foundation

struct RatesList: Decodable {
    var code: Int
    var messageTitle: String
    var message: String
    var rid: String
    var downloadDate: String
    var rates: [Rate]
    var productState: Int
    var ratesDate: String
}

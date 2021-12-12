//
//  Rate.swift
//  RatePage
//
//  Created by Melalujka on 12.12.2021.
//

import Foundation

struct Rate: Decodable, Hashable {
    var tp: Int
    var name: String
    var from: Int
    var currMnemFrom: String
    var to: Int
    var currMnemTo: String
    var basic: String
    var buy: String
    var sale: String
    var deltaBuy: String
    var deltaSale: String
}

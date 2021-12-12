//
//  Constants.swift
//  RatePage
//
//  Created by Melalujka on 12.12.2021.
//

import Foundation


enum Constants {
    static let upTrend = "\u{25b2}"
    static let downTrend = "\u{25bc}"
}

extension Constants {
    enum Rates {
        static let scheme = "https"
        static let host = "alpha.as50464.net"
        static let port = 29870
        static let path = "/moby-pre-44/core"
        
        enum Query {
            static let rKey = "r"
            static let dKey = "d"
            static let tKey = "t"
            static let vKey = "v"
            
            static let rValue = "BEYkZbmV"
            static let dValue = "563B4852-6D4B-49D6-A86E-B273DD520FD2"
            static let tValue = "ExchangeRates"
            static let vValue = "44"
        }
        
        enum BodyParameter {
            static let uid = "563B4852-6D4B-49D6-A86E-B273DD520FD2"
            static let type = "ExchangeRates"
            static let rid = "BEYkZbmV"
        }
        
        enum Headers {
            static let userAgentKey = "User-Agent"
            static let userAgent = "Test GeekBrains iOS 3.0.0.182 (iPhone 11; iOS 14.4.1; Scale/2.00; Private)"
            static let contentTypeKey = "Content-Type"
            static let contentType = "application/json"
            static let acceptKey = "Accept"
            static let accept = "application/json"
        }
    }
}

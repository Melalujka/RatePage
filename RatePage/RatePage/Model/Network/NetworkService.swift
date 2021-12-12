//
//  NetworkService.swift
//  RatePage
//
//  Created by Melalujka on 12.12.2021.
//

import Alamofire

typealias Response<T> = (AFDataResponse<T>) -> Void
typealias RatesResponse = (RatesList?, Error?) -> Void
typealias Success = (Bool) -> Void

protocol NetworkService {
    func getRates(result: @escaping RatesResponse)
}

extension NetworkService {
    func fetch<T: Decodable>(with decoder: JSONDecoder = JSONDecoder(), request: DataRequest, of: T.Type, result: @escaping Response<T>) {
        
        request
            .validate()
            .responseDecodable(of: T.self, decoder: decoder) { response in
                result(response)
        }
    }
}

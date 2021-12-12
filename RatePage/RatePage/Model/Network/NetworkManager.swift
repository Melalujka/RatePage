//
//  NetworkManager.swift
//  RatePage
//
//  Created by Melalujka on 12.12.2021.
//

import Alamofire
import Foundation

final class NetworkManager: NetworkService {
    
    func getRates(result: @escaping RatesResponse) {
        fetch(request: AF.request(Router.getRates(fetchRequest: .rates)),
              of: RatesList.self) { response in
                result(response.value, response.error)
        }
    }
}

private extension NetworkManager {
    
    typealias Api = Constants.Rates
    typealias Query = Constants.Rates.Query
    typealias Body = Constants.Rates.BodyParameter
    typealias Headers = Constants.Rates.Headers
    
    enum Router: URLRequestConvertible {
        case getRates(fetchRequest: FetchRequest)
        
        var method: HTTPMethod {
            switch self {
            case .getRates:
                return .post
            }
        }
        
        func asURLRequest() throws -> URLRequest {
            switch self {
            case .getRates(let fetchRequest):
                let url = fetchRequest.url
                var urlRequest = URLRequest(url: url)
                urlRequest.httpMethod = method.rawValue
                urlRequest.headers = fetchRequest.headers
                urlRequest.httpBody = fetchRequest.body
                
                return urlRequest
            }
        }
    }
    
    enum FetchRequest {
        case rates
        var parameters: [String: String] {
            switch self {
            case .rates: return [
                Query.rKey: Query.rValue,
                Query.dKey: Query.dValue,
                Query.tKey: Query.tValue,
                Query.vKey: Query.vValue,
            ]
            }
        }
        
        var url: URL {
            switch self {
            case .rates:
                var urlComponents = URLComponents()
                urlComponents.scheme = Api.scheme
                urlComponents.host = Api.host
                urlComponents.port = Api.port
                urlComponents.path = Api.path
                urlComponents.queryItems = parameters.map { URLQueryItem(name: $0.key, value: $0.value) }
                
                return urlComponents.url!
            }
        }
        
        var body: Data? {
            switch self {
            case .rates:
                let body = RequestBody(uid: Body.uid,
                                        type: Body.type,
                                        rid: Body.rid)
                
                return try? JSONEncoder().encode(body)
            }
        }
        
        var headers: HTTPHeaders {
            switch self {
            case .rates:
                return HTTPHeaders([
                    Headers.userAgentKey:   Headers.userAgent,
                    Headers.acceptKey:      Headers.accept,
                    Headers.contentTypeKey: Headers.contentType,
                ])
            }
        }
    }
}

//
//  RatesPageViewModel.swift
//  RatePage
//
//  Created by Melalujka on 12.12.2021.
//

import Foundation

enum RatesPageAction: Bindable {
    case success, failure(message: String)
}

class RatesPageViewModel: ViewModel<RatesPageAction> {
    var network: NetworkService?
    
    private var rates: RatesList?
    
    var sections: [Int]?
    
    func fetchRates() {
        network?.getRates(result: { [weak self] ratesList, _ in
            guard let ratesList = ratesList else {
                self?.post(.failure(message: "Rates temporaly unavailable."))
                return
            }
            
            self?.rates = ratesList
            self?.prepareSections()
            self?.post(.success)
        })
    }
    
    func prepareSections() {
        let sectionsIds = Set(rates?.rates.map({ $0.tp }) ?? [])
        sections = Array(sectionsIds).sorted()
    }
    
    func getItems(for section: Int) -> [Rate] {
        rates?.rates.filter({ $0.tp == section }) ?? []
    }
}

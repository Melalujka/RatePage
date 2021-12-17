//
//  CurrencyRateCell.swift
//  RatePage
//
//  Created by Melalujka on 12.12.2021.
//

import UIKit

class CurrencyRateCell: UITableViewCell {
    static var identifier: String { String(describing: self) }
    
    @IBOutlet weak var nameLabel: UILabel?
    @IBOutlet weak var descriptionLabel: UILabel?
    @IBOutlet weak var basicLabel: UILabel?
    @IBOutlet weak var buyLabel: UILabel?
    @IBOutlet weak var saleLabel: UILabel?
    @IBOutlet weak var deltaBuyLabel: UILabel?
    @IBOutlet weak var deltaSaleLabel: UILabel?
    @IBOutlet weak var countriesView: CountryView?
    
    let upTrendColor = #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)
    let downColor = #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1)
    let stagnationTrendColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupView()
    }
    
    private func setupView() {
        selectionStyle = .none
    }
    
    func configure(_ model: Rate) {
        nameLabel?.text = model.name
        descriptionLabel?.text = "\(model.currMnemTo)(\(model.to)) / \(model.currMnemFrom)(\(model.from))"
        basicLabel?.text = "\(model.basic) \(getSymbol(forCurrencyCode: model.currMnemTo)) за \(getSymbol(forCurrencyCode: model.currMnemFrom))"
        buyLabel?.text = model.buy
        saleLabel?.text = model.sale
        deltaBuyLabel?.text = trendSymbol(with: model.deltaBuy) + model.deltaBuy
        deltaBuyLabel?.textColor = deltaColor(with: model.deltaBuy)
        deltaSaleLabel?.text = trendSymbol(with: model.deltaBuy) + model.deltaSale
        deltaSaleLabel?.textColor = deltaColor(with: model.deltaSale)
        
        countriesView?.setPairOfFlags(left: getFlag(from: model.currMnemTo), right: getFlag(from: model.currMnemFrom))
    }
    
    func trendSymbol(with string: String) -> String {
        guard let delta = Double(string) else { return "" }

        return delta > 0 ? Constants.upTrend : delta < 0 ? Constants.downTrend : ""
    }

    func deltaColor(with string: String) -> UIColor {
        guard let delta = Double(string) else { return stagnationTrendColor }
        
        return delta > 0 ? upTrendColor : delta < 0 ? downColor : stagnationTrendColor
    }
    
    func getSymbol(forCurrencyCode code: String) -> String {
        let locale = NSLocale(localeIdentifier: code)
        if locale.displayName(forKey: .currencySymbol, value: code) == code {
            let newlocale = NSLocale(localeIdentifier: code.dropLast() + "_en")
            return newlocale.displayName(forKey: .currencySymbol, value: code) ?? ""
        }
        return locale.displayName(forKey: .currencySymbol, value: code) ?? ""
    }
    
    func getFlag(from countryCode: String) -> String {
        let isoCountryCode = String(countryCode.prefix(2))
        
        return isoCountryCode
            .unicodeScalars
            .map({ 127397 + $0.value })
            .compactMap(UnicodeScalar.init)
            .map(String.init)
            .joined()
    }
}

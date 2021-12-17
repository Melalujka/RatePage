//
//  HeaderView.swift
//  RatePage
//
//  Created by Melalujka on 17.12.2021.
//

import UIKit

class HeaderView: UIView {
    private let leadingInset: CGFloat = 20
    private let trailingInset: CGFloat = 20
    private let topInset: CGFloat = 8
    private let bottomInset: CGFloat = 8
    
    private let fontSize: CGFloat = 17
    
    lazy var title: UILabel = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.numberOfLines = 0
        $0.font = .systemFont(ofSize: fontSize, weight: .bold)
        addSubview($0)
        NSLayoutConstraint.activate([
            $0.leadingAnchor.constraint(equalTo: leadingAnchor, constant: leadingInset),
            $0.trailingAnchor.constraint(equalTo: trailingAnchor, constant: trailingInset),
            $0.topAnchor.constraint(equalTo: topAnchor, constant: topInset),
            $0.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -bottomInset),
        ])
        
        return $0
    }(UILabel())
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        backgroundColor = .systemBackground
    }

    func setTitle(_ text: String) {
        title.text = text
    }
}

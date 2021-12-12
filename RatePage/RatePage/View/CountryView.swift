//
//  CountryView.swift
//  RatePage
//
//  Created by Melalujka on 12.12.2021.
//

import UIKit

class CountryView: UIView {
    lazy var leftLabel: UILabel = {
        $0.adjustsFontSizeToFitWidth = true
        $0.font = .systemFont(ofSize: 700)
        $0.minimumScaleFactor = 0.1
        $0.numberOfLines = 1
        $0.textAlignment = .left
        
        return  $0
    }(UILabel())
    
    lazy var rightLabel: UILabel = {
        $0.adjustsFontSizeToFitWidth = true
        $0.font = .systemFont(ofSize: 700)
        $0.minimumScaleFactor = 0.1
        $0.numberOfLines = 1
        $0.textAlignment = .right
        
        return  $0
    }(UILabel())
    
    override var bounds: CGRect {
        didSet {
            drawContent()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(leftLabel)
        addSubview(rightLabel)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        addSubview(leftLabel)
        addSubview(rightLabel)
    }
    
    func setPairOfFlags(left: String, right: String) {
        leftLabel.text = left
        rightLabel.text = right
    }
    
    private func drawContent() {
        [leftLabel, rightLabel].forEach { $0.frame = bounds }
        appendShape(to: rightLabel, isLeft: false)
        rightLabel.bounds.origin = CGPoint(x: 0, y: -0.08 * bounds.size.height)
        appendShape(to: leftLabel, isLeft: true)
    }
    
    private func appendShape(to view: UIView, isLeft: Bool) {
        let shape = CAShapeLayer()
        shape.path = makeShapePath(isLeft).cgPath
        view.layer.mask = shape
    }
    
    private func makeShapePath(_ isLeft: Bool) -> UIBezierPath {
        let path = UIBezierPath()
        path.move   (to: CGPoint(x: isLeft ? 0 : bounds.maxX,   y: 0))
        path.addLine(to: CGPoint(x: isLeft ? 0 : bounds.maxX,   y: bounds.maxY))
        path.addLine(to: CGPoint(x: bounds.maxX/3,              y: bounds.maxY))
        path.addLine(to: CGPoint(x: bounds.maxX/3*2,            y: 0))
        path.close()
        
        return path
    }
}

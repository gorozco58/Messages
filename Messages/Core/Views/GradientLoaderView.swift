//
//  GradientLoaderView.swift
//  Messages
//
//  Created by Giovanny Orozco on 9/22/18.
//  Copyright © 2018 Giovanny Orozco. All rights reserved.
//

import UIKit

open class GradientLoaderView: UIView {

    open var gradientView: HorizontalGradientView!
    @IBInspectable open var customColor: UIColor? = nil {
        didSet {
            backgroundColor = customColor
        }
    }
    
    open var colorsLoader: [UIColor] = []
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }

    fileprivate func setup() {
        if customColor.isNull {
            backgroundColor = .whiteTwo
        }
        
        gradientView = HorizontalGradientView(frame: bounds)
        addSubview(gradientView)
    }
    
    override open func layoutSubviews() {
        super.layoutSubviews()
        gradientView.frame = bounds
    }
    
}


public class HorizontalGradientView: UIView {
    
    fileprivate var gradientWidth: CGFloat {
        return bounds.width / 1.5
    }
    fileprivate var gradientLayer: CAGradientLayer!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        setupView()
    }
    
    override open func layoutSubviews() {
        super.layoutSubviews()
        setupView()
    }
    
    public func reset() {
        layer.mask = nil
        if let gradientLayer = gradientLayer {
            gradientLayer.removeAllAnimations()
            self.gradientLayer = nil
        }
    }
    
    func setupView() {
        setup(with: bounds)
    }
    
    func setup(with frame: CGRect) {
        gradientLayer = CAGradientLayer()
        gradientLayer.frame = CGRect(x: -(frame.minX + gradientWidth), y: 0, width: gradientWidth, height: bounds.height)
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.5)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 0.5)
        gradientLayer.colors = [
            UIColor.clear.cgColor,
            UIColor.whiteLoader.cgColor,
            UIColor.clear.cgColor
        ]
        
        layer.mask = gradientLayer
        animate(gradientLayer, with: frame)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        
        super.init(coder: aDecoder)
        backgroundColor = .white
        setupView()
    }
    
    fileprivate func animate(_ layer: CAGradientLayer, with frame: CGRect) {
        guard layer.animation(forKey: "moveAnimation") == nil else { return }
        
        let minX = layer.frame.minX
        let maxX = frame.width - frame.minX + self.gradientWidth
        
        let animation = CABasicAnimation(keyPath: "position")
        animation.fromValue = NSValue(cgPoint: CGPoint(x: minX, y: self.center.y))
        animation.toValue = NSValue(cgPoint: CGPoint(x: maxX, y: self.center.y))
        animation.duration = 0.7
        animation.speed = 0.7
        animation.repeatCount = .infinity
        
        layer.add(animation, forKey: "moveAnimation")
    }
    
}

extension Collection where Iterator.Element == GradientLoaderView {

    public func syncronize() {
        let minX = sorted { $0.frame.origin.x < $1.frame.origin.x }.first!.frame.origin.x
        let maxWidth = sorted { $0.frame.width > $1.frame.width }.first!.frame.width
        
        forEach { view in
            let frame = CGRect(x: view.frame.origin.x - minX, y: 0, width: maxWidth, height: 0)
            view.gradientView.reset()
            view.gradientView.setup(with: frame)
        }
    }
}

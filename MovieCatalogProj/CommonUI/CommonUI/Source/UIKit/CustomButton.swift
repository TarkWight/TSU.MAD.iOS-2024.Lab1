//
//  CustomButton.swift
//  CommonUI
//
//  Created by Tark Wight on 18.10.2024.
//

import UIKit

public class CustomButton: UIButton {
    
    // MARK: - Properties
    private var gradientLayer: CAGradientLayer?
    
    // MARK: - Initializers
    public override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    // MARK: - Setup Method
    private func setup() {
        self.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        self.layer.cornerRadius = 10
        self.clipsToBounds = true
        self.translatesAutoresizingMaskIntoConstraints = false
        
        setGradientBackground()
    }
    
    // MARK: - Configuration Methods
    public func setGradientBackground() {
        gradientLayer?.removeFromSuperlayer()
        
        let gradientLayer = CAGradientLayer()

        let color1 = UIColor(named: "gradientLeftColor") ?? UIColor.red
        let color2 = UIColor(named: "gradientRightColor") ?? UIColor.orange
     
        gradientLayer.colors = [color1.cgColor, color2.cgColor]
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.0)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 0.0)
        
        gradientLayer.frame = bounds
        layer.insertSublayer(gradientLayer, at: 0)
        
        self.gradientLayer = gradientLayer
    }
    
    public func setSolidBackground(color: UIColor) {
        gradientLayer?.removeFromSuperlayer()
        backgroundColor = color
    }
    
    public func setTitle(_ title: String, for state: UIControl.State) {
        super.setTitle(title, for: state)
    }
    
    // MARK: - Layout
    public override func layoutSubviews() {
        super.layoutSubviews()
        gradientLayer?.frame = bounds
    }
}

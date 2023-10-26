//
//   UIButton+Extension.swift
//  CoordinatorTemplate
//
//  Created by Eric Williams on 2023-10-25.
//

import UIKit

extension UIButton {

    func makeRounded(cornerRadius: CGFloat, borderColor: UIColor = .clear, borderWidth: CGFloat = 0) {
        layer.masksToBounds = true
        layer.cornerRadius = cornerRadius
        layer.borderWidth = borderWidth
        layer.borderColor = borderColor.cgColor
    }

    func underline() {
        guard let text = self.titleLabel?.text else { return }
        let attributedString = NSMutableAttributedString(string: text)
        attributedString.addAttribute(NSAttributedString.Key.underlineStyle,
                                      value: NSUnderlineStyle.single.rawValue,
                                      range: NSRange(location: 0, length: text.count))
        self.setAttributedTitle(attributedString, for: .normal)
    }

    func setBackgroundColor(_ color: UIColor, for state: UIControl.State) {
        let rect = CGRect(x: 0, y: 0, width: 1, height: 1)
        UIGraphicsBeginImageContext(rect.size)
        let context = UIGraphicsGetCurrentContext()
        context!.setFillColor(color.cgColor)
        context!.fill(rect)
        let img = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        setBackgroundImage(img, for: state)
    }

    func rounded(with cornerRadius: CGFloat,
                 byRoundingCorners corners: UIRectCorner) {
        let rectShape = CAShapeLayer()
        rectShape.bounds = frame
        rectShape.position = center
        rectShape.path = UIBezierPath(roundedRect: bounds,
                                      byRoundingCorners: corners,
                                      cornerRadii: CGSize(width: cornerRadius,
                                                          height: cornerRadius)).cgPath
        layer.mask = rectShape
    }

    func startRotatingImage() {
        let rotateAnimation = CABasicAnimation(keyPath: "transform.rotation")
        rotateAnimation.fromValue = 0.0
        rotateAnimation.toValue = Double.pi * 2
        rotateAnimation.duration = 1.0
        rotateAnimation.repeatCount = .infinity
        DispatchQueue.main.async { [weak self] in
            self?.imageView?.layer.add(rotateAnimation, forKey: AppConstants.AnimationKey.rotation)
        }
    }

    func stopRotatingImage() {
        DispatchQueue.main.async { [weak self] in
            self?.imageView?.layer.removeAnimation(forKey: AppConstants.AnimationKey.rotation)
        }
    }

}

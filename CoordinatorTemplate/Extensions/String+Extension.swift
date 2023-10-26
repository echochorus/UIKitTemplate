//
//  String+Extension.swift
//  CoordinatorTemplate
//
//  Created by Eric Williams on 2023-10-25.
//

import Foundation
import UIKit

extension String {

    // Validate against an Email regex
    var isEmail: Bool {
        let emailRegEx = "[A-Z0-9a-z._%'+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"
        let emailTest = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: self)
    }

    func attributedString(with font: UIFont, color: UIColor) -> NSMutableAttributedString {
        var attributes = [NSAttributedString.Key: Any]()
        attributes[NSAttributedString.Key.foregroundColor] = color
        attributes[NSAttributedString.Key.font] = font
        let attributedString = NSMutableAttributedString(
            string: self,
            attributes: attributes)
        return attributedString
    }

    func convertToAttributedString(with font: UIFont) -> NSAttributedString {
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.minimumLineHeight = ceil(font.lineHeight)
        paragraphStyle.maximumLineHeight = ceil(font.lineHeight)
        paragraphStyle.lineSpacing = 0
        paragraphStyle.lineBreakMode = NSLineBreakMode.byWordWrapping
        let attributes = [NSAttributedString.Key.font: font,
                          NSAttributedString.Key.paragraphStyle: paragraphStyle]
        return NSAttributedString(string: self, attributes: attributes)
    }

    func attributedStringWith(styleText: String, styleFont: UIFont, normalFont: UIFont) -> NSAttributedString {
        let attributedText = NSMutableAttributedString(string: self)
        attributedText.addAttribute(NSAttributedString.Key.font,
                                    value: normalFont,
                                    range: (self as NSString).range(of: (self)))
        attributedText.addAttribute(NSAttributedString.Key.font,
                                    value: styleFont,
                                    range: (self as NSString).range(of: styleText))
        return attributedText
    }

    func convertToDate(with dateFormatterStyle: DateFormatterStyle, currentLocale: Locale? = nil) -> Date? {
        let dateFormater = DateFormatter()
        dateFormater.dateFormat = dateFormatterStyle.format()
        if let locale = currentLocale {
            dateFormater.locale = locale
        } else {
            dateFormater.locale = Locale.current
        }
        return dateFormater.date(from: self)
    }

    func capitalizedFirstLetter() -> String {
        return prefix(1).uppercased() + dropFirst()
    }

    func localized() -> String {
        return NSLocalizedString(self, comment: "")
    }

    func formatted(with arguments: CVarArg) -> String {
        return String(format: self, arguments)
    }

    func calculateSize(with font: UIFont) -> CGSize {
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineBreakMode = NSLineBreakMode.byWordWrapping
        paragraphStyle.alignment = .center

        let attributes = [NSAttributedString.Key.font: font,
                          NSAttributedString.Key.paragraphStyle: paragraphStyle
        ]

        let titleString = NSString(string: self)
        let size = titleString.size(withAttributes: attributes)
        return size
    }

    func calculateNewFrame(with oldSize: CGSize,
                           and font: UIFont) -> CGRect {
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineBreakMode = NSLineBreakMode.byWordWrapping
        paragraphStyle.alignment = .left
        paragraphStyle.minimumLineHeight = ceil(font.lineHeight)
        paragraphStyle.maximumLineHeight = ceil(font.lineHeight)

        let attributes = [NSAttributedString.Key.font: font,
                          NSAttributedString.Key.paragraphStyle: paragraphStyle] as [NSAttributedString.Key: Any]

        let attributedString = NSAttributedString(string: self, attributes: attributes)

        let estimatedFrame = attributedString.boundingRect(with: oldSize,
                                                           options: [.usesLineFragmentOrigin, .usesFontLeading],
                                                           context: nil)
        return estimatedFrame
    }

    func height(withConstrainedWidth width: CGFloat,
                font: UIFont) -> CGFloat {
        let constraintRect = CGSize(width: width, height: .greatestFiniteMagnitude)
        let boundingBox = self.boundingRect(with: constraintRect,
                                            options: .usesLineFragmentOrigin,
                                            attributes: [NSAttributedString.Key.font: font],
                                            context: nil)

        return ceil(boundingBox.height)
    }

    func width(withConstrainedHeight height: CGFloat,
               font: UIFont) -> CGFloat {
        let constraintRect = CGSize(width: .greatestFiniteMagnitude, height: height)
        let boundingBox = self.boundingRect(with: constraintRect,
                                            options: .usesLineFragmentOrigin,
                                            attributes: [NSAttributedString.Key.font: font],
                                            context: nil)

        return ceil(boundingBox.width)
    }

    func index(of character: Character) -> Int? {
        return firstIndex(of: character)?.utf16Offset(in: self)
    }
}

//
//  ATextKey.swift
//  ATextKit
//
//  Created by 野本瑛資 on 2025/11/15.
//

import SwiftUI

public enum ATextKey {
    case foregroundColor
    case backgroundColor
    case font
    case strikethroughStyle
    case strikethroughColor
    case shadow
    case strokeWidth
    case underlineStyle
    case underlineColor
    case italic
    case kerning
    case paragraphStyle
    case link
    
    func setAttributes<A: TextAttributable>(from attributesInfo: A, attributedString: inout NSMutableAttributedString) {
        let range = attributesInfo.selectedRange
        switch self {
        case .foregroundColor:
            guard let color = attributesInfo.textColor else { return }
            attributedString.addAttribute(.foregroundColor, value: UIColor(color), range: range)
        case .backgroundColor:
            guard let color = attributesInfo.backgroundColor else { return }
            attributedString.addAttribute(.backgroundColor, value: UIColor(color), range: range)
        case .font:
            guard let fontWeight = attributesInfo.fontWeight else { return }
            let size = attributesInfo.fontSize
            attributedString.enumerateAttribute(.font, in: range, options: []) { value, range, _ in
                guard let font = value as? UIFont else { return }
                let attributes: [UIFontDescriptor.TraitKey: Any] = [
                    UIFontDescriptor.TraitKey.weight: fontWeight
                ]
                let descriptor = font.fontDescriptor.addingAttributes([
                    UIFontDescriptor.AttributeName.traits: attributes
                ])
                let targetFont = UIFont(descriptor: descriptor, size: size)
                attributedString.addAttribute(.font, value: targetFont, range: range)
            }
        case .strikethroughStyle:
            guard let width = attributesInfo.strikethrougWidth else { return }
            attributedString.addAttribute(.strikethroughStyle, value: width, range: range)
        case .strikethroughColor:
            guard let color = attributesInfo.strikethroughColor else { return }
            attributedString.addAttribute(.strikethroughColor, value: UIColor(color), range: range)
        case .shadow:
            guard let shadowOffset = attributesInfo.shadowOffset else { return }
            let shadow: NSShadow = NSShadow()
            let shadowColor = attributesInfo.shadowColor
            let shadowBlurRadius = attributesInfo.shadowBlur
            shadow.shadowOffset = shadowOffset
            shadow.shadowColor = UIColor(shadowColor ?? ATextConfig.defShadowColor)
            shadow.shadowBlurRadius = shadowBlurRadius ?? 1
            attributedString.addAttribute(.shadow, value: shadow, range: range)
        case .strokeWidth:
            guard let width = attributesInfo.strokeWidth else { return }
            attributedString.addAttribute(.strokeWidth, value: width, range: range)
        case .underlineStyle:
            guard let width = attributesInfo.underlineWidth else { return }
            attributedString.addAttribute(.underlineStyle, value: width, range: range)
        case .underlineColor:
            guard let color = attributesInfo.underlineColor else { return }
            attributedString.addAttribute(.underlineColor, value: UIColor(color), range: range)
        case .italic:
            guard let isItalic = attributesInfo.isItalic else { return }
            let size = attributesInfo.fontSize
            attributedString.enumerateAttribute(.font, in: range, options: []) { value, range, _ in
                guard let font = value as? UIFont else { return }
                var traits = font.fontDescriptor.symbolicTraits
                if isItalic {
                    if !traits.contains(.traitItalic) {
                        traits.insert(.traitItalic)
                    }
                } else {
                    traits.remove(.traitItalic)
                }
                if let descriptor = font.fontDescriptor.withSymbolicTraits(traits) {
                    let italicFont = UIFont(descriptor: descriptor, size: size)
                    attributedString.addAttribute(.font, value: italicFont, range: range)
                }
            }
        case .kerning:
            guard let kerning = attributesInfo.kerningValue else { return }
            attributedString.addAttribute(.kern, value: kerning, range: range)
        case .paragraphStyle:
            guard let style = attributesInfo.paragraphStyle else { return }
            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.lineSpacing = style.spacing
            paragraphStyle.alignment = style.alignment
            attributedString.addAttribute(.paragraphStyle, value: paragraphStyle, range: range)
        case .link:
            guard let targetURL = attributesInfo.linkURL else { return }
            attributedString.addAttribute(.link, value: targetURL, range: range)
        }
    }
}





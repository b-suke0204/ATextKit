
//
//  ATextKeyValue.swift
//  ATextKit
//
//  Created by 野本瑛資 on 2025/11/15.
//

import SwiftUI

// KeyPathの記事: https://qiita.com/shiz/items/b49251001a9ea54e4beb
// 型消去した構造体を作って、任意の型でもKeyPathを使えるようにする
// ATextKeyValue
public struct ATextKeyValue<Root> {
    var keyPath: PartialKeyPath<Root>
    var apply: (inout Root) -> Void
    
    public init<Value>(keyPath: WritableKeyPath<Root, Value>, _ value: Value) {
        self.keyPath = keyPath
        self.apply = { root in
            root[keyPath: keyPath] = value
        }
    }
}

// SwiftUIのように値を渡せるように変更
extension ATextKeyValue where Root == ATextSelectionInfo {
    static public func textColor(_ color: Color) -> Self {
        return .init(keyPath: \.textColor, color)
    }
    
    static public func backgroundColor(_ color: Color) -> Self {
        return .init(keyPath: \.backgroundColor, color)
    }
    
    static public func fontWeight(_ weight: UIFont.Weight) -> Self {
        return .init(keyPath: \.fontWeight, weight)
    }
    
    static public func fontSize(_ size: CGFloat) -> Self {
        return .init(keyPath: \.fontSize, size)
    }
    
    static public func strikethroughWidth(_ width: CGFloat) -> Self {
        return .init(keyPath: \.strikethrougWidth, width)
    }
    
    static public func strikethroughColor(_ color: Color) -> Self {
        return .init(keyPath: \.strikethroughColor, color)
    }
    
    static public func shadowOffset(_ offset: CGSize) -> Self {
        return .init(keyPath: \.shadowOffset, offset)
    }
    
    static public func shadowColor(_ color: Color) -> Self {
        return .init(keyPath: \.shadowColor, color)
    }
    
    static public func shadowBlur(_ blur: CGFloat) -> Self {
        return .init(keyPath: \.shadowBlur, blur)
    }
    
    static public func strokeWidth(_ width: CGFloat) -> Self {
        return .init(keyPath: \.strokeWidth, width)
    }
    
    static public func underlineWidth(_ width: CGFloat) -> Self {
        return .init(keyPath: \.underlineWidth, width)
    }
    
    static public func underlineColor(_ color: Color) -> Self {
        return .init(keyPath: \.underlineColor, color)
    }
    
    static public func italic(_ isItalic: Bool) -> Self {
        return .init(keyPath: \.isItalic, isItalic)
    }
    
    static public func kerning(_ value: CGFloat) -> Self {
        return .init(keyPath: \.kerningValue, value)
    }
    
    static public func paragraphStyle(_ style: (alignment: NSTextAlignment, spacing: CGFloat)) -> Self {
        return .init(keyPath: \.paragraphStyle, style)
    }
    
    static public func linkURL(_ url: URL) -> Self {
        return .init(keyPath: \.linkURL, url)
    }
}



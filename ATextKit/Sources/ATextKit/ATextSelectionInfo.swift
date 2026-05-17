//
//  ATextSelectionInfo.swift
//  ATextKit
//
//  Created by 野本瑛資 on 2025/11/15.
//

import SwiftUI

// 選択されたテキストの情報を入れておく
public struct ATextSelectionInfo: TextAttributable {
    public var selectedText: String? = nil  // 選択されたテキスト (念の為、入れておく)
    public var selectedRange: NSRange
    public var textColor: Color? = nil
    public var fontWeight: UIFont.Weight? = nil
    public var fontSize: CGFloat = 17
    public var backgroundColor: Color? = nil
    public var strikethrougWidth: CGFloat? = nil  // 打ち消し線
    public var strikethroughColor: Color? = nil  // 打ち消し線の色
    public var shadowOffset: CGSize? = nil  // シャドウの大きさ
    public var shadowColor: Color? = nil  // シャドウの色
    public var shadowBlur: CGFloat? = nil  // シャドウのぼやけ具合
    public var strokeWidth: CGFloat? = nil  // 中抜け文字
    public var underlineWidth: CGFloat? = nil  // 下線の幅
    public var underlineColor: Color? = nil  // 下線の色
    public var isItalic: Bool? = nil  // 斜体
    public var kerningValue: CGFloat? = nil  // 文字感覚の値
    public var paragraphStyle: (alignment: NSTextAlignment, spacing: CGFloat)? = nil  // 段落の設定
    public var linkURL: URL? = nil  // リンク用URL (SwiftUIでは、非対応)
    
    public init(selectedRange: NSRange, selectedText: String? = nil) {
        self.selectedRange = selectedRange
        self.selectedText = selectedText
    }
    
    private func createKeyPairs() -> [ATextKey : Any?] {
        let keyPairs: [ATextKey : Any?] = [
            .font : self.fontWeight,
            .backgroundColor : self.backgroundColor,
            .foregroundColor : self.textColor,
            .strikethroughStyle : self.strikethrougWidth,
            .strikethroughColor : self.strikethroughColor,
            .shadow : self.shadowOffset,
            .strokeWidth : self.strokeWidth,
            .underlineStyle : self.underlineWidth,
            .underlineColor : self.underlineColor,
            .italic : self.isItalic,
            .kerning : self.kerningValue,
            .paragraphStyle : self.paragraphStyle,
            .link : self.linkURL
        ]
        return keyPairs
    }
    
    // ここにnilではなかったら、その属性のenumを返すようにする必要がある
    public func getKeys() -> [ATextKey] {
        var keys: [ATextKey] = []
        let keyPairs: [ATextKey : Any?] = self.createKeyPairs()
        // compacMapは、nilのものを無視してくれるので、valueがnilだったら、nilを返し、nilではなかったら、keyを返すようにする
        let targetKeys = keyPairs.compactMap({ key, value in
            return value == nil ? nil : key
        })
        keys.append(contentsOf: targetKeys)
        return keys
    }
}




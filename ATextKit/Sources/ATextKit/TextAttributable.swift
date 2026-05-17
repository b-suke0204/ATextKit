//
//  TextAttributable.swift
//  ATextKit
//
//  Created by 野本瑛資 on 2025/11/15.
//

import SwiftUI

// 文字属性管轄プロトコル
public protocol TextAttributable {
    var selectedText: String? { get set }  // 選択されたテキスト (念の為、入れておく)
    var selectedRange: NSRange { get set }
    
    var textColor: Color? { get set }
    var fontWeight: UIFont.Weight? { get set }
    var fontSize: CGFloat { get set }
    var backgroundColor: Color? { get set }
    var strikethrougWidth: CGFloat? { get set }  // 打ち消し線
    var strikethroughColor: Color? { get set }  // 打ち消し線の色
    var shadowOffset: CGSize? { get set }  // シャドウの大きさ
    var shadowColor: Color? { get set }  // シャドウの色
    var shadowBlur: CGFloat? { get set }  // シャドウのぼやけ具合
    var strokeWidth: CGFloat? { get set }  // 中抜け文字
    var underlineWidth: CGFloat? { get set }  // 下線の幅
    var underlineColor: Color? { get set }  // 下線の色
    var isItalic: Bool? { get set }  // 斜体
    var kerningValue: CGFloat? { get set }  // 文字感覚の値
    var paragraphStyle: (alignment: NSTextAlignment, spacing: CGFloat)? { get set }  // 段落の設定
    var linkURL: URL? { get set }  // リンク (SwiftUIでは、非対応)
    
    func getKeys() -> [ATextKey]
}




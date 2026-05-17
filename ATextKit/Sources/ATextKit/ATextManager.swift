//
//  ATextManager.swift
//  ATextKit
//
//  Created by 野本瑛資 on 2025/11/15.
//

import SwiftUI

// カスタムテキストエディタ垂直方向条件
public enum VerticalTextAlignment {
    case top
    case centerY
    case bottom
}

// ATextKit操作クラス
open class ATextManager {
    
    public init() {}
    
    // 文字属性を作成
    public func createAttributeSetting<A: TextAttributable>(attributedKeys: [ATextKey], attributesInfo: A, attributedString: inout NSMutableAttributedString) {
        for i in 0..<attributedKeys.count {
            attributedKeys[i].setAttributes(from: attributesInfo, attributedString: &attributedString)
        }
    }
    
    // 文字を更新
    public func updateAllTexts<A:TextAttributable>(_ text: inout NSAttributedString, attributedInfos: inout [A], keys: [ATextKeyValue<A>], make: (NSRange, String?) -> A) {
        attributedInfos.removeAll()
        let range = (text.string as NSString).range(of: text.string)
        attributedInfos.append(make(range, text.string))
        var last = attributedInfos[attributedInfos.count - 1]
        for key in keys {
            key.apply(&last)
        }
        attributedInfos[attributedInfos.count - 1] = last  // データを反映
        self.setTextAttributes(text: &text, atrributedInfos: &attributedInfos)
    }
    
    // 選択したテキストを変更
    public func updateSelectedText<A: TextAttributable>(_ text: inout NSAttributedString, range: NSRange, attributedInfos: inout [A], keys: [ATextKeyValue<A>], make: (NSRange, String?) -> A) {
        attributedInfos.removeAll()
        attributedInfos.append(make(range, text.string))
        var last = attributedInfos[attributedInfos.count - 1]
        for key in keys {
            key.apply(&last)
        }
        attributedInfos[attributedInfos.count - 1] = last  // データを反映
        self.setTextAttributes(text: &text, atrributedInfos: &attributedInfos)
    }
    
    // 文字の属性を設定
    private func setTextAttributes<A:TextAttributable>(text: inout NSAttributedString, atrributedInfos: inout [A]) {
        // attributedStringのまま受け取ることで、既存の属性を消さずに更新できる
        var attributedString = NSMutableAttributedString(attributedString: text)
        let attributedTextManager: ATextManager = ATextManager()
        
        for i in 0..<atrributedInfos.count {
            let attributedInfo = atrributedInfos[i]
            let attributedKeys = attributedInfo.getKeys()
            attributedTextManager.createAttributeSetting(
                attributedKeys: attributedKeys,
                attributesInfo: attributedInfo,
                attributedString: &attributedString
            )
        }
        text = attributedString
    }
    
    public func createTextKeys(make: () -> [ATextKeyValue<ATextSelectionInfo>]) -> [ATextKeyValue<ATextSelectionInfo>] {
        return make()
    }
}





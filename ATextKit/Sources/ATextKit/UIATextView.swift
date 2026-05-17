//
//  UIATextView.swift
//  ATextKit
//
//  Created by 野本瑛資 on 2025/11/15.
//

import SwiftUI

// UIKitのAttributedTextView
// UITextViewを拡張して、複数のテキストビューで使えるようにした
open class UIATextView: UITextView {
    
    // ビュー設定
    func createTextView() {
        self.backgroundColor = .clear
        self.textContainerInset = .zero
        self.textContainer.lineFragmentPadding = 0
        self.contentInset = ATextConfig.edgeInsets
    }
    
    // 垂直方向の文字揃え設定
    func setVerticalAlignment(verticalAlignment: VerticalTextAlignment) {
        let topInset: CGFloat = self.getTopInset(verticalAlignment: verticalAlignment)
        // makUIViewでもうすでにcontentInsetを指定しているため、以下のように値を取得する
        let leftInset = self.contentInset.left
        let bottomInset = self.contentInset.bottom
        let rightInset = self.contentInset.right
        self.contentInset = UIEdgeInsets(top: topInset, left: leftInset, bottom: bottomInset, right: rightInset)
    }
    
    // 垂直方向文字揃えで上方向のインセット取得
    private func getTopInset(verticalAlignment: VerticalTextAlignment) -> CGFloat {
        let size = self.contentSize
        let height = self.bounds.size.height
        var topInset: CGFloat = 0
        switch verticalAlignment {
            case .top:
                topInset = ATextConfig.topInset
            case .centerY:
                topInset = max((height - size.height) / 2, ATextConfig.topInset)
            case .bottom:
                topInset = max((height - size.height), ATextConfig.topInset)
        }
        return topInset
    }
}





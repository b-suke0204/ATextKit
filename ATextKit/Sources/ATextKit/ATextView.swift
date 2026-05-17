//
//  ATextView.swift
//  ATextKit
//
//  Created by 野本瑛資 on 2025/11/15.
//

import SwiftUI
import UIKit

/*
 // textは、必須
 // selectionに指定することで、テキストの一部を装飾することができるようになる
 // 選択時のテキストを取得する必要がある場合は、selectedTextを指定してデータをもらうようにする
 ATextView(text: <#String#>, selection: <#NSRange#>, selectedText: <#String?#>)
 */
public struct ATextView: UIViewRepresentable {
    @Binding var text: NSAttributedString
    @Binding var selection: NSRange?
    @Binding var selectedText: String?
    @Binding var verticalAlignment: VerticalTextAlignment
    
    public init(
        text: Binding<NSAttributedString>,
        selection: Binding<NSRange?> = .constant(nil),
        selectedText: Binding<String?> = .constant(nil),
        verticalAlignment: Binding<VerticalTextAlignment>
    ) {
        self._text = text
        self._selection = selection
        self._selectedText = selectedText
        self._verticalAlignment = verticalAlignment
    }

    public func makeUIView(context: Context) -> UIATextView {
        let textView = UIATextView()
        textView.font = UIFont.systemFont(ofSize: 17)
        // MARK: textView.isScrollEnabledをfalseにするとうまく位置計算が合わなくなるため注意
        textView.delegate = context.coordinator
        textView.createTextView()
        textView.setVerticalAlignment(verticalAlignment: self.verticalAlignment)
        return textView
    }

    public func updateUIView(_ uiView: UIATextView, context: Context) {
        uiView.attributedText = self.text
        DispatchQueue.main.async {
            uiView.setVerticalAlignment(verticalAlignment: self.verticalAlignment)
        }
    }

    public func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
}

public class Coordinator: NSObject, UITextViewDelegate {
    var parent: ATextView
    init(_ parent: ATextView) { self.parent = parent }

    // TextViewに変更を加えた時のデリゲート
    public func textViewDidChange(_ textView: UITextView) {
        self.parent.text = textView.attributedText
    }
    
    // 文字選択時のデリゲート
    public func textViewDidChangeSelection(_ textView: UITextView) {
        textView.layoutIfNeeded()
        guard let selectedRange = textView.selectedRange.toOptional(validIn: textView.text) else { return }
        let selectedText = self.checkRange(selectedRange: selectedRange, targetText: textView.text)
        DispatchQueue.main.async {
            self.parent.selectedText = selectedText
            self.parent.selection = selectedRange
        }
    }
    
    // 文字選択範囲を確認して、0だったらから文字を返す
    private func checkRange(selectedRange: NSRange, targetText: String) -> String {
        return selectedRange.length == 0 ? "" : (targetText as NSString).substring(with: selectedRange)
    }
}

extension NSRange {
    // 範囲外になっているかどうかを確認 (範囲外の場合、nil)
    func toOptional(validIn text: String) -> NSRange? {
        guard self.location != NSNotFound else { return nil }
        let nsString = text as NSString
        guard NSMaxRange(self) <= nsString.length else { return nil }
        return self
    }
}






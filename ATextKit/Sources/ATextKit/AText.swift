//
//  File.swift
//  ATextKit
//
//  Created by 野本瑛資 on 2025/11/15.
//

import SwiftUI

// AttributedStringを画像化したものをテキストとして表示するビュー
public struct AText: View {
    @Binding var textImage: UIImage
    var attributedText: NSAttributedString
    var verticalAlignment: VerticalTextAlignment
    
    public init(textImage: Binding<UIImage>, attributedText: NSAttributedString, verticalAlignment: VerticalTextAlignment) {
        self._textImage = textImage
        self.attributedText = attributedText
        self.verticalAlignment = verticalAlignment
    }
    
    public var body: some View {
        //　GeometryReaderでframeで指定したサイズを取得することで、サイズを引数で渡さなくてよくなる
        GeometryReader { geo in
            Image(uiImage: textImage)
                .resizable()
                .scaledToFit()
                .frame(width: geo.size.width, height: geo.size.height)
                .onChange(of: attributedText) {
                    updateTextImage(size: geo.size)
                }
                .onChange(of: verticalAlignment) {
                    updateTextImage(size: geo.size)
                }
                .onChange(of: geo.size) {
                    updateTextImage(size: geo.size)
                }
        }
    }
    
    // テキスト画像を更新
    private func updateTextImage(size: CGSize) {
        textImage = self.image(from: attributedText, size: size, verticalAlignment: verticalAlignment)
    }
    
    // 画像化して対応する (UItxetView単体だと画像切り取り時に余白がリセットされてしまうので、画像化してそれを防ぐ)
    func image(from attributedString: NSAttributedString, size: CGSize, verticalAlignment: VerticalTextAlignment) -> UIImage {
        // 0文字の時に画像を作ろうとするとRLEArrayの範囲外になって落ちるため、ここでガードする
        guard attributedString.length > 0 else { return UIImage() }
        // AttributedStringの描画領域を取得
        let textRect = self.getTextFrame(from: attributedString, size: size)

        // NSTextAlignmentから水平方向の余白を計算する
        let paragraphStyle = attributedString.attribute(.paragraphStyle, at: 0, effectiveRange: nil) as? NSParagraphStyle
        let alignment = paragraphStyle?.alignment ?? .left
        // 水平方向の余白
        let leftInset: CGFloat = self.calcLeftInset(from: textRect, size: size, alignment: alignment)
        // 垂直方向余白
        let topInset: CGFloat = self.calcTopInset(from: textRect, size: size, verticalAlignment: verticalAlignment)

        let renderer = UIGraphicsImageRenderer(size: size)
        return renderer.image { ctx in
            let origin = CGPoint(x: leftInset, y: topInset)
            let size = CGSize(width: textRect.width, height: textRect.height)
            let drawRect = CGRect(origin: origin, size: size)
            attributedString.draw(in: drawRect)
        }
    }
    
    // 文字の描画領域を取得
    private func getTextFrame(from attributedString: NSAttributedString, size: CGSize) -> CGRect {
        let textRect = attributedString.boundingRect(
            with: size,
            options: [.usesLineFragmentOrigin, .usesFontLeading],
            context: nil
        )
        return textRect
    }
    
    // 左の余白計算
    private func calcLeftInset(from textRect: CGRect, size: CGSize, alignment: NSTextAlignment) -> CGFloat {
        var leftInset: CGFloat = 0
        switch alignment {
            case .left, .natural, .justified:
                leftInset = ATextConfig.leftInset
            case .center:
                leftInset = (size.width - textRect.width) / 2
            case .right:
                // 余白分マイナス方向にずらす
                leftInset = (size.width - textRect.width) - ATextConfig.leftInset
            @unknown default:
                leftInset = ATextConfig.leftInset
        }
        return leftInset
    }
    
    // 上の余白計算
    private func calcTopInset(from textRect: CGRect, size: CGSize, verticalAlignment: VerticalTextAlignment) -> CGFloat {
        var topInset: CGFloat = 0
        switch verticalAlignment {
        case .top:
            topInset = ATextConfig.topInset
        case .centerY:
            topInset = (size.height - textRect.height) / 2
        case .bottom:
            topInset = size.height - textRect.height
        }
        return topInset
    }
}




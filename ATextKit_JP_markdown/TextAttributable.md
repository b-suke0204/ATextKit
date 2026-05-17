<span style="font-size:12pt">SwiftUI</span>

<span style="font-size:15pt">ATextKit</span>
# TextAttributable    

<span style="font-size:12pt">iOS 17.0+</span>  

## OverView  
任意の文字属性でNS(Mutable)AttributedStringを扱うためのプロトコル  
基本的にこのプロトコルは、このライブラリ以外で使うのを<span style="color:red">非推奨</span>とします  

```swift
public protocol TextAttributable
```

## Properties  

- var selectedText: String?  
    選択されたテキスト文字列  

- var selectedRange: NSRange  
    選択された文字範囲  

- var textColor: Color?  
    文字色  

- var fontWeight: UIFont.Weight?
    文字フォントの太さ  

- var fontSize: CGFloat  
    フォントサイズ   

- var backgroundColor: Color?  
    テキストビューの背景色  

- var strikethrougWidth: CGFloat?  
    打ち消し線の太さ  

- var strikethroughColor: Color?  
    打ち消し線の色  

- var shadowOffset: CGSize?  
    文字シャドウのオフセット  

- var shadowColor: Color?  
    文字シャドウの影色  

- var shadowBlur: CGFloat?  
    文字シャドウのぼやけ具合  

- var strokeWidth: CGFloat?  
    中抜け文字の太さ  

- var underlineWidth: CGFloat?  
    下線の太さ  

- var underlineColor: Color?  
    下線の色  

- var isItalic: Bool?  
    文字斜体フラグ  

- var kerningValue: CGFloat?  
    文字間隔の大きさ  

- var paragraphStyle: (alignment: NSTextAlignment, spacing: CGFloat)?  
    段落の揃え位置と余白を設定  

- var linkURL: URL?  
    文字リンクのURL  
    **SwiftUI環境下だと非対応**  

## Methods  

- func getKeys() -> [ATextKey]  
    文字属性のキーを取得  

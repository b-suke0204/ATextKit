<span style="font-size:12pt">SwiftUI</span>

<span style="font-size:15pt">ATextKit</span>
# ATextSelectionInfo  

<span style="font-size:12pt">iOS 17.0+</span>  

## OverView  
文字列に反映する文字属性を格納し、文字属性キーを取得するための構造体  

```swift
public struct ATextSelectionInfo: TextAttributable
```

## Initializer  

### 文字属性情報作成  

```swift
public init(selectedRange: NSRange, selectedText: String? = nil)
```

**Parameters**  
- selectedRange  
  選択している文字列の範囲  

- selectedText  
  選択している文字列  

## Properties  

### 文字属性情報  
- public var selectedText: String? = nil  
  選択されているテキスト文字列  

- public var selectedRange: NSRange  
  選択している文字列の範囲  

- public var textColor: Color? = nil  
  文字色  

- public var fontWeight: UIFont.Weight? = nil  
  文字のフォント  

- public var fontSize: CGFloat = 17  
  フォントサイズ  

- public var backgroundColor: Color? = nil  
  背景色  

- public var strikethrougWidth: CGFloat? = nil  
  打ち消し線の太さ  

- public var strikethroughColor: Color? = nil  
  打ち消し線の色  

- public var shadowOffset: CGSize? = nil  
  文字シャドウのオフセット(位置)  

- public var shadowColor: Color? = nil  
  文字シャドウの色  

- public var shadowBlur: CGFloat? = nil  
  文字シャドウのぼかし具合  

- public var strokeWidth: CGFloat? = nil  
  中抜け文字  

- public var underlineWidth: CGFloat? = nil  
  下線の太さ  

- public var underlineColor: Color? = nil  
  下線の色  

- public var isItalic: Bool? = nil  
  斜体  

- public var kerningValue: CGFloat? = nil  
  文字の間隔 (カーニング値)  

- public var paragraphStyle: (alignment: NSTextAlignment, spacing: CGFloat)? = nil  
  段落の設定  
  文字揃えと余白を設定できる (.center, 5)  

- public var linkURL: URL? = nil  
  文字リンク  
  SwiftUIでは、非対応  

## Method  

### 文字属性キー作成  
- public func getKeys() -> [ATextKey]  

```swift
public func getKeys() -> [ATextKey]
```

**Return Value**  
文字属性キー  


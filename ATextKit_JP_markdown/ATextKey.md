<span style="font-size:12pt">SwiftUI</span>

<span style="font-size:15pt">ATextKit</span>
# ATextKey  

<span style="font-size:12pt">iOS 17.0+</span>  

## OverView  
NS(Mutable)AttributedStringに適用する属性の種別を表すキー  
このキーを使うことで、文字につけたい属性を指定することができる  

```swift
public enum ATextKey
```

## Cases  

### 文字属性取得  
- case foregroundColor  
  文字色

- case backgroundColor  
  背景色

- case font  
  文字フォント

- case strikethroughStyle  
  文字の打ち消し線

- case strikethroughColor  
  打ち消し線の色

- case shadow  
  文字のシャドウ

- case strokeWidth  
  中抜き文字

- case underlineStyle  
  文字の下線

- case underlineColor  
  文字の下線色

- case italic  
  文字の斜体 (英語のみ有効)

- case kerning  
  文字の間隔

- case paragraphStyle  
  文字の段落スタイル

- case link  
  文字につけるリンク (SwiftUIでは非対応)

## Methods  

### 文字属性反映
- func setAttributes(from attributesInfo:attributedString:)

```swift
func setAttributes<A: TextAttributable>(from attributesInfo: A, attributedString: inout NSMutableAttributedString)
```

**Parameters**  
- attributesInfo  
  文字属性情報

- <span style="color:red">inout</span> attributedString  
  編集対象となる文字列  

  


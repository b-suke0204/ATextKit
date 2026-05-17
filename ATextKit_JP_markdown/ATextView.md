<span style="font-size:12pt">SwiftUI</span>

<span style="font-size:15pt">ATextKit</span>
# ATextView  

<span style="font-size:12pt">iOS 17.0+</span>  

## OverView  
テキスト入力用のビュー  
このビューを使うことで文字属性をつけられる文字列を入力することができるようになる  
UIKitのUITextViewを拡張したUIATextViewクラスを使用し、SwiftUI用のビューを作成  
<span style="font-size:10pt">注) UIATextViewを直接触るのは、非推奨</span>

```swift
public struct ATextView: UIViewRepresentable
```

## Initializer

```swift
public init(text: Binding<NSAttributedString>, selection: Binding<NSRange?> = .constant(nil), selectedText: Binding<String?> = .constant(nil), verticalAlignment: Binding<VerticalTextAlignment>)
```

**Parameters**  
- text  
  入力中の文字列  

- selection  
  文字列の選択範囲  
  ビュー更新で使用するため、Binding指定  

- selectedText  
  選択中の文字列  
  文字列選択時にこの値を使って属性指定する  

- verticalAlignment  
  垂直方向文字揃え  
  UITextViewのContentInsetを更新して位置調整するため、垂直方向のみenumを指定する  


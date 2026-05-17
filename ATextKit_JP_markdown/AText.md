<span style="font-size:12pt">SwiftUI</span>

<span style="font-size:15pt">ATextKit</span>  
# AText  

<span style="font-size:12pt">iOS 17.0+</span>  

## OverView  
ATextViewの入力欄をなくしたTextのビュー  
ATextViewだとImageRendererでビューをImage化することができないので、Image化したいときに使用  

```swift
public struct AText: View
```

## Initializer  

```swift
public init(textImage: Binding<UIImage>, attributedText: NSAttributedString, verticalAlignment: VerticalTextAlignment)
```

**Parameters**  
- textImage  
  ATextViewを画像化したUIImage  

- attributedText  
  入力した文字列

- verticalAlignment  
  垂直方向の文字揃え  
  垂直方向のみUITextViewのContentInsertを調整しているのでこのenumを渡す  





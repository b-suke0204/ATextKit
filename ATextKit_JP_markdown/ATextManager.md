<span style="font-size:12pt">SwiftUI</span>

<span style="font-size:15pt">ATextKit</span>
# ATextManager  

<span style="font-size:12pt">iOS 17.0+</span>  

## OverView  
NS(Mutable)AttributedStringに文字属性を反映させたり、文字属性のキーを作成する  

```Swift
open class ATextManager
```

## Initializer  

```swift
public init() {}
```

## Methods  

### createAttributeSetting(attributedKeys:attributesInfo:attributedString:)

文字に適用する文字属性を作成  

```swift
public func createAttributeSetting<A: TextAttributable>(attributedKeys: [ATextKey], attributesInfo: A, attributedString: inout NSMutableAttributedString)
```

#### Parameters
- attributedKeys  
  指定する文字属性のキー配列

- attributesInfo  
  文字属性情報

- <span style="color:red">inout</span> attributedString  
  編集中のNSMutableAttributedString文字列  

### updateAllTexts(_:attributedInfos:keys:make:)  

全文字列に属性を適用  

```swift
public func updateAllTexts<A:TextAttributable>(_ text: inout NSAttributedString, attributedInfos: inout [A], keys: [ATextKeyValue<A>], make: (NSRange, String?) -> A)
```

#### Parameters  
- text  
  編集中の文字列  

- attributedInfos  
  文字属性の情報  

- keys  
  変更したい文字属性のキー群  

- make
  文字属性情報作成用クロージャ  

### updateSelectedText(_:range:attributedInfos:keys:make:)  

選択された文字列に属性を適用  

```swift
public func updateSelectedText<A: TextAttributable>(_ text: inout NSAttributedString, range: NSRange, attributedInfos: inout [A], keys: [ATextKeyValue<A>], make: (NSRange, String?) -> A)
```

#### Parameters  
- text  
  編集中の文字列  

- range  
  文字の選択範囲

- attributedInfos
  文字属性の情報  

- keys  
  変更したい文字属性のキー群  

- make
  文字属性情報作成用クロージャ  

### createTextKeys(make:) -> [ATextKeyValue<ATextSelectionInfo>]  

文字に適用する属性キー一覧を作成  

```swift
public func createTextKeys(make: () -> [ATextKeyValue<ATextSelectionInfo>]) -> [ATextKeyValue<ATextSelectionInfo>]
```

#### Parameters  
- make
  文字属性用のキー作成用クロージャ

#### Return Value  
文字属性のキー情報  
このキーを元に任意の文字列の属性を変更する  

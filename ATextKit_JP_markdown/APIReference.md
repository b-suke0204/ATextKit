<span style="font-size:12pt">SwiftUI</span>
# ATextKit API Reference    

<span style="font-size:12pt">iOS 17.0+</span>  

## Views  

```swift
public struct AText: View
```

```swift
public struct ATextView: UIViewRepresentable
```

## Protocols  

```swift
public protocol TextAttributable
```

## Class  

```swift
open class ATextManager
```

```swift
public init()
```

### Methods  

```swift
public func createAttributeSetting<A: TextAttributable>(attributedKeys: [ATextKey], attributesInfo: A, attributedString: inout NSMutableAttributedString)
```

```swift
public func updateAllTexts<A:TextAttributable>(_ text: inout NSAttributedString, attributedInfos: inout [A], keys: [ATextKeyValue<A>], make: (NSRange, String?) -> A)
```

```swift
public func updateSelectedText<A: TextAttributable>(_ text: inout NSAttributedString, range: NSRange, attributedInfos: inout [A], keys: [ATextKeyValue<A>], make: (NSRange, String?) -> A)
```

```swift
public func createTextKeys(make: () -> [ATextKeyValue<ATextSelectionInfo>]) -> [ATextKeyValue<ATextSelectionInfo>]
```

## Enum  

### ATextKey  
文字属性のキー情報

```swift
public enum ATextKey
```

### Methods  

```swift
func setAttributes<A: TextAttributable>(from attributesInfo: A, attributedString: inout NSMutableAttributedString)
```

## Struct  

### ATextSelectionInfo  
選択された文字列の情報  

```swift
public struct ATextSelectionInfo: TextAttributable
```

```swift
public init(selectedRange: NSRange, selectedText: String? = nil)
```

## Topics  

- ### AText
    <a href="./AText.md" target="_blank">AText</a>  

- ### ATextView
    <a href="./ATextView.md" target="_blank">ATextView</a>  

- ### TextAttributable  
    <a href="./TextAttributable.md" target="_blank">TextAttributable</a>  

- ### ATextManager
    <a href="./ATextManager.md" target="_blank">ATextManager</a>  

- ### ATextKey
    <a href="./ATextKey.md" target="_blank">ATextKey</a>  

- ### ATextSelectionInfo
    <a href="./ATextSelectionInfo.md" target="_blank">ATextSelectionInfo</a>  


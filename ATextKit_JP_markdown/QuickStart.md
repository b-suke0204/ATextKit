<span style="font-size:12pt">SwiftUI</span>
# ATextKit QuickStart  

<span style="font-size:12pt">iOS 17.0+</span>  

## 導入方法  
このUIライブラリを使用する場合、SPM (Swift Package Manager)の導入方法によりフレームワークとして追加します  

**Step1.** プロジェクト直下にFrameWorkフォルダを作成 (フォルダ名はどのような名前でも可)  

**Step2.** ATextKitのパッケージフォルダをStep1で作成したフォルダに追加  

**Step3.** プロジェクトのTARGETS内のGeneralの項目に移動  

**Step4.** Frameworks, Libraries, and Embedded Content欄の+ボタンをクリックし、ATextKitを選択  

**Step5.** Addをクリック  

**Step6.** ATextKitがFrameworks, Libraries, and Embedded Content欄に追加されていれば、設定完了  

## ATextの作成  

SwiftUIのImageRendererでATextViewを切り取りたい場合に使用  

```swift
struct RichText: View {
    @StateObject var appState: AppState = AppState()
    var body: some View {
        AText(
            textImage: $appState.textImage,
            attributedText: appState.attributedText,
            verticalAlignment: appState.verticalAlignment
        )
        .border(.black)
        .frame(width: 400, height: 300)
        .padding()
    }
}
```

## ATextViewの作成  

属性文字を使うことができる入力欄  

```swift
struct RichTextView: View {
    @StateObject var appState: AppState = AppState()
    var body: some View {
        ATextView(text: $appState.attributedText, verticalAlignment: $appState.verticalAlignment)
            .border(.black)
            .frame(width: 400, height: 300)
            .padding()
    }
}
```

## 文字属性の変更  

ATextManagerクラスをインスタンス化して呼び出し、変更したい文字属性のキーを作成後、文字更新処理を実行することで指定した文字属性を反映できる  

```swift
struct BoldButton: View {
    @ObservedObject var appState: AppState
    private let aTextManager: ATextManager = ATextManager()
    var body: some View {
        Button(action: {
            bold()
        }) {
            Text("Bold")
        }
    }

    private func bold() {
        let boldKey = aTextManager.createTextKeys(make: {
            [.fontWeight(.bold)]
        })
        aTextManager.updateAllTexts(
            &appState.attributedText,
            attributedInfos: &appState.selectedTextInfo,
            keys: keys2,
            make: { range, _ in
                ATextSelectionInfo(selectedRange: range)
            }
        )
    }
}
```


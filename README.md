# EllipsisLabel

Label with custom ellipsis when text is too long.

# How to install

### CocoaPods

```
pod 'EllipsisLabel', '~> 1.0.1'
```

### SPM

- Package.swift 的 dependencies 增加

```
.package(name: "EllipsisLabel", url: "https://github.com/coollazy/EllipsisLabel", .upToNextMajor(from: "1.0.1")),
```

- target 的 dependencies 增加

```
.product(name: "EllipsisLabel", package: "EllipsisLabel"),
```

# How to use

### 自定義省略詞的文字及顏色

```
let label = EllipsisLabel()
label.ellipsis = "...MORE"
label.ellipsisColor = .blue
```

### 自定義省略詞使用 AttributedString

```
let label = EllipsisLabel()
let ellipsis = NSMutableAttributedString(string: "...MORE")
ellipsis.addAttribute(.font, value: UIFont.systemFont(ofSize: 17), range: .init(location: 0, length: ellipsis.length))
ellipsis.addAttribute(.foregroundColor, value: UIColor.green, range: .init(location: 0, length: 3))
ellipsis.addAttribute(.foregroundColor, value: UIColor.purple, range: .init(location: 3, length: 4))
label.attributedEllipsis = ellipsis
```

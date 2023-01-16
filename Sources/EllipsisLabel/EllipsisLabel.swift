import UIKit

public class EllipsisLabel: UILabel {
    public var attributedEllipsis: NSAttributedString?
    
    public var ellipsis: String?
    public var ellipsisColor: UIColor?
    public var ellipsisFont: UIFont?
    
    private var originalText: String?
    
    public override var text: String? {
        didSet {
            originalText = text
        }
    }
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        layoutEllipsis()
    }
    
    private func layoutEllipsis() {
        if ellipsis != nil || attributedEllipsis != nil {
            drawEllipsis()
        }
    }
    
    private func isNeedTruncate() -> Bool {
        guard numberOfLines > 0 else {
            return false
        }
        guard let text = originalText else {
            return false
        }
        guard let font = font else {
            return false
        }
        
        let fitSize = CGSize(width: bounds.width,
                             height: font.lineHeight * CGFloat(numberOfLines))
        
        return text.isFitSize(fitSize, font: font) == false
    }
    
    private func drawEllipsis() {
        guard let font = font else {
            print("[ERROR] Set ellipsis without font")
            return
        }
        guard isNeedTruncate() else {
            super.text = originalText
            return
        }
        
        guard let text = attributedOriginalText else {
            return
        }
        let ellipsis = attributedEllipsisText ?? NSAttributedString(string: "")
        
        let fitSize = CGSize(width: bounds.width,
                             height: font.lineHeight * CGFloat(numberOfLines))

        var truncatedText = text.truncated(fitSize, ellipsis: ellipsis)
        var finalText = truncatedText + ellipsis
        
        // 使用 Attributed String 需要修正最後的誤差
        while finalText.isFitSize(fitSize) == false {
            truncatedText = truncatedText.subString(length: truncatedText.length - 1)
            finalText = truncatedText + ellipsis
        }

        super.attributedText = finalText
    }
}

extension EllipsisLabel {
    private var attributedOriginalText: NSAttributedString? {
        guard let originalText = originalText else {
            return nil
        }
        guard let font = font else {
            return nil
        }
        guard let textColor = textColor else {
            return nil
        }
        return NSAttributedString(string: originalText, attributes: [.font: font, .foregroundColor: textColor])
    }
    
    private var attributedEllipsisText: NSAttributedString? {
        if let attributedEllipsis = attributedEllipsis {
            return attributedEllipsis
        }
        else if let ellipsis = ellipsis {
            let ellipsisFont = self.ellipsisFont ?? font ?? UIFont()
            let ellipsisAttributedString = NSAttributedString(string: ellipsis,
                                                              attributes: [
                                                                .font: ellipsisFont,
                                                                .foregroundColor: ellipsisColor ?? textColor ?? .systemBlue
                                                              ])
            return ellipsisAttributedString
        }
        else {
            return nil
        }
    }
}

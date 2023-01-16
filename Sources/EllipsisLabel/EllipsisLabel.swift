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
        
        let maxWidth = bounds.width
        let maxHeight = font.lineHeight * CGFloat(numberOfLines)
        return text.isFitSize(.init(width: maxWidth, height: maxHeight), font: font) == false
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
        
        let maxWidth = bounds.width
        let maxHeight = font.lineHeight * CGFloat(numberOfLines)
        let fitSize: CGSize = .init(width: maxWidth, height: maxHeight)
        
        guard let text = attributedOriginalText else {
            return
        }
        let ellipsis = attributedEllipsisText ?? NSAttributedString(string: "")

        var truncatedText = text.truncated(fitSize, ellipsis: ellipsis)
        var finalText = truncatedText + ellipsis
        
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
            let ellipsisFont = ellipsisFont ?? font ?? UIFont()
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

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
            layoutEllipsis()
        }
    }
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        layoutEllipsis()
    }
    
    public override func updateConstraints() {
        super.updateConstraints()
        layoutEllipsis()
    }
    
    private func layoutEllipsis() {
        if let ellipsis = ellipsis {
            setEllipsis(ellipsis)
        }
        else if let ellipsis = attributedEllipsis?.string {
            setEllipsis(ellipsis)
        }
    }
    
    private func isNeedTruncate(maximumWidth: Float? = nil) -> Bool {
        guard numberOfLines > 1 else {
            return false
        }
        guard let text = originalText else {
            return false
        }
        guard let font = font else {
            return false
        }
        
        let maxWidth = maximumWidth ?? Float(bounds.width)
        
        let texts = text
            .split(separator: "\n", omittingEmptySubsequences: false)
            .map({ String($0) })
        
        let textLines = text
            .splitToLines(withFont: font, maximumWidth: maxWidth)
        
        return numberOfLines < textLines.count
    }
    
    private func setEllipsis(_ ellipsis: String, maximumWidth: Float? = nil) {
        guard let labelText = originalText else {
            print("[ERROR] Set ellipsis without text")
            return
        }
        guard let font = font else {
            print("[ERROR] Set ellipsis without font")
            return
        }
        guard isNeedTruncate(maximumWidth: maximumWidth) else {
            super.text = labelText
            return
        }
        
        let maxWidth = maximumWidth ?? Float(bounds.width)
        
        var labelTexts = labelText.splitToLines(withFont: font, maximumWidth: maxWidth)
        labelTexts.removeSubrange(numberOfLines ..< labelTexts.count)
        
        guard let lastLineText = labelTexts.last else {
            return
        }
        
        // 若有使用 attributedEllipsis 則優先使用 attributedEllipsis 的 font 去算出 ellipsisWidth
        let ellipsisFont = (attributedEllipsis?.attributes(at: 0, effectiveRange: nil)[.font] as? UIFont) ?? ellipsisFont ?? font
        let ellipsisWidth = ellipsis.size(withFont: ellipsisFont).width
        
        let truncatedIndex = lastLineText.truncatedIndex(withFont: font, maximumWidth: maxWidth - Float(ellipsisWidth))
        let truncatedLastLineText = lastLineText.subString(to: truncatedIndex)
        
        labelTexts.removeLast()
        
        let beginText = labelTexts.joined(separator: "\n")
        
        let attributedString = NSMutableAttributedString(string: beginText,
                                                         attributes: [
                                                            .font: font,
                                                            .foregroundColor: textColor ?? .systemBlue
                                                         ])
        
        let truncatedLastLineAttributedString = NSMutableAttributedString(string: truncatedLastLineText,
                                                                          attributes: [
                                                                            .font: font,
                                                                            .foregroundColor: textColor ?? .systemBlue
                                                                          ])
        
        attributedString.append(NSAttributedString(string: "\n"))
        attributedString.append(truncatedLastLineAttributedString)
        
        if let attributedEllipsis = attributedEllipsis {
            attributedString.append(attributedEllipsis)
        }
        else {
            let ellipsisAttributedString = NSMutableAttributedString(string: ellipsis,
                                                                     attributes: [
                                                                        .font: ellipsisFont,
                                                                        .foregroundColor: ellipsisColor ?? textColor ?? .systemBlue
                                                                     ])
            attributedString.append(ellipsisAttributedString)
        }
        
        self.attributedText = attributedString
    }
}

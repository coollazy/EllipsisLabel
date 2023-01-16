import UIKit

extension NSAttributedString {
    var font: UIFont? {
        attributes(at: 0, effectiveRange: nil)[.font] as? UIFont
    }
    
    func isFitSize(_ fitSize: CGSize) -> Bool {
        let currentSize = self.boundingRect(with: CGSize(width: fitSize.width, height: CGFloat.greatestFiniteMagnitude),
                                            options: .usesLineFragmentOrigin,
                                            context: nil)
        return currentSize.height <= fitSize.height
    }
}

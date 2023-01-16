import UIKit

extension NSAttributedString {
    func truncated(_ fitSize: CGSize, ellipsis: NSAttributedString = NSAttributedString(string: ""), original: NSAttributedString? = nil, cutLength: Int? = nil) -> NSAttributedString {
        let original: NSAttributedString = original ?? self
        var cutLength = (cutLength ?? original.length)
        guard original.isFitSize(fitSize) == false else {
            return self
        }
        
        let finalText = NSMutableAttributedString()
        finalText.append(self)
        finalText.append(ellipsis)
        
        if abs(cutLength) == 1, finalText.isFitSize(fitSize) {
            let oneMoreText = original.attributedSubstring(from: .init(location: 0, length: length + 1))
            let oneMoreWithEllipsisText = NSMutableAttributedString()
            oneMoreWithEllipsisText.append(oneMoreText)
            oneMoreWithEllipsisText.append(ellipsis)
            
            if oneMoreWithEllipsisText.isFitSize(fitSize) == false {
                return self
            }
        }
        else {
            cutLength = cutLength / 2
        }
        
        
        let subString = original.attributedSubstring(from: .init(location: 0, length: length - cutLength))
        
        let subWithEllipsisString = NSMutableAttributedString()
        subWithEllipsisString.append(subString)
        subWithEllipsisString.append(ellipsis)
        
        if subWithEllipsisString.isFitSize(fitSize) {
            return subString.truncated(fitSize, ellipsis: ellipsis, original: original, cutLength: -abs(cutLength))
        }
        else {
            return subString.truncated(fitSize, ellipsis: ellipsis, original: original, cutLength: abs(cutLength))
        }
    }
}

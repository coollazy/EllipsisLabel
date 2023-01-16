import UIKit

extension NSAttributedString {
    func truncated(_ fitSize: CGSize,
                   ellipsis: NSAttributedString = NSAttributedString(string: ""),
                   original: NSAttributedString? = nil,
                   cutLength: Int? = nil) -> NSAttributedString {
        
        let original: NSAttributedString = original ?? self
        var cutLength = (cutLength ?? original.length)
        
        guard original.isFitSize(fitSize) == false else {
            return self
        }
        
        let finalText = self + ellipsis
        if abs(cutLength) == 1 {
            if finalText.isFitSize(fitSize) {
                let oneMoreWithEllipsisText = original.subString(length: length + 1) + ellipsis
                if oneMoreWithEllipsisText.isFitSize(fitSize) == false {
                    return self
                }
            }
            else {
                let oneLessWithEllipsisText = original.subString(length: length - 1) + ellipsis
                if oneLessWithEllipsisText.isFitSize(fitSize) {
                    return self
                }
            }
        }
        else {
            cutLength = cutLength / 2
        }
        
        let subString = original.subString(length: length - cutLength)
        
        if (subString + ellipsis).isFitSize(fitSize) {
            return subString.truncated(fitSize, ellipsis: ellipsis, original: original, cutLength: -abs(cutLength))
        }
        else {
            return subString.truncated(fitSize, ellipsis: ellipsis, original: original, cutLength: abs(cutLength))
        }
    }
}

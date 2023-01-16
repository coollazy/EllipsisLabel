import UIKit

extension String {
     func truncated(_ fitSize: CGSize, font: UIFont, ellipsis: String = "", original: String? = nil, cutLength: Int? = nil) -> String {
        let original: String = original ?? self
        var cutLength = (cutLength ?? original.count)
        guard original.isFitSize(fitSize, font: font) == false else {
            return self
        }
        
        let finalText = self + ellipsis
        if abs(cutLength) == 1 {
            if finalText.isFitSize(fitSize, font: font) {
                let oneMoreText = original.subString(length: count + 1) + ellipsis
                if oneMoreText.isFitSize(fitSize, font: font) == false {
                    return self
                }
            }
            else {
                let oneLessText = original.subString(length: count - 1) + ellipsis
                if oneLessText.isFitSize(fitSize, font: font) {
                    return self
                }
            }
        }
        else {
            cutLength = cutLength / 2
        }
         
        let subString = original.subString(length: count - cutLength)
        
        if (subString + ellipsis).isFitSize(fitSize, font: font) {
            return subString.truncated(fitSize, font: font, ellipsis: ellipsis, original: original, cutLength: -abs(cutLength))
        }
        else {
            return subString.truncated(fitSize, font: font, ellipsis: ellipsis, original: original, cutLength: abs(cutLength))
        }
    }
}

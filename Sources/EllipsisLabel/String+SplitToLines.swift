import UIKit

extension String {
    func size(withFont font: UIFont) -> CGSize {
        size(withAttributes: [NSAttributedString.Key.font: font])
    }
    
    func splitToLines(withFont: UIFont, maximumWidth: Float) -> [String] {
        split(separator: "\n", omittingEmptySubsequences: false)
            .map({ String($0) })
            .map({ $0.split(withFont: withFont, maximumWidth: maximumWidth) })
            .reduce([], { $0 + $1 })
    }
    
    private func split(withFont: UIFont, maximumWidth: Float) -> [String] {
        var texts = [String]()
        let truncatedIndex = truncatedIndex(withFont: withFont, maximumWidth: maximumWidth)
        let text = subString(length: truncatedIndex)
        texts.append(text)
        
        if count > text.count {
            let remainString = subString(from: truncatedIndex, to: count)
            return texts + remainString.split(withFont: withFont, maximumWidth: maximumWidth)
        }
        return texts
    }
    
    func truncatedIndex(withFont: UIFont, maximumWidth: Float) -> Int {
        var text = self
        var offset = 0
        while text.size(withFont: withFont).width > CGFloat(maximumWidth) {
            offset += 1
            text = text.subString(length: text.count - 1)
        }
        return count - offset
    }
}

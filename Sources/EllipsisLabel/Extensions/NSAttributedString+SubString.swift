import Foundation

extension NSAttributedString {
    func subString(from: Int = 0, length: Int) -> NSAttributedString {
        attributedSubstring(from: .init(location: from, length: length))
    }
}

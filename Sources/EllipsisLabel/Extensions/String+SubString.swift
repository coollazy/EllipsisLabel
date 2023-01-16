import Foundation

extension String {
    func subString(from: Int = 0, length: Int) -> String {
        let fromIndex = index(startIndex, offsetBy: from)
        let toIndex = index(fromIndex, offsetBy: length)
        return String(self[fromIndex..<toIndex])
    }
}

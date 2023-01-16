import Foundation

extension NSAttributedString {
    static func +(lhs: NSAttributedString, rhs: NSAttributedString) -> NSAttributedString {
        let res = NSMutableAttributedString()
        res.append(lhs)
        res.append(rhs)
        return res
    }
}

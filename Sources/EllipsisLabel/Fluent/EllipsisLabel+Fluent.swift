import UIKit

extension EllipsisLabel {
    @discardableResult
    public func setEllipsis(_ ellipsis: String) -> Self {
        self.ellipsis = ellipsis
        return self
    }
    
    @discardableResult
    public func setEllipsisColor(_ ellipsisColor: UIColor) -> Self {
        self.ellipsisColor = ellipsisColor
        return self
    }
    
    @discardableResult
    public func setEllipsisFont(_ ellipsisFont: UIFont) -> Self {
        self.ellipsisFont = ellipsisFont
        return self
    }
    
    @discardableResult
    public func setAttributedEllipsis(_ attributedEllipsis: NSAttributedString) -> Self {
        self.attributedEllipsis = attributedEllipsis
        return self
    }
}

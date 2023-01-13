import UIKit

extension String {
    func isFitSize(_ fitSize: CGSize, font: UIFont) -> Bool {
        let currentSize = self.boundingRect(with: CGSize(width: fitSize.width, height: CGFloat.greatestFiniteMagnitude),
                                    options: .usesLineFragmentOrigin,
                                    attributes: [.font: font,],
                                    context: nil)
        return currentSize.height < fitSize.height
    }
}

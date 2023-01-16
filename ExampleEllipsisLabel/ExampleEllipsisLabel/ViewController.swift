//
//  ViewController.swift
//  ExampleEllipsisLabel
//
//  Created by User on 2023/1/13.
//

import UIKit
import EllipsisLabel

class ViewController: UIViewController {
    @IBOutlet weak var widthTextField: UITextField!
    @IBOutlet weak var label: EllipsisLabel!
    @IBOutlet weak var labelWidthContstraint: NSLayoutConstraint!
    
    let text1 = "kakakamallalakalalallalakakakananbabababahabajhahahahahabahahhsbshahahahahhahagagq從那次噗噗噗噗噗噗我kakakamallalakalalallalakakakananbabababahabajhahahahahabahahhsbshahahahahhahagagqkakakamallalakalalallalaka"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        label.font = .systemFont(ofSize: 17)
        label.textColor = .darkGray
        label.numberOfLines = 5
        label.text = text1
        
        // 省略詞同一個顏色
        label.ellipsis = "...全文"
        label.ellipsisColor = .blue
        
        // 省略詞不同顏色
        let more = NSMutableAttributedString(string: "...MORE")
        more.addAttribute(.font, value: UIFont.systemFont(ofSize: 17), range: .init(location: 0, length: more.length))
        more.addAttribute(.foregroundColor, value: UIColor.green, range: .init(location: 0, length: 3))
        more.addAttribute(.foregroundColor, value: UIColor.purple, range: .init(location: 3, length: 4))
        label.attributedEllipsis = more
    }

    @IBAction func onButtonClickedHandler(_ sender: Any) {
        if let text = widthTextField.text, let width = NumberFormatter().number(from: text) {
            labelWidthContstraint.constant = CGFloat(truncating: width)
        }
    }
}


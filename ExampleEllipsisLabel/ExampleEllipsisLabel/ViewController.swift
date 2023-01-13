//
//  ViewController.swift
//  ExampleEllipsisLabel
//
//  Created by User on 2023/1/13.
//

import UIKit
import EllipsisLabel

class ViewController: UIViewController {
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var widthTextField: UITextField!
    @IBOutlet weak var fontSizeTextField: UITextField!
    @IBOutlet weak var ellipsisTextField: UITextField!
    @IBOutlet weak var numberOfLineTextField: UITextField!
    @IBOutlet weak var label: EllipsisLabel!
    @IBOutlet weak var labelWidthContstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let text1 = "cnddksskdcnckfkksmdncnckkcckndnfncckckkccmcncmmckckckfkdcmckckkckcncmdksldkckcmmcmcnvmcmckcmcmfmcmckckckmcmcmcmwwmxmckkvfmemfmkckvkfmdnfkkckvkfmdmfkvlvkvkcmdmvkvkkcmcmcmcmvmmcmckckdmdmmcvkkvkckckckcmc"
        label.font = .systemFont(ofSize: 17)
        label.textColor = .darkGray
        label.numberOfLines = 5
        label.text = text1
        label.ellipsis = "...全文"
        label.ellipsisColor = .blue
    }

    @IBAction func onButtonClickedHandler(_ sender: Any) {
        if let text = textView.text {
            label.text = text
        }
        if let text = widthTextField.text, let width = NumberFormatter().number(from: text) {
            labelWidthContstraint.constant = CGFloat(truncating: width)
        }
        if let text = fontSizeTextField.text, let width = NumberFormatter().number(from: text) {
            label.font = .systemFont(ofSize: CGFloat(truncating: width))
        }
        if let text = ellipsisTextField.text {
            label.ellipsis = text
        }
        if let text = numberOfLineTextField.text, let number = NumberFormatter().number(from: text) {
            label.numberOfLines = Int(truncating: number)
        }
    }
}


//
//  ViewController.swift
//  ExampleEllipsisLabel
//
//  Created by User on 2023/1/13.
//

import UIKit
import EllipsisLabel

class ViewController: UIViewController {
    @IBOutlet weak var label: EllipsisLabel!
    
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


}


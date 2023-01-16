//
//  TableViewController.swift
//  ExampleEllipsisLabel
//
//  Created by User on 2023/1/13.
//

import UIKit

class TableViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    let items = [
        "c\n\n\n\n\n\n\n\n",
        "c\nc",
        "cnddksskdcnckfkksmdncnckkcckndnfncckckkccmcncmmckckckfkdcmckckkckcncmdksldkckcmmcmcnvmcmckcmcmfmcmckckckmcmcmcmwwmxmckkvfmemfmkckvkfmdnfkkckvkfmdmfkvlvkvkcmdmvkvkkcmcmcmcmvmmcmckckdmdmmcvkkvkckckckcmc",
        "TtSffcjjj\njjhh\nhgg",
        "TEST",
        "22eeee",
        "aaa",
        "dfh",
        "hhh",
        "TEST",
        "aaaagggg",
        "一張圖",
        "c\n\n\n\n\n\n\n\n",
        "c\nc",
        "cnddksskdcnckfkksmdncnckkcckndnfncckckkccmcncmmckckckfkdcmckckkckcncmdksldkckcmmcmcnvmcmckcmcmfmcmckckckmcmcmcmwwmxmckkvfmemfmkckvkfmdnfkkckvkfmdmfkvlvkvkcmdmvkvkkcmcmcmcmvmmcmckckdmdmmcvkkvkckckckcmc",
        "TtSffcjjj\njjhh\nhgg",
        "TEST",
        "22eeee",
        "aaa",
        "dfh",
        "hhh",
        "TEST",
        "aaaagggg",
        "一張圖",
        "c\n\n\n\n\n\n\n\n",
        "c\nc",
        "cnddksskdcnckfkksmdncnckkcckndnfncckckkccmcncmmckckckfkdcmckckkckcncmdksldkckcmmcmcnvmcmckcmcmfmcmckckckmcmcmcmwwmxmckkvfmemfmkckvkfmdnfkkckvkfmdmfkvlvkvkcmdmvkvkkcmcmcmcmvmmcmckckdmdmmcvkkvkckckckcmc",
        "TtSffcjjj\njjhh\nhgg",
        "kakakamallalakalalallalakakakananbabababahabajhahahahahabahahhsbshahahahahhahagagq從那次噗噗噗噗噗噗我kakakamallalakalalallalakakakananbabababahabajhahahahahabahahhsbshahahahahhahagagqkakakamallalakalalallalaka@",
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(.init(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "TableViewCell")
        tableView.dataSource = self
        tableView.delegate = self
    }
}

extension TableViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as! TableViewCell
        cell.label.text = items[indexPath.row]
        return cell
    }
}

extension TableViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        130
    }
}

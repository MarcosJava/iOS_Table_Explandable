//
//  ViewController.swift
//  Expandable-TableView
//
//  Created by Marcos Felipe Souza Pinto on 06/12/2017.
//  Copyright © 2017 Marcos Felipe Souza Pinto. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    let imgs = ["0", "1", "2", "0", "1", "2", "0", "1", "2", "0", "1", "2", "0", "1", "2", "0", "1", "2", "0", "1", "2"]
    var expandedRows = Set<Int>()
    let cellIdentifier = "cell"
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.rowHeight = UITableViewAutomaticDimension
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {        
        let cell:ExpandableCell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! ExpandableCell
        cell.img.image = UIImage(named: imgs[indexPath.row])
        switch imgs[indexPath.row] {
        case "0":
            cell.txtLabel.text = "Aqui contem Superman"
        case "1":
            cell.txtLabel.text = "Aqui contem Hulk"
        case "2":
            cell.txtLabel.text = "Aqui contem Flash"
        default:
            cell.txtLabel.text = ""
        }        
        cell.isExpanded = self.expandedRows.contains(indexPath.row)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.tableView.beginUpdates()
        print(indexPath.row.description)
        guard let cell = tableView.cellForRow(at: indexPath) as? ExpandableCell else {return}
        
        if cell.isExpanded {
            self.expandedRows.remove(indexPath.row)
        } else {
            self.expandedRows.insert(indexPath.row)
        }
        cell.isExpanded = !cell.isExpanded
        self.tableView.endUpdates()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 144.0
    }


}


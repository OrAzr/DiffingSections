//
//  ViewController.swift
//  DiffingWithDiffer
//
//  Created by Or on 1/24/19.
//  Copyright © 2019 BankHapoalim. All rights reserved.
//

import UIKit
import Differ

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var currentCounter = 10
    var topSection:BaseSection<TopItem>?
    var bottomSection:BaseSection<BottomItem>?
    
    @IBOutlet weak var table: UITableView!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.generateData()
        self.table.delegate = self
        self.table.dataSource = self
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let oldItems = [topSection!]
        self.generateData()
        let newItems = [topSection!]
        
        self.table.animateRowAndSectionChanges(oldData: oldItems, newData: newItems, rowDeletionAnimation: .right, rowInsertionAnimation: .left )
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 { return self.topSection?.count ?? 0}
        if section == 1{ return self.bottomSection?.count ?? 0}
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        
        if indexPath.section == 0 {
            cell.textLabel?.text = self.topSection?[indexPath.row].text
        }
        if indexPath.section == 1 {
            cell.textLabel?.text = self.bottomSection?[indexPath.row].text
        }
        return cell
    }
    
    
    func generateData(){
        self.topSection = self.generateSection(sectionKey: SectionKey.top, numberOfItems: currentCounter)
        self.bottomSection = self.generateSection(sectionKey: SectionKey.bottom, numberOfItems: 30)
        currentCounter += 10
    }
    
    
    func generateSection<T:BaseItem>(sectionKey:SectionKey, numberOfItems:Int) -> BaseSection<T>?{
        var topItems = [T]()
        for i in 0..<numberOfItems {
            let item:T = T(with: i % 2 == 0 ? "similar" : String.random(length: i))
            topItems.append(item)
        }
        return BaseSection<T>(with: topItems, sectionKey: sectionKey.rawValue)
    }
}

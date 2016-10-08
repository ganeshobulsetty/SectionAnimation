//
//  ViewController.swift
//  SectionAnimation
//
//  Created by Kanwar Zorawar Singh Rana on 10/2/16.
//  Copyright © 2016 Kanwar Zorawar Singh Rana. All rights reserved.
//

import UIKit

class ViewController: UITableViewController{

    
    @IBOutlet weak var headerView: TableSectionHeader!
    var isHeaderExpanded = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let nib = UINib(nibName: "TableSectionHeader", bundle: nil)
        tableView.register(nib, forHeaderFooterViewReuseIdentifier: "TableSectionHeader")
        
        // NSTimer.scheduledTimerWithTimeInterval(5, target: self, selector:  #selector(ViewController.collapseOrExpandSectionHeader), userInfo: nil, repeats: false)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 15
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell: UITableViewCell!
        cell = tableView.dequeueReusableCell(withIdentifier: "cell2", for: indexPath)
            cell.textLabel?.text = String(format: "At Index %d",indexPath.row as Int)
        return cell
    }
    
     override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat{
        return 44;
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        // Dequeue with the reuse identifier
        let cell = self.tableView.dequeueReusableHeaderFooterView(withIdentifier: "TableSectionHeader")
        let header = cell as! TableSectionHeader
        self.headerView = header
        return cell
    }
 
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        var value = 0 as CGFloat
        
        if ((self.headerView ) != nil){
            value = self.headerView.frame.size.height as CGFloat
        }
        else{
            value = 100
        }
        return value
    }
 
    
    override func scrollViewDidScroll(_ scrollView: UIScrollView){
        
        let scrollOffset = scrollView.contentOffset.y
        
        if ((self.headerView ) != nil){
            if(scrollOffset > 100){
                self.collapseSectionHeader(true)
            }
            else{
                self.collapseSectionHeader(false)
            }
        }
    }
    

    func collapseSectionHeader( _ collapsed: Bool) {
        self.tableView?.beginUpdates()
        if (collapsed && self.headerView.frame.size.height > 50){
            self.headerView.frame.size.height -= 2
            self.headerView.width.constant -= 2
            self.headerView.trailing.constant+=3
            
        }
        else if (!collapsed && self.headerView.frame.size.height < 100 ){
            self.headerView.frame.size.height += 2
            self.headerView.width.constant += 2
            self.headerView.trailing.constant-=3
        }
        self.tableView?.endUpdates()
    }

}

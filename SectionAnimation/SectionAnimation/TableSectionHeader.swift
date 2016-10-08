//
//  MenuDetailHeader.swift
//  SectionAnimation
//
//  Created by Kanwar Zorawar Singh Rana on 10/2/16.
//  Copyright © 2016 Kanwar Zorawar Singh Rana. All rights reserved.
//

import UIKit

class TableSectionHeader: UITableViewHeaderFooterView {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet var width: NSLayoutConstraint!
    @IBOutlet var trailing: NSLayoutConstraint!

    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */
    
    override func awakeFromNib() {
        
    }
    
    func collapseHeader() {
        
    }
    
    func expandHeader() {
        

    }

}

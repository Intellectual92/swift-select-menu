//
//  NextViewController.swift
//  DropDown
//
//  Created by 지성인 on 2020/02/01.
//  Copyright © 2020 SHUBHAM AGARWAL. All rights reserved.
//

import UIKit

class NextViewController: UIViewController {

    @IBOutlet weak var localCode: UILabel!
    @IBOutlet weak var orgCode: UILabel!
    @IBOutlet weak var localURL: UILabel!
    
    var orgCodeName = ""
    var localName = ""
    var localURLName = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        localCode.text = localName
        localURL.text = localURLName
        orgCode.text = orgCodeName
    }
}

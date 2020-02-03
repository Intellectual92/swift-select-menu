//
//  ViewController.swift
//  DropDown
//
//  Created by 지성인 on 2020/02/01.
//  Copyright © 2020 SHUBHAM AGARWAL. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var btnDrop: UIButton!
    @IBOutlet weak var tblView: UITableView!
    @IBOutlet weak var btnSave: UIButton!
    @IBOutlet weak var orgCode: UITextField!
    
    var localList = ["AU", "KR", "UK"]
    var localURLList = ["https://www.naver.com", "https://www.google.com", "https://www.daum.com"]
    var localText = "AU"
    var localURL = "https://www.naver.com"
    var orgText = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tblView.isHidden = true
        dropdownButton(buttonName: btnDrop)
        saveButton(buttonName: btnSave)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func onClickDropButton(_ sender: Any) {
        if tblView.isHidden {
            animate(toogle: true)
        } else {
            animate(toogle: false)
        }
    }
    
    func animate(toogle: Bool) {
        if toogle {
            UIView.animate(withDuration: 0.3) {
                self.tblView.isHidden = false
            }
        } else {
            UIView.animate(withDuration: 0.3) {
                self.tblView.isHidden = true
            }
        }
    }
    
    func dropdownButton(buttonName: UIButton){
        let greykColor = (UIColor(red: 169/255, green: 169/255, blue: 169/255, alpha: 1.0))
        buttonName.layer.borderWidth = 1
        buttonName.layer.borderColor = greykColor.cgColor
        
        buttonName.setImage(UIImage(named:"dropdown.png"), for: .normal)
        buttonName.imageEdgeInsets = UIEdgeInsets(top: 6,left: 300,bottom: 6,right: 14)
        buttonName.titleEdgeInsets = UIEdgeInsets(top: 0,left: -30,bottom: 0,right: 34)
    }
    
    func saveButton(buttonName: UIButton){
        let greykColor = (UIColor(red: 169/255, green: 169/255, blue: 169/255, alpha: 1.0))
        buttonName.layer.borderWidth = 1
        buttonName.layer.borderColor = greykColor.cgColor
    }
    
    
    @IBAction func saveLocalOrgCode(_ sender: Any) {
        self.orgText = orgCode.text!
        performSegue(withIdentifier: "nextPage", sender: self)
        print(localText)
        print(localURL)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        var vc = segue.destination as! NextViewController
        vc.orgCodeName = self.orgText
        vc.localName = localText
        vc.localURLName = localURL
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return localList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = localList[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        btnDrop.setTitle("\(localList[indexPath.row])", for: .normal)
        localText = localList[indexPath.row]
        localURL = localURLList[indexPath.row]
        animate(toogle: false)
    }
}

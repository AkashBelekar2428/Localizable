//
//  ViewController.swift
//  language
//
//  Created by Akash Belekar on 07/07/23.
//

import UIKit

class ViewController: UIViewController{
   
    
    @IBOutlet weak var lblTitle:UILabel!
    @IBOutlet weak var txtInfo:UILabel!

    var languageList: [String] = [String]()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        languageList = ["Hindhi", "English", "Marathi"]
        changeLanguage(lang: "hi")
        
        
    }
    

    func changeLanguage(lang: String) {
        lblTitle.text = "title".localizeString(string: lang)
        txtInfo.text = "info".localizeString(string: lang)
    }
   }
extension ViewController: UIPickerViewDelegate,UIPickerViewDataSource{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return languageList.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return languageList[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if languageList[row] == "Marathi" {
            changeLanguage(lang: "mr-IN")
        } else if languageList[row] == "Hindhi" {
            changeLanguage(lang: "hi")
        } else {
            changeLanguage(lang: "en")
        }
    }
}

extension String {
    func localizeString(string: String) -> String {
        let path = Bundle.main.path(forResource: string, ofType: "lproj")
        let bundle = Bundle(path: path!)
        return NSLocalizedString(self, tableName: nil, bundle: bundle!, value: "", comment: "")
    }
}

//
//  SaveCollegeVC.swift
//  studentDemo
//
//  Created by shailesh on 27/04/19.
//  Copyright © 2019 shailesh. All rights reserved.
//

import UIKit

class SaveCollegeVC: UIViewController {
    //MARK:OUTLEST
     @IBOutlet weak var collegeNameTextField: UITextField!
     @IBOutlet weak var collegeUniversityTextField: UITextField!
     @IBOutlet weak var collegeCityTextField: UITextField!
     @IBOutlet weak var collegeAddressTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    //MARK:BUTTON ACTIONS
    @IBAction func onClickedSaveButton(_ sender: UIButton) {
        saveCollegeData()
    }
    

    //MARK: SAVE FUNCTION
    fileprivate func saveCollegeData() {
        guard let collegeName       = collegeNameTextField.text else {return}
        guard let collegeUniversity = collegeUniversityTextField.text else {return}
        guard let collegeCity       = collegeCityTextField.text else {return}
        guard let collegeAddress    = collegeAddressTextField.text else {return}
        
        
         let collegeInfoDict = [
            "collegeName"       : collegeName,
            "collegeUniversity" : collegeUniversity,
            "collegeCity"       : collegeCity,
            "collegeAddress"    : collegeAddress,
        ]
        DataBaseHelper.shareInstance.saveCollegeDataDB(collegeDict: collegeInfoDict)
    }

}

//
//  SaveCollegeVC.swift
//  studentDemo
//
//  Created by shailesh on 27/04/19.
//  Copyright © 2019 shailesh. All rights reserved.
//

import UIKit

class CollegeListVC: UIViewController {

    fileprivate var collegeArrList = [College]()
    @IBOutlet weak var listTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collegeArrList = DataBaseHelper.shareInstance.featchAllData()
        print(collegeArrList)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        updateUI()
    }
    
    fileprivate func updateUI() {
       collegeArrList = DataBaseHelper.shareInstance.featchAllData()
       self.listTableView.reloadData()
    }
    
    
    
    
    
    //MARK:BUTTON ACTION
    @IBAction private func onClickedSaveButton(_ sender: UIBarButtonItem) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "SaveCollegeVC") as! SaveCollegeVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}
//MARK:TABTE METHODS
extension CollegeListVC:UITableViewDelegate,UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return collegeArrList.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "StudentCell", for: indexPath) as! StudentCell
        cell.college = collegeArrList[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 215
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
           collegeArrList = DataBaseHelper.shareInstance.deleteCollege(index: indexPath.row)
            self.listTableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
}

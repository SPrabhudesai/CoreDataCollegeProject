//
//  SaveCollegeVC.swift
//  studentDemo
//
//  Created by shailesh on 27/04/19.
//  Copyright © 2019 shailesh. All rights reserved.
//
import UIKit
import CoreData
class DataBaseHelper: NSObject {
    static let shareInstance = DataBaseHelper()
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    //MARK: SAVE DATA INTO DATABASE
    public func saveCollegeDataDB(collegeDict:[String:String]) {
        let college = NSEntityDescription.insertNewObject(forEntityName: "College", into: context) as!
        College
        college.name = collegeDict["collegeName"]
        college.university = collegeDict["collegeUniversity"]
        college.city = collegeDict["collegeCity"]
        college.address = collegeDict["collegeAddress"]
        
        do {
            try context.save()
        } catch let err {
            print(err.localizedDescription)
        }
    }
    
    //MARK: FEATCH DATA FROM DATABASE
    public func featchAllData() -> [College]{
        var collegeArr = [College]()
        let featchRequest = NSFetchRequest<NSManagedObject>(entityName: "College")
        do{
            collegeArr = try context.fetch(featchRequest) as! [College]
        }catch let error{
            print("featch error \(error.localizedDescription)")
        }
        return collegeArr
    }
    
    //delete
    public func deleteCollege(index:Int) -> [College]{
        var collegeData = self.featchAllData()
        context.delete(collegeData[index])
        collegeData.remove(at: index)
        do {
            try context.save()
        } catch let err {
            print(err.localizedDescription)
        }
        return collegeData
    }
    
}

//
//  ViewController.swift
//  TableViewApp
//
//  Created by Pritam Dash on 08/06/22.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource {
//UITableViewDataSource protocol declares the methods to decide number of sections and number of rows.
    
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var nameSubjecTableView: UITableView!
    
    var nameArray = Array<String>()
    var subjectArray = Array<String>()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //Initialize arrays with some data
        nameArray.append("Pritam")
        nameArray.append("Mohan")
        nameArray.append("Rohan")
        
        subjectArray.append("C++")
        subjectArray.append("Android")
        subjectArray.append("iOS Development")
        subjectArray.append("DBMS")
        
        //Even if the 3 tableView functions are implemented the tableView object created above is not yet aware of these being implemented.
        
        //To make the tableView object aware we set the delegate and data source property.
        
        nameSubjecTableView.dataSource = self
        //self = current class. This class follows the dataSource protocl, so we attach the data source property of the tableView object to our class.
        
    }

    //To decide the number of sections - here we need two sections
    
    func numberOfSections(in tableView: UITableView) -> Int {
        //return the number of sections you want.
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //return the number of rows in each section
        //Here as we are chosing 2 sections, we need to specify how many rows per section needs.
//        if(section == 0){
//            return 3
//        }else if (section == 1){
//            return 3
//        }
        
        //To make it dynamic in nature :
        if(section == 0){
            return nameArray.count
        }else if(section == 1){
            return subjectArray.count
        }else{
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //To decide how the UI of the cell will look like we use this function.
        //This function executed for each row for each section.
        var myCell = UITableViewCell()
        //myCell.textLabel?.text = "Hello"
        //For displaying the actual content of the array instead of a constant value "Hello"
        
        //We check the section number which is stored in the indexPath variable to select the section for which the data needs to be displayed.
        
        if(indexPath.section == 0){
            //myCell.textLabel?.text = nameArray[0]
            //Index path also consists the position of the row for which the data need to be displayed.
            myCell.textLabel?.text = nameArray[indexPath.row]
            
            //So basically if "HelloWorld" is in 7 sections of the entire tableView the 1st row's actual position will be Section 0 row 0
            //For 3rd row = 0th Section 2nd Row
            //For 4th row = 1st section 0th Row
            //For 7th row  = 1st section 3rd Row.
        }
        if(indexPath.section == 1){
            myCell.textLabel?.text = subjectArray[indexPath.row]
        }
        return myCell
        
    }
    
    //Display the header of a section
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if(section == 0){
            return "Students"
        }
        else if(section == 1){
            return "Subjects"
        }
        else{
            return ""
        }
    }
    
    @IBAction func onAddClick(_ sender: UIButton) {
        let nm = nameField.text!
        if(nm.count > 0){
            nameArray.append(nm)
            nameSubjecTableView.reloadData()
            nameField.text = ""
        }
    }
    
}


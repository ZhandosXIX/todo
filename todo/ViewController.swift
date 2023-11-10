//
//  ViewController.swift
//  todo
//
//  Created by zhandos on 24.10.2023.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var textField: UITextView!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func Go(_ sender: Any) {
        let defaults = UserDefaults.standard
        
        let taskName = textField.text!
        
        var newTask = Taskitem()
        
        newTask.name = taskName
            
        do {
            if let data = defaults.data(forKey: "taskitemArray"){
                var array = try JSONDecoder().decode([Taskitem].self, from: data)
                
                array.append(newTask)
                
                let encodedata = try JSONEncoder().encode(array)
                
                defaults.set(encodedata, forKey: "taskitemArray")
            }else{
                let encodedata = try JSONEncoder().encode([newTask])
                
                defaults.set(encodedata, forKey: "taskitemArray")
            }

        } catch {
            print("unable to encode\(error)")
        }

        
//        if let array = defaults.array(forKey: "taskitemArray"){
//            taskarray = array as! [Taskitem]
//
//            taskarray.append(newTask)
//
//            defaults.set(taskarray, forKey: "taskitemArray")
//
//        }else{
//            let array = [newTask]
//            defaults.set(taskarray, forKey: "taskitemArray")
//        }
        
//        var taskarray:[String] = []
//
//        if let array = defaults.array(forKey: "taskArray"){
//           taskarray = array as! [String]
//
//            taskarray.append(taskName)
//
//            defaults.set(taskarray, forKey: "taskArray")
//        }else {
//            let array = [taskName]
//
//            defaults.set(array, forKey: "taskArray")
//        }
        
        textField.text = ""
    }
    
    
}


//
//  ViewController.swift
//  Exam LocalDataBase
//
//  Created by R94 on 12/04/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var idTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
 
    override func viewDidLoad() {
        super.viewDidLoad()
        Sqlite.createfile()
    }
    @IBAction func addDataButtonAction(_ sender: UIButton) {
        if let x = idTextField.text ,let y = Int(x){
            Sqlite.addData(id: y, name: nameTextField.text!)
        }
    }
    @IBAction func getDataButtonAction(_ sender: UIButton) {
        let naviget = storyboard?.instantiateViewController(withIdentifier: "ViewController2") as! ViewController2
        navigationController?.pushViewController(naviget, animated: true)
        
    }
    @IBAction func deleteDataButtonAction(_ sender: UIButton) {
        if let a = idTextField.text ,let b = Int(a)
        {
            if let x = idTextField.text ,let y = Int(x){
                Sqlite.deleteData(id: y, name: nameTextField.text!)
            }
    }
}

}

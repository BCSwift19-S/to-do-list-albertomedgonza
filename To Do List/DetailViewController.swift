//
//  DetailViewController.swift
//  To Do List
//
//  Created by Alberto Medina on 2/10/19.
//  Copyright © 2019 Alberto Medina. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet weak var toDoField: UITextField!
    @IBOutlet weak var savedBarButton: UIBarButtonItem!
    
    var toDoItem: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let toDoItem = toDoItem{
            toDoField.text = toDoItem
        }
        enableDesableSaveButton()
        toDoField.becomeFirstResponder()
    
}
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "UnwindFromSave" {
            toDoItem = toDoField.text
        }
    }
    
    func enableDesableSaveButton() {
        if let toDoFieldCount = toDoField.text?.count, toDoFieldCount > 0 {
            savedBarButton.isEnabled = true
        } else {
            savedBarButton.isEnabled = false
        }
    }
    
    @IBAction func toDoFieldChanged(_ sender: UITextField) {
        enableDesableSaveButton()
    }
    @IBAction func cancelPressed(_ sender: UIBarButtonItem) {
        let isPresentingInAddMode = presentingViewController is UINavigationController
        if isPresentingInAddMode {
            dismiss(animated: true, completion: nil)
        } else {
            navigationController?.popViewController(animated: true)
        }
        
    }
    
    
}

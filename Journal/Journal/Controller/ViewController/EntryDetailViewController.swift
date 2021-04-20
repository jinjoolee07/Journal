//
//  EntryDetailViewController.swift
//  Journal
//
//  Created by Jin Joo Lee on 4/19/21.
//

import UIKit

class EntryDetailViewController: UIViewController {
    
    var entry: Entry?
    
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var bodyTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        updateView()
        
    }
    
    @IBAction func saveButtonTapped(_ sender: Any) {
        if let _ = entry {
            print("to be implemented tomorrow")
        }
        
        guard let title = titleTextField.text, !title.isEmpty,
              let body = bodyTextField.text, !body.isEmpty else { return }
        
        EntryController.sharedInstance.createEntry(title: title, body: body)
    }
    
    @IBAction func clearButtonTapped(_ sender: Any) {
        titleTextField.text = ""
        bodyTextField.text = ""
    }
    
    func updateView() {
        guard let entry = entry else { return }
        titleTextField.text = entry.title
        bodyTextField.text = entry.body
    }
}

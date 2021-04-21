//
//  EntryDetailViewController.swift
//  Journal
//
//  Created by Jin Joo Lee on 4/19/21.
//

import UIKit

class EntryDetailViewController: UIViewController {
    
    var entry: Entry?
    var journal: Journal?
    
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var bodyTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        updateView()
        
    }
    
    @IBAction func saveButtonTapped(_ sender: Any) {
        guard let title = titleTextField.text, !title.isEmpty,
              let body = bodyTextField.text, !body.isEmpty,
              let journal = journal else { return }
        
        if let entry = entry {
            EntryController.updateEntry(entry: entry, newTitle: title, newBody: body)
        } else {
            EntryController.createEntryWith(title: title, body: body, journal: journal)
        }
        
        navigationController?.popViewController(animated: true)
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

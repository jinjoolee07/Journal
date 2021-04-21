//
//  JournalListViewController.swift
//  Journal
//
//  Created by Jin Joo Lee on 4/20/21.
//

import UIKit

class JournalListViewController: UIViewController {

    @IBOutlet weak var journalListTableView: UITableView!
    @IBOutlet weak var journalTitleTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        updateTableViewDelegate()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        journalListTableView.reloadData()
    }
    
    func updateTableViewDelegate() {
        journalListTableView.delegate = self
        journalListTableView.dataSource = self
        
        JournalController.sharedInstanstce.loadFromPersistenceStore()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toEntryList" {
            if let index = journalListTableView.indexPathForSelectedRow {
                guard let destinationVC = segue.destination as? EntryListTableViewController else { return }
                
                let journalToSend = JournalController.sharedInstanstce.journals[index.row]
                
                destinationVC.journal = journalToSend
            }
        }
    }
    
    @IBAction func createNewJournalButtonTapped(_ sender: Any) {
        guard let journalTitle = journalTitleTextField.text, !journalTitle.isEmpty else { return }
        
        JournalController.sharedInstanstce.createJournal(title: journalTitle)
        journalListTableView.reloadData()
        journalTitleTextField.text = ""
              
    }
}

extension JournalListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        JournalController.sharedInstanstce.journals.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "journalCell", for: indexPath)
        
        let journal = JournalController.sharedInstanstce.journals[indexPath.row]
        
        cell.textLabel?.text = journal.title
        cell.detailTextLabel?.text = "\(journal.entries.count)"
        
        return cell
    }
    
    
}

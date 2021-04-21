//
//  JournalController.swift
//  Journal
//
//  Created by Jin Joo Lee on 4/20/21.
//

import Foundation

class JournalController {
    
    static let sharedInstanstce = JournalController()
    
    var journals: [Journal] = []
    
    func createJournal(title: String) {
        let newJournal = Journal(title: title)
        journals.append(newJournal)
        
        saveToPersistentStorage()
    }
    
    func delete(journal: Journal) {
        guard let index = journals.firstIndex(of: journal) else { return }
        journals.remove(at: index)
        
        saveToPersistentStorage()
    }
    
    func addEntryTo(entry: Entry, journal: Journal) {
        journal.entries.append(entry)
        
        saveToPersistentStorage()
    }
    
    func removeEntryFrom(entry: Entry, journal: Journal) {
        guard let index = journal.entries.firstIndex(of: entry) else { return }
        journal.entries.remove(at: index)
        
        saveToPersistentStorage()
    }
    
    // MARK: - Persistence
    private func createPersistenceStore() -> URL {
        let urls = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let documentsDirectoryURL = urls[0].appendingPathComponent("Journal.json")
        return documentsDirectoryURL
    }
    
    private func saveToPersistentStorage() {
        do {
            let data = try JSONEncoder().encode(journals)
            try data.write(to: createPersistenceStore())
        } catch {
            print("Error encoding songs")
        }
    }
    
    func loadFromPersistenceStore() {
        do {
            let data = try Data(contentsOf: createPersistenceStore())
            journals = try JSONDecoder().decode([Journal].self, from: data)
        } catch {
            print("Error in decoding")
        }
    }
}

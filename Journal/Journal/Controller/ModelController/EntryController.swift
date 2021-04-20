//
//  EntryController.swift
//  Journal
//
//  Created by Jin Joo Lee on 4/19/21.
//

import Foundation

class EntryController {
    
    static let sharedInstance = EntryController()
    
    var entries: [Entry] = []
    
    func createEntry(title: String, body: String) {
        let newEntry = Entry(title: title, body: body)
        entries.append(newEntry)
        saveToPersistentStorage()
    }
    
    func deleteEntry(entry: Entry) {
        guard let index = entries.firstIndex(of: entry) else { return }
        entries.remove(at: index)
    }
    
    // MARK: - Persistence
    private func createPersistenceStore() -> URL {
        let urls = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let documentsDirectoryURL = urls[0].appendingPathComponent("Journal.json")
        return documentsDirectoryURL
    }
    
    private func saveToPersistentStorage() {
        do {
            let data = try JSONEncoder().encode(entries)
            try data.write(to: createPersistenceStore())
        } catch {
            print("Error encoding songs")
        }
    }
    
    func loadFromPersistenceStore() {
        do {
            let data = try Data(contentsOf: createPersistenceStore())
            entries = try JSONDecoder().decode([Entry].self, from: data)
        } catch {
            print("Error in decoding")
        }
    }
}

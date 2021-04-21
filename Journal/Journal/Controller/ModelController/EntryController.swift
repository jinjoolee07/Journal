//
//  EntryController.swift
//  Journal
//
//  Created by Jin Joo Lee on 4/19/21.
//

import Foundation

class EntryController {
    
    static func createEntryWith(title: String, body: String, journal: Journal) {
        let newEntry = Entry(title: title, body: body)
        JournalController.sharedInstanstce.addEntryTo(entry: newEntry, journal: journal)
    }
    
    static func deleteEntry(entry: Entry, journal: Journal) {
        JournalController.sharedInstanstce.removeEntryFrom(entry: entry, journal: journal)
    }
    
    static func updateEntry(entry: Entry, newTitle: String, newBody: String) {
        entry.title = newTitle
        entry.body = newBody
    }
}

//
//  Entry.swift
//  Journal
//
//  Created by Jin Joo Lee on 4/19/21.
//

import Foundation

class Entry : Codable {
    let title: String
    let body: String
    let timeStamp: Date
    let uuid: String

    init(title: String, body: String, timeStamp: Date = Date(), uuid: String = UUID().uuidString) {
        self.title = title
        self.body = body
        self.timeStamp = timeStamp
        self.uuid = uuid
    }
}

extension Entry: Equatable {
    static func == (lhs: Entry, rhs: Entry) -> Bool {
        return lhs.uuid == rhs.uuid
    }
}

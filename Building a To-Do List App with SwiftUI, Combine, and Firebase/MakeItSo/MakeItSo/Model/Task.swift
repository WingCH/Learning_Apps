//
//  Task.swift
//  MakeItSo
//
//  Created by WingCH on 30/10/2020.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

struct Task: Codable, Identifiable {
    @DocumentID var id: String?
    var title: String
    var completed: Bool
    @ServerTimestamp var createdTime: Timestamp?
}

#if DEBUG
let testDataTasks = [
    Task(title: "Implement UI", completed: true),
    Task(title: "Connect to Firebase", completed: false),
    Task(title: "????", completed: false),
    Task(title: "PROFIT!!!", completed: false)
]
#endif

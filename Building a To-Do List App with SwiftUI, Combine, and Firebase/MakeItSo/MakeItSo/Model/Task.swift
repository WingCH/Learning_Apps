//
//  Task.swift
//  MakeItSo
//
//  Created by WingCH on 30/10/2020.
//

import Foundation

struct Task: Identifiable {
    var id: String = UUID().uuidString
    var title: String
    var completed: Bool
}

#if DEBUG
let testDataTasks = [
    Task(title: "Implement UI", completed: true),
    Task(title: "Connect to Firebase", completed: false),
    Task(title: "????", completed: false),
    Task(title: "PROFIT!!!", completed: false)
]
#endif

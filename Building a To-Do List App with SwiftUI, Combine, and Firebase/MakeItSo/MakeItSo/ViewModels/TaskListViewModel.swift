//
//  TaskListViewModel.swift
//  MakeItSo
//
//  Created by WingCH on 30/10/2020.
//

import Foundation
import Combine

// https://github.com/schmidyy/SwiftUI-ListFetching/issues/3#issuecomment-528673860
class TaskListViewModel: ObservableObject {
    @Published var taskCellViewModels = [TaskCellViewModel]()
    
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        self.taskCellViewModels = testDataTasks.map({ task in
            TaskCellViewModel(task: task)
        })
    }
    
    func addTask(task: Task) {
        let taskVM = TaskCellViewModel(task: task)
        self.taskCellViewModels.append(taskVM)
    }
}

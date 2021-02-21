//
//  ContentView.swift
//  MakeItSo
//
//  Created by WingCH on 30/10/2020.
//

import SwiftUI

struct TaskListView: View {
    @ObservedObject var taskListVM = TaskListViewModel()
    
    let tasks = testDataTasks
    
    @State var presentAddNewItem = false
    @State var showSignInForm = false
    
    var body: some View {
        NavigationView{
            VStack(alignment: .leading) {
                List{
                    ForEach(taskListVM.taskCellViewModels) { taskCellVM in
                        TaskCell(taskCellVM: taskCellVM)
                    }
                    if presentAddNewItem {
                        TaskCell(taskCellVM: TaskCellViewModel(task: Task(title: "", completed: false))) { task in
                            self.taskListVM.addTask(task: task)
                            self.presentAddNewItem.toggle()
                        }
                    }
                }
                .listStyle(PlainListStyle())
                
                Button(action: {
                    self.presentAddNewItem.toggle()
                }) {
                    HStack {
                        Image(systemName: "plus.circle.fill")
                            .resizable()
                            .frame(width: 20, height: 20)
                        Text("Add New Task")
                    }
                }
                .padding()
                         
            }
            .sheet(isPresented: $showSignInForm, content: { 
                SingInView()
            })
            .navigationBarItems(trailing: Button(action: {
                self.showSignInForm.toggle()
            }, label: {
                Image(systemName: "person.circle")
            }))
            .navigationTitle("Tasks")
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        TaskListView()
    }
}


struct TaskCell: View {
    @ObservedObject var taskCellVM: TaskCellViewModel
    var onCommit: (Task) -> (Void) = {_ in }
    
    var body: some View {
        HStack {
            Image(systemName: taskCellVM.task.completed ? "checkmark.circle.fill" :"circle")
                .resizable()
                .frame(width: 20, height: 20)
                .onTapGesture(count: 1, perform: {
                    self.taskCellVM.task.completed.toggle()
                })
            TextField("Enter the task title", text: $taskCellVM.task.title, onCommit: {
                self.onCommit(self.taskCellVM.task)
            })
        }
    }
}

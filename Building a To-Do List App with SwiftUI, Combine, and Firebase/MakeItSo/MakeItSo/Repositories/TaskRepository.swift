//
//  TaskRepository.swift
//  MakeItSo
//
//  Created by CHAN Hong Wing on 30/10/2020.
//

import Foundation
import Firebase
import FirebaseFirestore
import FirebaseFirestoreSwift

class TaskRepository: ObservableObject {
    let db = Firestore.firestore()
    
    @Published var tasks = [Task]()
    
    init() {
        loadData()
    }
    
    func loadData() {
        let userId = Auth.auth().currentUser?.uid
        db.collection("tasks")
            .whereField("userId", isEqualTo: userId!)
            .order(by: "createdTime")
            .addSnapshotListener { (querySnapshot, error) in
                if let querySnapshot = querySnapshot {
                    self.tasks = querySnapshot.documents.compactMap({ document in
                        do {
                            let x = try document.data(as: Task.self)
                            return x
                        }catch {
                            print(error)
                        }
                        return nil
                    })
                }
            }
    }
    
    func addTask(_ task: Task){
        do {
            var addedTask = task
            let userId = Auth.auth().currentUser?.uid
            addedTask.userId = userId
            
            let _ = try db.collection("tasks").addDocument(from: addedTask)
            
        } catch {
            fatalError("Unable to encode task: \(error.localizedDescription)")
        }
    }
    
    func updateTask(_ task: Task){
        if let taskID = task.id {
            do {
                try db.collection("tasks")
                    .document(taskID)
                    .setData(from: task)
            } catch {
                fatalError("Unable to encode task: \(error.localizedDescription)")
            }
        }
    }
}

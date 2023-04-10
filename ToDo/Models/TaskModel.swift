//
//  TaskModel.swift
//  ToDo
//
//  Created by Irmina Charchuta on 04/03/2023.
//

import Foundation

struct TaskModel: Identifiable, Codable {
    
    // MARK: COMPONENTS
    
    let id: String
    let name: String
    let isCompleted: Bool
    
    init(id: String = UUID().uuidString, name: String, isCompleted: Bool) {
        self.id = id
        self.name = name
        self.isCompleted = isCompleted
    }
    
    // MARK: FUNCTIONS
    
    func updateCompletion() -> TaskModel {
        return TaskModel(id: id, name: name, isCompleted: !isCompleted)
    }
}

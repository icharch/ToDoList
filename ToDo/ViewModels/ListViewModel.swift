//
//  ListViewModel.swift
//  ToDo
//
//  Created by Irmina Charchuta on 05/03/2023.
//

import Foundation

class ListViewModel: ObservableObject {
    
    @Published var tasks: [TaskModel] = [] {
        didSet {
            saveItems()
        }
    }
    let tasksKey: String = "tasks_list"
    
    init() {
        getTasks()
    }
    
    // MARK: FUNCTIONS
    
    func getTasks() {
        guard
            let data = UserDefaults.standard.data(forKey: tasksKey),
            let savedTasks = try? JSONDecoder().decode([TaskModel].self, from: data)
        else { return }
        
        self.tasks = savedTasks
    }
    
    func deleteItem(indexSet: IndexSet) {
        tasks.remove(atOffsets: indexSet)
    }
    
    func moveItem(from: IndexSet, to: Int) {
        tasks.move(fromOffsets: from, toOffset: to)
    }
    
    func addItem(name: String) {
        let newTask = TaskModel(name: name, isCompleted: false)
        tasks.append(newTask)
    }
    
    func updateItem(task: TaskModel) {
        if let index = tasks.firstIndex(where: { $0.id == task.id }) {
            tasks[index] = task.updateCompletion()
        }
    }
    
    func saveItems() {
        if let encodedData = try? JSONEncoder().encode(tasks) {
            UserDefaults.standard.set(encodedData, forKey: tasksKey)
        }
    }
}

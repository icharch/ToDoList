//
//  ListRowView.swift
//  ToDo
//
//  Created by Irmina Charchuta on 04/03/2023.
//

import SwiftUI

struct ListRowView: View {
    
    let task: TaskModel
    
    var body: some View {
        HStack {
            checkImage
            taskName
            Spacer()
        }
        .padding(.vertical, 8)
    }
}

struct ListRowView_Previews: PreviewProvider {
    
    static var task1 = TaskModel(name: "task1", isCompleted: false)
    static var task2 = TaskModel(name: "task2", isCompleted: true)
    
    static var previews: some View {
        Group {
            ListRowView(task: task1)
            ListRowView(task: task2)
        }
    }
}

private extension ListRowView {
    
    //MARK: COMPONENTS
    
    var checkImage: some View {
        Image(task.isCompleted ? "check" : "circle-2")
            .resizable()
            .scaledToFit()
            .frame(width: 20, height: 20)
    }
    
    var taskName: some View {
        Text(task.name)
            .font(.custom("Quicksand-Regular", size: 23))
    }
}

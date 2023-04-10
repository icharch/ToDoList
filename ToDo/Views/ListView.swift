//
//  ListView.swift
//  ToDo
//
//  Created by Irmina Charchuta on 04/03/2023.
//

import SwiftUI

struct ListView: View {
    
    @EnvironmentObject var listViewModel: ListViewModel
    
    var body: some View {
        VStack {
            NavigationButtonsView()
            if listViewModel.tasks.isEmpty {
                NoTasksView()
            } else {
                List {
                    ForEach(listViewModel.tasks) { task in
                        ListRowView(task: task)
                            .onTapGesture {
                                withAnimation(.linear) {
                                    listViewModel.updateItem(task: task)
                                }
                            }
                    }
                    .onDelete(perform: listViewModel.deleteItem)
                    .onMove(perform: listViewModel.moveItem)
                }
                .listStyle(PlainListStyle())
            }
        }
            }
    }

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ListView()
        }
        .environmentObject(ListViewModel())
    }
}

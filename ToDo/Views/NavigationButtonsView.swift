//
//  NavigationButtonsView.swift
//  ToDo
//
//  Created by Irmina Charchuta on 04/03/2023.
//

import SwiftUI

struct NavigationButtonsView: View {
    var body: some View {
        VStack(spacing: 0) {
            HStack () {
                editButton
                Spacer()
                NavigationLink(destination: AddView(),
                               label: {
                    navigationLinkLabel
                })
            }
            .padding(14)
            myTasksText
        }
    }
}

struct NavigationButtonsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationButtonsView()
    }
}

private extension NavigationButtonsView {
    
    var editButton: some View {
        EditButton()
            .foregroundColor(.accentColor)
            .font(.custom("Quicksand-Regular", size: 20))
    }
    
    var navigationLinkLabel: some View {
        Image("add-3")
            .resizable()
            .scaledToFit()
            .frame(width: 40, height: 40)
    }
    
    var myTasksText: some View {
        Text("my tasks")
            .font(.custom("Quicksand-Bold", size: 40))
    }
}

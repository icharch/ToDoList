//
//  AddView.swift
//  ToDo
//
//  Created by Irmina Charchuta on 04/03/2023.
//

import SwiftUI

struct AddView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var listViewModel: ListViewModel
    @State var addTaskName: String = ""
    @State var alertTitle: String = ""
    @State var showAlert: Bool = false
    @State var animate: Bool = false

    
    var body: some View {
        ScrollView {
            VStack {
                addTaskText
                typeSomethingTextField
                saveButton
            }
            .frame(maxWidth: 400)
            .padding(14)
            .onAppear(perform: addAnimation)
        }
        .alert(isPresented: $showAlert, content: getAlert)
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            NavigationView {
                AddView()
            }
            .preferredColorScheme(.dark)
            .environmentObject(ListViewModel())
            NavigationView {
                AddView()
            }
            .preferredColorScheme(.light)
            .environmentObject(ListViewModel())
        }
    }
}

private extension AddView {
    
    //MARK: COMPONENTS
    
    var addTaskText: some View {
        Text("add your task")
            .font(.custom("Quicksand-Bold", size: 40))
    }
    
    var typeSomethingTextField: some View {
        TextField("type something here and...", text: $addTaskName)
            .padding(.horizontal)
            .frame(height: 55)
            .multilineTextAlignment(.center)
            .background(.ultraThinMaterial.opacity(0.3))
            .font(.custom("Quicksand-Regular", size: 23))
            .cornerRadius(10)
            .padding(.top, 30)
    }
    
    var saveButton: some View {
        Button(action: saveButtonPressed, label: {
            saveButtonLabel
        })
        .padding(.horizontal, animate ? 30 : 50)
        .shadow(
            color: animate ? Color.green.opacity(0.7) : Color.teal.opacity(0.7),
            radius: animate ? 30 : 10,
            x: 0,
            y: animate ? 50 : 30)
        .scaleEffect(animate ? 1.1 : 1.0)
        .offset(y: animate ? -5 : 0)
    }
    
    var saveButtonLabel: some View {
        Text("save")
            .foregroundColor(.white)
            .font(.custom("Quicksand-Regular", size: 23))
            .bold()
            .frame(height: 55)
            .frame(maxWidth: .infinity)
            .background(animate ? Color.green : Color.teal)
            .cornerRadius(10)
            .padding(.top, 15)
    }
    
    //MARK: FUNCTIONS
    
    func saveButtonPressed() {
        if textIsAppropriate() {
            listViewModel.addItem(name: addTaskName)
            presentationMode.wrappedValue.dismiss()
        }
    }
    
    func textIsAppropriate() -> Bool {
        if addTaskName.count < 3 {
            alertTitle = "your task is too short.. please type more characters!"
            showAlert.toggle()
            return false
        }
        return true
    }
    
    func getAlert() -> Alert {
        return Alert(title: Text(alertTitle))
    }
    
    func addAnimation() {
        guard !animate else { return }
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
            withAnimation(
                Animation
                    .easeInOut(duration: 2.0)
                    .repeatForever()
            ) {
                animate.toggle()
            }
        }
    }
    
}

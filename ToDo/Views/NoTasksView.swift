//
//  NoTasksView.swift
//  ToDo
//
//  Created by Irmina Charchuta on 07/03/2023.
//

import SwiftUI

struct NoTasksView: View {
    
    @State var animate: Bool = false
    
    var body: some View {
        ScrollView {
            VStack(spacing: 10) {
                noTaskText
                shortInfoText
                NavigationLink(destination: AddView(),
                               label: {
                    navigationButtonLabel
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
            .frame(maxWidth: 400)
            .multilineTextAlignment(.center)
            .onAppear(perform: addAnimation)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
      
}

struct NoTasksView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            NoTasksView()
        }
    }
}

private extension NoTasksView {
    
    // MARK: COMPONENTS

    var noTaskText: some View {
        Text("there are no tasks!")
            .font(.custom("Quicksand-Bold", size: 23))
            .foregroundColor(.teal)
    }
    
    var shortInfoText: some View {
        Text("are you a productive person? i think you should click on the add button and add a bunch of tasks to your todo list!")
            .font(.custom("Quicksand-Regular", size: 20))
            .padding()
            .padding(.bottom, 20)
    }
    
    var navigationButtonLabel: some View {
        Text("add something")
            .font(.custom("Quicksand-Regular", size: 23))
            .foregroundColor(.white)
            .bold()
            .frame(height: 55)
            .frame(maxWidth: 400)
            .background(animate ? Color.green : Color.teal)
            .cornerRadius(10)
    }
    
    // MARK: FUNCTIONS

    func addAnimation() {
        guard !animate else { return }
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
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


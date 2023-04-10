//
//  LaunchScreenView.swift
//  ToDo
//
//  Created by Irmina Charchuta on 08/03/2023.
//

import SwiftUI

struct LaunchScreenView: View {
    @State private var isActive = false
    @State private var size = 0.8
    @State private var opacity = 0.5
    
    var body: some View {
        if isActive {
            ListView()
        } else {
            VStack {
                VStack(spacing: 20) {
                    appIconImage
                    launchScreenText
                }
                .scaleEffect(size)
                .opacity(opacity)
                .onAppear {
                    withAnimation(.easeIn(duration: 1.2)) {
                        self.size = 0.9
                        self.opacity = 1.0
                    }
                }
            }
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
                    self.isActive = true
                }
            }
        }
    }
}


struct LaunchScreenView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            LaunchScreenView()
        }
    }
}

private extension LaunchScreenView {

    //MARK: COMPONENTS
    
    var appIconImage: some View {
        Image("AppIcon-2")
            .resizable()
            .scaledToFit()
            .frame(width: 180, height: 180)
            .cornerRadius(30)
    }
    
    var launchScreenText: some View {
        Text("let's do something!")
            .font(.custom("Quicksand-Bold", size: 30))
            .cornerRadius(10)
    }
}

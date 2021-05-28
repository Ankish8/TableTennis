//
//  ContentView.swift
//  TableTennis WatchKit Extension
//
//  Created by Ankish Khatri on 28/05/21.
//

import SwiftUI

struct ContentView: View {
    
    @State var isStartGame: Bool = false
    @State var isSettings: Bool = false
    var body: some View {
        ScrollView {
            VStack {
                Text("Are you ready?").padding()
                Image("logo")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 70)
                Spacer()
                Spacer()
                
                NavigationLink(
                    destination: gameView(),
                    isActive: $isStartGame,
                    label: {
                        Text("Start Game")
                    })
                NavigationLink(
                    destination: SettingsView(),
                    isActive: $isSettings,
                    label: {
                        Text("Settings")
                    })
            }
        }
        
    }
}




struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        
                ContentView()
                    .environmentObject(TennisViewModel())
        
    }
}

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
    @State var isTournamentScore: Bool = false
    @State private var selection: Int = 2
    var body: some View {
        TabView(selection: $selection) {
            SettingsView()
                .tabItem { Text("Settings Page") }
                .tag(1)
            ZStack {
                HStack {
                    VStack(alignment: .leading, spacing: -10) {
                        Text("Are you")
                        Text("Ready")
                            .foregroundColor(.gray)
                        Text("To play?")
                        Spacer()
                        Image(systemName: "arrow.right")
                            .font(.title3)
                            .offset(y: 20)
                            .foregroundColor(.gray)
                            
                    }
                    .font(.title)
                    .offset(y: -20)
                    Spacer()
                }
                Image("logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100)
                    .offset(x: 50, y: 50)
            }
            .padding()
            .tabItem { Text("Home Page") }.tag(2)
            gameView()
                .tabItem { Text("Game View") }.tag(3)
            MatchHistory()
                .tabItem { Text("Match History") }.tag(4)
        }
        
        
        
        
        
        
        
  //OLD UI
        /*TabView {
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
                            Text("Quick Match")
                        })
                    
                    NavigationLink(
                        destination: SettingsView(),
                        isActive: $isSettings,
                        label: {
                            Text("Settings")
                        })
                }
            }
            .tabItem {
                Text("This is a try")
            }
            MatchHistory()
                .tabItem {
                    Text("Second one")
                }
        }*/
        
    }
}




struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        
                ContentView()
                    .environmentObject(TennisViewModel())
        
    }
}

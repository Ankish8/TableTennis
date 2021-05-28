//
//  ContentView.swift
//  TableTennis WatchKit Extension
//
//  Created by Ankish Khatri on 28/05/21.
//

import SwiftUI

struct ContentView: View {
    @State var isClicked: Bool = false
    var body: some View {
        VStack {
            Text("Are you ready?").padding()
            Image("logo")
                .resizable()
                .scaledToFit()
            Spacer()
            Spacer()
            
            NavigationLink(
                destination: gameView(),
                isActive: $isClicked,
                label: {
                    Text("Start Game")
                })
        }
        
    }
}




struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
                ContentView()
        
    }
}

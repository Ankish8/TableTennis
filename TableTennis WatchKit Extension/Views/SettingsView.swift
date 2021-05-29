//
//  SettingsView.swift
//  TableTennis WatchKit Extension
//
//  Created by Ankish Khatri on 28/05/21.
//

import SwiftUI

struct SettingsView: View {

    @EnvironmentObject var tennisViewModel: TennisViewModel
    var body: some View {
        VStack {
            List {
                Picker(selection: $tennisViewModel.maxPoints, label: Text("Match Points")) {
                    Text("11").tag(11)
                    Text("21").tag(21)
                    
                }
                Picker(selection: $tennisViewModel.playerName1, label: Text("Player 1"), content: {
                    Text("Ankish").tag("Ankish")
                    Text("Somu").tag("Somu")
                    Text("Swati").tag("Swati")
                    Text("Papaji").tag("Papaji")
                })
                Picker(selection: $tennisViewModel.playerName2, label: Text("Player 2"), content: {
                    Text("Ankish").tag("Ankish")
                    Text("Somu").tag("Somu")
                    Text("Swati").tag("Swati")
                    Text("Papaji").tag("Papaji")
                })
                
            }
        }
        
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
            .environmentObject(TennisViewModel())
    }
}

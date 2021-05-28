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

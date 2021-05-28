//
//  SettingsView.swift
//  TableTennis WatchKit Extension
//
//  Created by Ankish Khatri on 28/05/21.
//

import SwiftUI

struct SettingsView: View {
    @State var maxPoints: Int = 11
    var body: some View {
        VStack {
            List {
                Picker(selection: $maxPoints, label: Text("Match Points")) {
                    Text("11").tag(1)
                    Text("21").tag(2)
                }
                
            }
        }
        
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}

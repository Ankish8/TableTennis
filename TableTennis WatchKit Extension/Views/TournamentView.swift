//
//  TournamentView.swift
//  TableTennis
//
//  Created by Ankish Khatri on 28/05/21.
//

import SwiftUI

struct TournamentView: View {
    @State var is3Match: Bool = false
    var body: some View {
        VStack {
            List {
                NavigationLink(
                    destination: TournamentScoreView(),
                    isActive: $is3Match,
                    label: {
                        Text("3 Matches")
                            
                    })
                    /*
                    .listRowPlatterColor(Color.blue)
                    .foregroundColor(Color.black) */
            }
        }
        

    }
    
}

struct TournamentView_Previews: PreviewProvider {
    static var previews: some View {
        TournamentView()
    }
}

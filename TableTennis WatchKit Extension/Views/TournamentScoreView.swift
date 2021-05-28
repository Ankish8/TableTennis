//
//  TournamentScoreView.swift
//  TableTennis WatchKit Extension
//
//  Created by Ankish Khatri on 28/05/21.
//

import SwiftUI

struct TournamentScoreView: View {
    @EnvironmentObject var tennisViewModel: TennisViewModel
    var body: some View {
        ScrollView {
            VStack {
                Text("Match History")
                    .font(.caption)
                Divider()
                VStack {
                   
                    ForEach(tennisViewModel.match) { item in
                        MatchListView(item: item)
                    }
                    
                }
                .padding()
                
                Spacer()
                
            }
        }
        
    }
}

struct TournamentScoreView_Previews: PreviewProvider {
    static var previews: some View {
        TournamentScoreView()
            .environmentObject(TennisViewModel())
    }
}

//
//  MatchHistory.swift
//  TableTennis WatchKit Extension
//
//  Created by Ankish Khatri on 28/05/21.
//

import SwiftUI

struct MatchHistory: View {
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
                Divider()
                SummaryView()
            }
        }
        
        
    }
}

struct TournamentScoreView_Previews: PreviewProvider {
    static var previews: some View {
        MatchHistory()
            .environmentObject(TennisViewModel())
    }
}

// MARK: Summary View
struct SummaryView: View {
    
    @EnvironmentObject var tennisViewModel: TennisViewModel
    @State var deleteHistory: Bool = false
    var body: some View {
        VStack(alignment: .leading) {
            Text("Summary")
                .font(.subheadline)
                .foregroundColor(.gray)
            Divider()
            HStack {
                Text("\(tennisViewModel.playerName1): ")
                Text("Won: \(tennisViewModel.player1TotalWin)")
                Text("Lost: \(tennisViewModel.matchcount - tennisViewModel.player1TotalWin)")
            }
            .font(.caption2)
            
            HStack {
                Text("\(tennisViewModel.playerName2): ")
                Text("Won: \(tennisViewModel.player2TotalWin)")
                Text("Lost: \(tennisViewModel.matchcount - tennisViewModel.player2TotalWin)")
            }
            .font(.caption2)
            .alert(isPresented: $deleteHistory, content: {
                Alert(title: Text("Deleted all the recent matches"))
            })
        }
        
        .font(.caption)
        Button("Delete History") {
            tennisViewModel.deleteHistory()
            tennisViewModel.player1TotalWin = 0
            tennisViewModel.player2TotalWin = 0
            tennisViewModel.matchcount = 0
            deleteHistory.toggle()
        }
        .foregroundColor(.red)
        
    }
}

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
                Text("\(tennisViewModel.numberOfMatches) Matches Tournament")
                    .font(.caption)
                Divider()
                VStack {
                    HStack {
                        Text("Match 1")
                            .font(.caption)
                    }
                    .padding(.bottom)
                    HStack {
                        Text("\(tennisViewModel.playerName[0]):")
                            .font(.footnote)
                        Text("11")
                            .font(.footnote)
                            .frame(width: 18, height: 18, alignment: .center)
                            .background(tennisViewModel.p1Won ? Color.green : Color.red)
                            .foregroundColor(tennisViewModel.p1Won ? Color.black : Color.white)
                            Spacer()
                        Text("Somu:")
                            .font(.footnote)
                        Text("9")
                            .font(.footnote)
                            .frame(width: 18, height: 18, alignment: .center)
                            .background(tennisViewModel.p1Won ? Color.red : Color.green)
                            .foregroundColor(tennisViewModel.p1Won ? Color.white : Color.black)
                            .font(.footnote)
                            
                    }
                    Text("\(tennisViewModel.p1Won ? tennisViewModel.playerName[0] : tennisViewModel.playerName[1]) won by \(tennisViewModel.p1Won ? tennisViewModel.m1p1Score - tennisViewModel.m1p2Score : tennisViewModel.m1p2Score - tennisViewModel.m1p1Score) points.")
                        .font(.caption2)
                        .foregroundColor(Color.orange)
                    Divider()
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

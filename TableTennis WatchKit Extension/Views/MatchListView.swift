//
//  MatchListView.swift
//  TableTennis WatchKit Extension
//
//  Created by Ankish Khatri on 28/05/21.
//

import SwiftUI

struct MatchListView: View {
    @EnvironmentObject var tennisViewModel: TennisViewModel
    let item: Matches
    var body: some View {
        VStack {
            HStack {
                Text("Match \(item.MatchCount)")
                    .font(.caption)
            }
            .padding(.bottom)
            
            HStack {
                Text("\(tennisViewModel.playerName[0]):")
                    .font(.footnote)
                Text("\(item.player1Score)")
                    .font(.footnote)
                    .frame(width: 18, height: 18, alignment: .center)
                    .background(item.player1Score > item.player2Score ? Color.green : Color.red)
                    .foregroundColor(item.player1Score > item.player2Score ? Color.black : Color.white)
                    Spacer()
                Text("Somu:")
                    .font(.footnote)
                Text("\(item.player2Score)")
                    .font(.footnote)
                    .frame(width: 18, height: 18, alignment: .center)
                    .background(item.player1Score > item.player2Score ? Color.red : Color.green)
                    .foregroundColor(item.player1Score > item.player2Score ? Color.white : Color.black)
                    .font(.footnote)
            }
            
            Text("\(item.winnerName) has won")
                .font(.caption2)
                .foregroundColor(Color.orange)
                .padding(.top, 4)
            Divider()
        }
        
    }
}

struct MatchListView_Previews: PreviewProvider {
    static var item1 = Matches(player1Score: 10, player2Score: 15, winnerName: "Ankish", MatchCount: 1)
    static var previews: some View {
        
        MatchListView(item: item1)
            .environmentObject(TennisViewModel())
            .previewLayout(.sizeThatFits)
    }
}

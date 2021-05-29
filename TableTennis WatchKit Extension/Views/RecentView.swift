//
//  RecentView.swift
//  TableTennis WatchKit Extension
//
//  Created by Ankish Khatri on 29/05/21.
//

import SwiftUI

struct RecentView: View {
    @EnvironmentObject var tennisViewModel: TennisViewModel
    let recent: Matches
    var body: some View {
        
        
            Rectangle()
                .frame(width: 19.13, height: 20, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .foregroundColor(recent.player1Score > recent.player2Score ? Color(#colorLiteral(red: 0.2039215686, green: 0.7803921569, blue: 0.3490196078, alpha: 1)) : Color(#colorLiteral(red: 1, green: 0.345446527, blue: 0.2585960031, alpha: 1)))
                .cornerRadius(5)
                .overlay(
                    Text(recent.player1Score > recent.player2Score ? "W" : "L")
                        .font(.system(size: 15))
                )
        
            
        
    }
}

struct RecentView_Previews: PreviewProvider {
    static var recent1 = Matches(id: UUID().uuidString, player1Score: 0, player2Score: 0, winnerName: "Ankish", MatchCount: 1)
    static var previews: some View {
        RecentView(recent: recent1)
            .environmentObject(TennisViewModel())
            .previewLayout(.sizeThatFits)
    }
}

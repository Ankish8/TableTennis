//
//  TennisViewModel.swift
//  TableTennis WatchKit Extension
//
//  Created by Ankish Khatri on 28/05/21.
//




import Foundation
class TennisViewModel : ObservableObject {
    @Published var match: [Matches] = []
    @Published var score1: Int = 0
    @Published var score2: Int = 0
    @Published var matchPoint: Bool = false
    @Published var isWon: Bool = false
    @Published var winner: String = ""
    @Published var maxPoints: Int = 11
    @Published var matchcount: Int = 0
    @Published var playerName: [String] = ["Ankish", "Somu", "Swati", "Papaji"]
    @Published var player1TotalWin: Int = 0
    @Published var player2TotalWin: Int = 0
    
    func updateMatch(score1 : Int, score2 : Int, winnerName: String, MatchCount: Int) {
        let newMatch = Matches(player1Score: score1, player2Score: score2, winnerName: winner, MatchCount: matchcount)
        match.append(newMatch)
    }
    func deleteHistory() {
        match.removeAll()
    }
    func checkGamePoint() {
        if score1 <= (maxPoints - 1)  && score2 <= (maxPoints - 1) {
            if (score1 == (maxPoints - 1) && score2 == (maxPoints - 1)) {
                matchPoint = false
                
            }
            else if (score1 == (maxPoints - 1) || score2 == (maxPoints - 1)) {
                matchPoint = true
            }
        }
        else {
             
            if score1 > score2 + 1 {
                winner = "Ankish"
                matchcount += 1
                player1TotalWin += 1
                updateMatch(score1: score1, score2: score2, winnerName: winner, MatchCount: matchcount)
                isWon.toggle()
                
            }
            else if score2 > score1 + 1 {
                winner = "Somu"
                player2TotalWin += 1
                matchcount += 1
                updateMatch(score1: score1, score2: score2, winnerName: winner, MatchCount: matchcount)
                isWon.toggle()
                
            }
            else if score1 != score2 {
               matchPoint = true
           }
            else {
                matchPoint = false
            }
        }
    }
    
    func updateScore(score: Int, side1: Bool) {
        if side1 {
            self.score1 = score + 1
        }
        else {
            self.score2 = score + 1
        }
        
        checkGamePoint()
    }
    func reset() {
        score1 = 0
        score2 = 0
        matchPoint = false
        isWon = false
    }
    
}

//
//  TennisViewModel.swift
//  TableTennis WatchKit Extension
//
//  Created by Ankish Khatri on 28/05/21.
//


import SwiftUI

import Foundation
class TennisViewModel : ObservableObject {
    @Published var match: [Matches] = [] {
        didSet {
            saveData()
        }
    }
    init() {
        getData()
    }
    let matchKey: String = "match_list"
    @Published var score1: Int = 0
    @Published var score2: Int = 0
    @Published var isWon: Bool = false
    @Published var winner: String = ""
    @Published var maxPoints: Int = 11
    @Published var matchcount: Int = 0
    @AppStorage("p1") var playerName1 = "Ankish"
    @AppStorage("p2") var playerName2 = "Somu"
    @Published var player1TotalWin: Int = 0
    @Published var player2TotalWin: Int = 0
    @Published var MatchPoint: Bool = false //Match Point
    
    // MARK: UpdateMatch
    func updateMatch(score1 : Int, score2 : Int, winnerName: String, MatchCount: Int) {
        let newMatch = Matches(id: UUID().uuidString, player1Score: score1, player2Score: score2, winnerName: winner, MatchCount: matchcount)
        match.append(newMatch)
    }
    // MARK: Delete history
    func deleteHistory() {
        match.removeAll()
    }
    
    // MARK: CheckGamePoint
    func checkGamePoint() {
        if score1 <= (maxPoints - 1)  && score2 <= (maxPoints - 1) {
            if (score1 == (maxPoints - 1) && score2 == (maxPoints - 1)) {
                MatchPoint = false
                
            }
            else if (score1 == (maxPoints - 1) || score2 == (maxPoints - 1)) {
                if !MatchPoint {
                    MatchPoint = true
                    WKInterfaceDevice.current().play(.start)
                }
            }
        }
        else {
             
            if score1 > score2 + 1 {
                winner = playerName1
                matchcount += 1
                player1TotalWin += 1
                updateMatch(score1: score1, score2: score2, winnerName: winner, MatchCount: matchcount)
                isWon.toggle()
                WKInterfaceDevice.current().play(.success)
                
            }
            else if score2 > score1 + 1 {
                winner = playerName2
                player2TotalWin += 1
                matchcount += 1
                updateMatch(score1: score1, score2: score2, winnerName: winner, MatchCount: matchcount)
                isWon.toggle()
                WKInterfaceDevice.current().play(.failure)
                
            }
            else if score1 != score2 {
                if !MatchPoint {
                    MatchPoint = true
                    WKInterfaceDevice.current().play(.start)
                }
               
                
           }
            else {
                MatchPoint = false
            }
        }
    }
    
    // MARK: UpdateScore
    func updateScore(score: Int, side1: Bool) {
        if side1 {
            self.score1 = score + 1
        }
        else {
            self.score2 = score + 1
        }
        
        checkGamePoint()
    }
    
    // MARK: Reset
    func reset() {
        score1 = 0
        score2 = 0
        MatchPoint = false
        isWon = false
    }
    
    // MARK: SaveData in UserDefaults
    func saveData() {
        if let encodedData = try? JSONEncoder().encode(match) {
            UserDefaults.standard.set(encodedData, forKey: matchKey)
        }
    }
    
    // MARK: GetData from UserDefaults
    func getData() {
        guard
            let data = UserDefaults.standard.data(forKey: matchKey),
            let savedData = try? JSONDecoder().decode([Matches].self, from: data)
        else {
            return
            
        }
        self.match = savedData
        
    }
    
    
}

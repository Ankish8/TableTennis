//
//  TennisViewModel.swift
//  TableTennis WatchKit Extension
//
//  Created by Ankish Khatri on 28/05/21.
//

import Foundation
class TennisViewModel : ObservableObject {
    @Published var score1: Int = 0
    @Published var score2: Int = 0
    @Published var matchPoint: Bool = false
    @Published var isWon: Bool = false
    @Published var winner: String = ""
    @Published var maxPoints: Int = 11
    
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
                winner = "Player 1"
                isWon.toggle()
                
            }
            else if score2 > score1 + 1 {
                winner = "Player 2"
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
    
}
